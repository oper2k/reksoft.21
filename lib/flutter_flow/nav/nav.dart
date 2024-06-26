import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? HOMERedirectWidget() : LogInWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HOMERedirectWidget() : LogInWidget(),
        ),
        FFRoute(
          name: 'Log_In',
          path: '/logIn',
          builder: (context, params) => LogInWidget(),
        ),
        FFRoute(
          name: 'VacancyList_applicant',
          path: '/vacancyListApplicant',
          requireAuth: true,
          builder: (context, params) => VacancyListApplicantWidget(),
        ),
        FFRoute(
          name: 'Sign_In',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'News_all',
          path: '/newsAll',
          builder: (context, params) => NewsAllWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'Notifications',
          path: '/notifications',
          requireAuth: true,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: 'Vacancy_fullInfo',
          path: '/vacancyFullInfo',
          asyncParams: {
            'vacancy': getDoc(['vacancies'], VacanciesRecord.fromSnapshot),
          },
          builder: (context, params) => VacancyFullInfoWidget(
            vacancy: params.getParam(
              'vacancy',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'HR_Candidates',
          path: '/hRCandidates',
          requireAuth: true,
          builder: (context, params) => HRCandidatesWidget(
            vacancy: params.getParam(
              'vacancy',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vacancies'],
            ),
          ),
        ),
        FFRoute(
          name: 'News_single',
          path: '/newsSingle',
          asyncParams: {
            'newsDoc': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewsSingleWidget(
            newsDoc: params.getParam(
              'newsDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Chat_Page',
          path: '/chatPage',
          requireAuth: true,
          asyncParams: {
            'vacancy': getDoc(['vacancies'], VacanciesRecord.fromSnapshot),
            'response': getDoc(['response'], ResponseRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            vacancy: params.getParam(
              'vacancy',
              ParamType.Document,
            ),
            response: params.getParam(
              'response',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'HOME_Redirect',
          path: '/hOMERedirect',
          requireAuth: true,
          builder: (context, params) => HOMERedirectWidget(),
        ),
        FFRoute(
          name: 'restorePassword',
          path: '/restorePassword',
          builder: (context, params) => RestorePasswordWidget(),
        ),
        FFRoute(
          name: 'EditProfile_main',
          path: '/editProfileMain',
          requireAuth: true,
          builder: (context, params) => EditProfileMainWidget(),
        ),
        FFRoute(
          name: 'EditProfile_education',
          path: '/editProfileEducation',
          requireAuth: true,
          builder: (context, params) => EditProfileEducationWidget(),
        ),
        FFRoute(
          name: 'EditProfile_works',
          path: '/editProfileWorks',
          requireAuth: true,
          builder: (context, params) => EditProfileWorksWidget(),
        ),
        FFRoute(
          name: 'News_preview',
          path: '/newsPreview',
          requireAuth: true,
          builder: (context, params) => NewsPreviewWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            hashtags: params.getParam<String>(
              'hashtags',
              ParamType.String,
              isList: true,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            content: params.getParam(
              'content',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'News_createEdit',
          path: '/newsCreateEdit',
          requireAuth: true,
          asyncParams: {
            'newsDoc': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewsCreateEditWidget(
            newsDoc: params.getParam(
              'newsDoc',
              ParamType.Document,
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'vacancy_createEdit',
          path: '/vacancyCreateEdit',
          requireAuth: true,
          asyncParams: {
            'vacancyDraft': getDoc(['vacancies'], VacanciesRecord.fromSnapshot),
          },
          builder: (context, params) => VacancyCreateEditWidget(
            vacancyDraft: params.getParam(
              'vacancyDraft',
              ParamType.Document,
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'VacancyList_hr',
          path: '/vacancyListHr',
          requireAuth: true,
          builder: (context, params) => VacancyListHrWidget(),
        ),
        FFRoute(
          name: 'My_Responses',
          path: '/myResponses',
          requireAuth: true,
          builder: (context, params) => MyResponsesWidget(),
        ),
        FFRoute(
          name: 'userFullInfo',
          path: '/userFullInfo',
          asyncParams: {
            'candidat': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => UserFullInfoWidget(
            candidat: params.getParam(
              'candidat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
            recipient: params.getParam(
              'recipient',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          requireAuth: true,
          builder: (context, params) => Chat2MainWidget(),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/logIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 15.0,
                    height: 15.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
