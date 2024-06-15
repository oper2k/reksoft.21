// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationPlaceStruct extends FFFirebaseStruct {
  EducationPlaceStruct({
    String? university,
    String? faculty,
    List<String>? skills,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _university = university,
        _faculty = faculty,
        _skills = skills,
        super(firestoreUtilData);

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;

  bool hasUniversity() => _university != null;

  // "faculty" field.
  String? _faculty;
  String get faculty => _faculty ?? '';
  set faculty(String? val) => _faculty = val;

  bool hasFaculty() => _faculty != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  set skills(List<String>? val) => _skills = val;

  void updateSkills(Function(List<String>) updateFn) {
    updateFn(skills ??= []);
  }

  bool hasSkills() => _skills != null;

  static EducationPlaceStruct fromMap(Map<String, dynamic> data) =>
      EducationPlaceStruct(
        university: data['university'] as String?,
        faculty: data['faculty'] as String?,
        skills: getDataList(data['skills']),
      );

  static EducationPlaceStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationPlaceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'university': _university,
        'faculty': _faculty,
        'skills': _skills,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'faculty': serializeParam(
          _faculty,
          ParamType.String,
        ),
        'skills': serializeParam(
          _skills,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static EducationPlaceStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationPlaceStruct(
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        faculty: deserializeParam(
          data['faculty'],
          ParamType.String,
          false,
        ),
        skills: deserializeParam<String>(
          data['skills'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'EducationPlaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EducationPlaceStruct &&
        university == other.university &&
        faculty == other.faculty &&
        listEquality.equals(skills, other.skills);
  }

  @override
  int get hashCode => const ListEquality().hash([university, faculty, skills]);
}

EducationPlaceStruct createEducationPlaceStruct({
  String? university,
  String? faculty,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EducationPlaceStruct(
      university: university,
      faculty: faculty,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EducationPlaceStruct? updateEducationPlaceStruct(
  EducationPlaceStruct? educationPlace, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    educationPlace
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEducationPlaceStructData(
  Map<String, dynamic> firestoreData,
  EducationPlaceStruct? educationPlace,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (educationPlace == null) {
    return;
  }
  if (educationPlace.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && educationPlace.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final educationPlaceData =
      getEducationPlaceFirestoreData(educationPlace, forFieldValue);
  final nestedData =
      educationPlaceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = educationPlace.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEducationPlaceFirestoreData(
  EducationPlaceStruct? educationPlace, [
  bool forFieldValue = false,
]) {
  if (educationPlace == null) {
    return {};
  }
  final firestoreData = mapToFirestore(educationPlace.toMap());

  // Add any Firestore field values
  educationPlace.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEducationPlaceListFirestoreData(
  List<EducationPlaceStruct>? educationPlaces,
) =>
    educationPlaces
        ?.map((e) => getEducationPlaceFirestoreData(e, true))
        .toList() ??
    [];
