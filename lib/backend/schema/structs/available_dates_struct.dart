// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableDatesStruct extends FFFirebaseStruct {
  AvailableDatesStruct({
    DateTime? date,
    String? hour,
    String? name,
    DocumentReference? applicant,
    DocumentReference? hr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _hour = hour,
        _name = name,
        _applicant = applicant,
        _hr = hr,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "hour" field.
  String? _hour;
  String get hour => _hour ?? '';
  set hour(String? val) => _hour = val;

  bool hasHour() => _hour != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "applicant" field.
  DocumentReference? _applicant;
  DocumentReference? get applicant => _applicant;
  set applicant(DocumentReference? val) => _applicant = val;

  bool hasApplicant() => _applicant != null;

  // "hr" field.
  DocumentReference? _hr;
  DocumentReference? get hr => _hr;
  set hr(DocumentReference? val) => _hr = val;

  bool hasHr() => _hr != null;

  static AvailableDatesStruct fromMap(Map<String, dynamic> data) =>
      AvailableDatesStruct(
        date: data['date'] as DateTime?,
        hour: data['hour'] as String?,
        name: data['name'] as String?,
        applicant: data['applicant'] as DocumentReference?,
        hr: data['hr'] as DocumentReference?,
      );

  static AvailableDatesStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailableDatesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'hour': _hour,
        'name': _name,
        'applicant': _applicant,
        'hr': _hr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'hour': serializeParam(
          _hour,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'applicant': serializeParam(
          _applicant,
          ParamType.DocumentReference,
        ),
        'hr': serializeParam(
          _hr,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AvailableDatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailableDatesStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        hour: deserializeParam(
          data['hour'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        applicant: deserializeParam(
          data['applicant'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        hr: deserializeParam(
          data['hr'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'AvailableDatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailableDatesStruct &&
        date == other.date &&
        hour == other.hour &&
        name == other.name &&
        applicant == other.applicant &&
        hr == other.hr;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, hour, name, applicant, hr]);
}

AvailableDatesStruct createAvailableDatesStruct({
  DateTime? date,
  String? hour,
  String? name,
  DocumentReference? applicant,
  DocumentReference? hr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailableDatesStruct(
      date: date,
      hour: hour,
      name: name,
      applicant: applicant,
      hr: hr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailableDatesStruct? updateAvailableDatesStruct(
  AvailableDatesStruct? availableDates, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availableDates
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailableDatesStructData(
  Map<String, dynamic> firestoreData,
  AvailableDatesStruct? availableDates,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availableDates == null) {
    return;
  }
  if (availableDates.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availableDates.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availableDatesData =
      getAvailableDatesFirestoreData(availableDates, forFieldValue);
  final nestedData =
      availableDatesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availableDates.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailableDatesFirestoreData(
  AvailableDatesStruct? availableDates, [
  bool forFieldValue = false,
]) {
  if (availableDates == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availableDates.toMap());

  // Add any Firestore field values
  availableDates.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailableDatesListFirestoreData(
  List<AvailableDatesStruct>? availableDatess,
) =>
    availableDatess
        ?.map((e) => getAvailableDatesFirestoreData(e, true))
        .toList() ??
    [];
