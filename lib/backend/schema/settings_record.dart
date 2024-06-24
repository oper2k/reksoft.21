import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsRecord extends FirestoreRecord {
  SettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "news_categories" field.
  List<String>? _newsCategories;
  List<String> get newsCategories => _newsCategories ?? const [];
  bool hasNewsCategories() => _newsCategories != null;

  // "specializationsList" field.
  List<String>? _specializationsList;
  List<String> get specializationsList => _specializationsList ?? const [];
  bool hasSpecializationsList() => _specializationsList != null;

  // "employmentTypeList" field.
  List<String>? _employmentTypeList;
  List<String> get employmentTypeList => _employmentTypeList ?? const [];
  bool hasEmploymentTypeList() => _employmentTypeList != null;

  // "workFormatList" field.
  List<String>? _workFormatList;
  List<String> get workFormatList => _workFormatList ?? const [];
  bool hasWorkFormatList() => _workFormatList != null;

  // "salaryList" field.
  List<int>? _salaryList;
  List<int> get salaryList => _salaryList ?? const [];
  bool hasSalaryList() => _salaryList != null;

  // "morningTimes" field.
  List<String>? _morningTimes;
  List<String> get morningTimes => _morningTimes ?? const [];
  bool hasMorningTimes() => _morningTimes != null;

  // "dayTimes" field.
  List<String>? _dayTimes;
  List<String> get dayTimes => _dayTimes ?? const [];
  bool hasDayTimes() => _dayTimes != null;

  // "eveningTimes" field.
  List<String>? _eveningTimes;
  List<String> get eveningTimes => _eveningTimes ?? const [];
  bool hasEveningTimes() => _eveningTimes != null;

  void _initializeFields() {
    _newsCategories = getDataList(snapshotData['news_categories']);
    _specializationsList = getDataList(snapshotData['specializationsList']);
    _employmentTypeList = getDataList(snapshotData['employmentTypeList']);
    _workFormatList = getDataList(snapshotData['workFormatList']);
    _salaryList = getDataList(snapshotData['salaryList']);
    _morningTimes = getDataList(snapshotData['morningTimes']);
    _dayTimes = getDataList(snapshotData['dayTimes']);
    _eveningTimes = getDataList(snapshotData['eveningTimes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settings');

  static Stream<SettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsRecord.fromSnapshot(s));

  static Future<SettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingsRecord.fromSnapshot(s));

  static SettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SettingsRecordDocumentEquality implements Equality<SettingsRecord> {
  const SettingsRecordDocumentEquality();

  @override
  bool equals(SettingsRecord? e1, SettingsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.newsCategories, e2?.newsCategories) &&
        listEquality.equals(e1?.specializationsList, e2?.specializationsList) &&
        listEquality.equals(e1?.employmentTypeList, e2?.employmentTypeList) &&
        listEquality.equals(e1?.workFormatList, e2?.workFormatList) &&
        listEquality.equals(e1?.salaryList, e2?.salaryList) &&
        listEquality.equals(e1?.morningTimes, e2?.morningTimes) &&
        listEquality.equals(e1?.dayTimes, e2?.dayTimes) &&
        listEquality.equals(e1?.eveningTimes, e2?.eveningTimes);
  }

  @override
  int hash(SettingsRecord? e) => const ListEquality().hash([
        e?.newsCategories,
        e?.specializationsList,
        e?.employmentTypeList,
        e?.workFormatList,
        e?.salaryList,
        e?.morningTimes,
        e?.dayTimes,
        e?.eveningTimes
      ]);

  @override
  bool isValidKey(Object? o) => o is SettingsRecord;
}
