import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "birthday_date" field.
  DateTime? _birthdayDate;
  DateTime? get birthdayDate => _birthdayDate;
  bool hasBirthdayDate() => _birthdayDate != null;

  // "resume_summary" field.
  String? _resumeSummary;
  String get resumeSummary => _resumeSummary ?? '';
  bool hasResumeSummary() => _resumeSummary != null;

  // "resume_link" field.
  String? _resumeLink;
  String get resumeLink => _resumeLink ?? '';
  bool hasResumeLink() => _resumeLink != null;

  // "workFormat" field.
  String? _workFormat;
  String get workFormat => _workFormat ?? '';
  bool hasWorkFormat() => _workFormat != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "social_links" field.
  List<String>? _socialLinks;
  List<String> get socialLinks => _socialLinks ?? const [];
  bool hasSocialLinks() => _socialLinks != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "isAccountDeleted" field.
  bool? _isAccountDeleted;
  bool get isAccountDeleted => _isAccountDeleted ?? false;
  bool hasIsAccountDeleted() => _isAccountDeleted != null;

  // "workPlaces" field.
  List<WorkPlaceStruct>? _workPlaces;
  List<WorkPlaceStruct> get workPlaces => _workPlaces ?? const [];
  bool hasWorkPlaces() => _workPlaces != null;

  // "languages" field.
  String? _languages;
  String get languages => _languages ?? '';
  bool hasLanguages() => _languages != null;

  // "educationPlaces" field.
  List<EducationPlaceStruct>? _educationPlaces;
  List<EducationPlaceStruct> get educationPlaces =>
      _educationPlaces ?? const [];
  bool hasEducationPlaces() => _educationPlaces != null;

  // "isResumeParsingFinished" field.
  bool? _isResumeParsingFinished;
  bool get isResumeParsingFinished => _isResumeParsingFinished ?? false;
  bool hasIsResumeParsingFinished() => _isResumeParsingFinished != null;

  // "hr_position" field.
  String? _hrPosition;
  String get hrPosition => _hrPosition ?? '';
  bool hasHrPosition() => _hrPosition != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "hr_companyName" field.
  String? _hrCompanyName;
  String get hrCompanyName => _hrCompanyName ?? '';
  bool hasHrCompanyName() => _hrCompanyName != null;

  // "chat_summary" field.
  String? _chatSummary;
  String get chatSummary => _chatSummary ?? '';
  bool hasChatSummary() => _chatSummary != null;

  // "responsedVacanciesList" field.
  List<DocumentReference>? _responsedVacanciesList;
  List<DocumentReference> get responsedVacanciesList =>
      _responsedVacanciesList ?? const [];
  bool hasResponsedVacanciesList() => _responsedVacanciesList != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "availableDateStart" field.
  DateTime? _availableDateStart;
  DateTime? get availableDateStart => _availableDateStart;
  bool hasAvailableDateStart() => _availableDateStart != null;

  // "availableDateEnd" field.
  DateTime? _availableDateEnd;
  DateTime? get availableDateEnd => _availableDateEnd;
  bool hasAvailableDateEnd() => _availableDateEnd != null;

  // "availableMorningHours" field.
  List<String>? _availableMorningHours;
  List<String> get availableMorningHours => _availableMorningHours ?? const [];
  bool hasAvailableMorningHours() => _availableMorningHours != null;

  // "availableDayHours" field.
  List<String>? _availableDayHours;
  List<String> get availableDayHours => _availableDayHours ?? const [];
  bool hasAvailableDayHours() => _availableDayHours != null;

  // "availableEveningHours" field.
  List<String>? _availableEveningHours;
  List<String> get availableEveningHours => _availableEveningHours ?? const [];
  bool hasAvailableEveningHours() => _availableEveningHours != null;

  // "weekends" field.
  List<String>? _weekends;
  List<String> get weekends => _weekends ?? const [];
  bool hasWeekends() => _weekends != null;

  // "lockedDates" field.
  List<AvailableDatesStruct>? _lockedDates;
  List<AvailableDatesStruct> get lockedDates => _lockedDates ?? const [];
  bool hasLockedDates() => _lockedDates != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _birthdayDate = snapshotData['birthday_date'] as DateTime?;
    _resumeSummary = snapshotData['resume_summary'] as String?;
    _resumeLink = snapshotData['resume_link'] as String?;
    _workFormat = snapshotData['workFormat'] as String?;
    _surname = snapshotData['surname'] as String?;
    _socialLinks = getDataList(snapshotData['social_links']);
    _city = snapshotData['city'] as String?;
    _isAccountDeleted = snapshotData['isAccountDeleted'] as bool?;
    _workPlaces = getStructList(
      snapshotData['workPlaces'],
      WorkPlaceStruct.fromMap,
    );
    _languages = snapshotData['languages'] as String?;
    _educationPlaces = getStructList(
      snapshotData['educationPlaces'],
      EducationPlaceStruct.fromMap,
    );
    _isResumeParsingFinished = snapshotData['isResumeParsingFinished'] as bool?;
    _hrPosition = snapshotData['hr_position'] as String?;
    _website = snapshotData['website'] as String?;
    _hrCompanyName = snapshotData['hr_companyName'] as String?;
    _chatSummary = snapshotData['chat_summary'] as String?;
    _responsedVacanciesList =
        getDataList(snapshotData['responsedVacanciesList']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _availableDateStart = snapshotData['availableDateStart'] as DateTime?;
    _availableDateEnd = snapshotData['availableDateEnd'] as DateTime?;
    _availableMorningHours = getDataList(snapshotData['availableMorningHours']);
    _availableDayHours = getDataList(snapshotData['availableDayHours']);
    _availableEveningHours = getDataList(snapshotData['availableEveningHours']);
    _weekends = getDataList(snapshotData['weekends']);
    _lockedDates = getStructList(
      snapshotData['lockedDates'],
      AvailableDatesStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  DateTime? birthdayDate,
  String? resumeSummary,
  String? resumeLink,
  String? workFormat,
  String? surname,
  String? city,
  bool? isAccountDeleted,
  String? languages,
  bool? isResumeParsingFinished,
  String? hrPosition,
  String? website,
  String? hrCompanyName,
  String? chatSummary,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? title,
  DateTime? availableDateStart,
  DateTime? availableDateEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'birthday_date': birthdayDate,
      'resume_summary': resumeSummary,
      'resume_link': resumeLink,
      'workFormat': workFormat,
      'surname': surname,
      'city': city,
      'isAccountDeleted': isAccountDeleted,
      'languages': languages,
      'isResumeParsingFinished': isResumeParsingFinished,
      'hr_position': hrPosition,
      'website': website,
      'hr_companyName': hrCompanyName,
      'chat_summary': chatSummary,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'title': title,
      'availableDateStart': availableDateStart,
      'availableDateEnd': availableDateEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.birthdayDate == e2?.birthdayDate &&
        e1?.resumeSummary == e2?.resumeSummary &&
        e1?.resumeLink == e2?.resumeLink &&
        e1?.workFormat == e2?.workFormat &&
        e1?.surname == e2?.surname &&
        listEquality.equals(e1?.socialLinks, e2?.socialLinks) &&
        e1?.city == e2?.city &&
        e1?.isAccountDeleted == e2?.isAccountDeleted &&
        listEquality.equals(e1?.workPlaces, e2?.workPlaces) &&
        e1?.languages == e2?.languages &&
        listEquality.equals(e1?.educationPlaces, e2?.educationPlaces) &&
        e1?.isResumeParsingFinished == e2?.isResumeParsingFinished &&
        e1?.hrPosition == e2?.hrPosition &&
        e1?.website == e2?.website &&
        e1?.hrCompanyName == e2?.hrCompanyName &&
        e1?.chatSummary == e2?.chatSummary &&
        listEquality.equals(
            e1?.responsedVacanciesList, e2?.responsedVacanciesList) &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.title == e2?.title &&
        e1?.availableDateStart == e2?.availableDateStart &&
        e1?.availableDateEnd == e2?.availableDateEnd &&
        listEquality.equals(
            e1?.availableMorningHours, e2?.availableMorningHours) &&
        listEquality.equals(e1?.availableDayHours, e2?.availableDayHours) &&
        listEquality.equals(
            e1?.availableEveningHours, e2?.availableEveningHours) &&
        listEquality.equals(e1?.weekends, e2?.weekends) &&
        listEquality.equals(e1?.lockedDates, e2?.lockedDates);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.birthdayDate,
        e?.resumeSummary,
        e?.resumeLink,
        e?.workFormat,
        e?.surname,
        e?.socialLinks,
        e?.city,
        e?.isAccountDeleted,
        e?.workPlaces,
        e?.languages,
        e?.educationPlaces,
        e?.isResumeParsingFinished,
        e?.hrPosition,
        e?.website,
        e?.hrCompanyName,
        e?.chatSummary,
        e?.responsedVacanciesList,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.title,
        e?.availableDateStart,
        e?.availableDateEnd,
        e?.availableMorningHours,
        e?.availableDayHours,
        e?.availableEveningHours,
        e?.weekends,
        e?.lockedDates
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
