import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VacanciesRecord extends FirestoreRecord {
  VacanciesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "specialization" field.
  String? _specialization;
  String get specialization => _specialization ?? '';
  bool hasSpecialization() => _specialization != null;

  // "employmentType" field.
  String? _employmentType;
  String get employmentType => _employmentType ?? '';
  bool hasEmploymentType() => _employmentType != null;

  // "workFormat" field.
  String? _workFormat;
  String get workFormat => _workFormat ?? '';
  bool hasWorkFormat() => _workFormat != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "salaryMin" field.
  int? _salaryMin;
  int get salaryMin => _salaryMin ?? 0;
  bool hasSalaryMin() => _salaryMin != null;

  // "salaryMax" field.
  int? _salaryMax;
  int get salaryMax => _salaryMax ?? 0;
  bool hasSalaryMax() => _salaryMax != null;

  // "salaryForFilter" field.
  int? _salaryForFilter;
  int get salaryForFilter => _salaryForFilter ?? 0;
  bool hasSalaryForFilter() => _salaryForFilter != null;

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "keywords" field.
  List<String>? _keywords;
  List<String> get keywords => _keywords ?? const [];
  bool hasKeywords() => _keywords != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "requirements" field.
  String? _requirements;
  String get requirements => _requirements ?? '';
  bool hasRequirements() => _requirements != null;

  // "testTask_link" field.
  String? _testTaskLink;
  String get testTaskLink => _testTaskLink ?? '';
  bool hasTestTaskLink() => _testTaskLink != null;

  // "work_address" field.
  String? _workAddress;
  String get workAddress => _workAddress ?? '';
  bool hasWorkAddress() => _workAddress != null;

  // "views_count" field.
  int? _viewsCount;
  int get viewsCount => _viewsCount ?? 0;
  bool hasViewsCount() => _viewsCount != null;

  // "working_conditions" field.
  String? _workingConditions;
  String get workingConditions => _workingConditions ?? '';
  bool hasWorkingConditions() => _workingConditions != null;

  // "is_Deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "hr_email" field.
  String? _hrEmail;
  String get hrEmail => _hrEmail ?? '';
  bool hasHrEmail() => _hrEmail != null;

  void _initializeFields() {
    _specialization = snapshotData['specialization'] as String?;
    _employmentType = snapshotData['employmentType'] as String?;
    _workFormat = snapshotData['workFormat'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _city = snapshotData['city'] as String?;
    _skills = getDataList(snapshotData['skills']);
    _salaryMin = castToType<int>(snapshotData['salaryMin']);
    _salaryMax = castToType<int>(snapshotData['salaryMax']);
    _salaryForFilter = castToType<int>(snapshotData['salaryForFilter']);
    _jobTitle = snapshotData['job_title'] as String?;
    _keywords = getDataList(snapshotData['keywords']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _requirements = snapshotData['requirements'] as String?;
    _testTaskLink = snapshotData['testTask_link'] as String?;
    _workAddress = snapshotData['work_address'] as String?;
    _viewsCount = castToType<int>(snapshotData['views_count']);
    _workingConditions = snapshotData['working_conditions'] as String?;
    _isDeleted = snapshotData['is_Deleted'] as bool?;
    _hrEmail = snapshotData['hr_email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vacancies');

  static Stream<VacanciesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VacanciesRecord.fromSnapshot(s));

  static Future<VacanciesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VacanciesRecord.fromSnapshot(s));

  static VacanciesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VacanciesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VacanciesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VacanciesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VacanciesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VacanciesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVacanciesRecordData({
  String? specialization,
  String? employmentType,
  String? workFormat,
  DateTime? createdTime,
  String? city,
  int? salaryMin,
  int? salaryMax,
  int? salaryForFilter,
  String? jobTitle,
  DocumentReference? creator,
  String? description,
  String? requirements,
  String? testTaskLink,
  String? workAddress,
  int? viewsCount,
  String? workingConditions,
  bool? isDeleted,
  String? hrEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'specialization': specialization,
      'employmentType': employmentType,
      'workFormat': workFormat,
      'created_time': createdTime,
      'city': city,
      'salaryMin': salaryMin,
      'salaryMax': salaryMax,
      'salaryForFilter': salaryForFilter,
      'job_title': jobTitle,
      'creator': creator,
      'description': description,
      'requirements': requirements,
      'testTask_link': testTaskLink,
      'work_address': workAddress,
      'views_count': viewsCount,
      'working_conditions': workingConditions,
      'is_Deleted': isDeleted,
      'hr_email': hrEmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class VacanciesRecordDocumentEquality implements Equality<VacanciesRecord> {
  const VacanciesRecordDocumentEquality();

  @override
  bool equals(VacanciesRecord? e1, VacanciesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.specialization == e2?.specialization &&
        e1?.employmentType == e2?.employmentType &&
        e1?.workFormat == e2?.workFormat &&
        e1?.createdTime == e2?.createdTime &&
        e1?.city == e2?.city &&
        listEquality.equals(e1?.skills, e2?.skills) &&
        e1?.salaryMin == e2?.salaryMin &&
        e1?.salaryMax == e2?.salaryMax &&
        e1?.salaryForFilter == e2?.salaryForFilter &&
        e1?.jobTitle == e2?.jobTitle &&
        listEquality.equals(e1?.keywords, e2?.keywords) &&
        e1?.creator == e2?.creator &&
        e1?.description == e2?.description &&
        e1?.requirements == e2?.requirements &&
        e1?.testTaskLink == e2?.testTaskLink &&
        e1?.workAddress == e2?.workAddress &&
        e1?.viewsCount == e2?.viewsCount &&
        e1?.workingConditions == e2?.workingConditions &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.hrEmail == e2?.hrEmail;
  }

  @override
  int hash(VacanciesRecord? e) => const ListEquality().hash([
        e?.specialization,
        e?.employmentType,
        e?.workFormat,
        e?.createdTime,
        e?.city,
        e?.skills,
        e?.salaryMin,
        e?.salaryMax,
        e?.salaryForFilter,
        e?.jobTitle,
        e?.keywords,
        e?.creator,
        e?.description,
        e?.requirements,
        e?.testTaskLink,
        e?.workAddress,
        e?.viewsCount,
        e?.workingConditions,
        e?.isDeleted,
        e?.hrEmail
      ]);

  @override
  bool isValidKey(Object? o) => o is VacanciesRecord;
}
