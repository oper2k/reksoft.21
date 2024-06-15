// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceStruct extends FFFirebaseStruct {
  WorkPlaceStruct({
    String? companyName,
    String? position,
    DateTime? startWorkingDate,
    DateTime? endWorkingDate,
    List<String>? skills,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _position = position,
        _startWorkingDate = startWorkingDate,
        _endWorkingDate = endWorkingDate,
        _skills = skills,
        _description = description,
        super(firestoreUtilData);

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;

  bool hasPosition() => _position != null;

  // "startWorkingDate" field.
  DateTime? _startWorkingDate;
  DateTime? get startWorkingDate => _startWorkingDate;
  set startWorkingDate(DateTime? val) => _startWorkingDate = val;

  bool hasStartWorkingDate() => _startWorkingDate != null;

  // "endWorkingDate" field.
  DateTime? _endWorkingDate;
  DateTime? get endWorkingDate => _endWorkingDate;
  set endWorkingDate(DateTime? val) => _endWorkingDate = val;

  bool hasEndWorkingDate() => _endWorkingDate != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  set skills(List<String>? val) => _skills = val;

  void updateSkills(Function(List<String>) updateFn) {
    updateFn(skills ??= []);
  }

  bool hasSkills() => _skills != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static WorkPlaceStruct fromMap(Map<String, dynamic> data) => WorkPlaceStruct(
        companyName: data['company_name'] as String?,
        position: data['position'] as String?,
        startWorkingDate: data['startWorkingDate'] as DateTime?,
        endWorkingDate: data['endWorkingDate'] as DateTime?,
        skills: getDataList(data['skills']),
        description: data['description'] as String?,
      );

  static WorkPlaceStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkPlaceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_name': _companyName,
        'position': _position,
        'startWorkingDate': _startWorkingDate,
        'endWorkingDate': _endWorkingDate,
        'skills': _skills,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'startWorkingDate': serializeParam(
          _startWorkingDate,
          ParamType.DateTime,
        ),
        'endWorkingDate': serializeParam(
          _endWorkingDate,
          ParamType.DateTime,
        ),
        'skills': serializeParam(
          _skills,
          ParamType.String,
          isList: true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkPlaceStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkPlaceStruct(
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.String,
          false,
        ),
        startWorkingDate: deserializeParam(
          data['startWorkingDate'],
          ParamType.DateTime,
          false,
        ),
        endWorkingDate: deserializeParam(
          data['endWorkingDate'],
          ParamType.DateTime,
          false,
        ),
        skills: deserializeParam<String>(
          data['skills'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkPlaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkPlaceStruct &&
        companyName == other.companyName &&
        position == other.position &&
        startWorkingDate == other.startWorkingDate &&
        endWorkingDate == other.endWorkingDate &&
        listEquality.equals(skills, other.skills) &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyName,
        position,
        startWorkingDate,
        endWorkingDate,
        skills,
        description
      ]);
}

WorkPlaceStruct createWorkPlaceStruct({
  String? companyName,
  String? position,
  DateTime? startWorkingDate,
  DateTime? endWorkingDate,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkPlaceStruct(
      companyName: companyName,
      position: position,
      startWorkingDate: startWorkingDate,
      endWorkingDate: endWorkingDate,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkPlaceStruct? updateWorkPlaceStruct(
  WorkPlaceStruct? workPlace, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workPlace
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkPlaceStructData(
  Map<String, dynamic> firestoreData,
  WorkPlaceStruct? workPlace,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workPlace == null) {
    return;
  }
  if (workPlace.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workPlace.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workPlaceData = getWorkPlaceFirestoreData(workPlace, forFieldValue);
  final nestedData = workPlaceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workPlace.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkPlaceFirestoreData(
  WorkPlaceStruct? workPlace, [
  bool forFieldValue = false,
]) {
  if (workPlace == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workPlace.toMap());

  // Add any Firestore field values
  workPlace.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkPlaceListFirestoreData(
  List<WorkPlaceStruct>? workPlaces,
) =>
    workPlaces?.map((e) => getWorkPlaceFirestoreData(e, true)).toList() ?? [];
