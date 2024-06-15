import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseRecord extends FirestoreRecord {
  ResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "applicant" field.
  DocumentReference? _applicant;
  DocumentReference? get applicant => _applicant;
  bool hasApplicant() => _applicant != null;

  // "hr" field.
  DocumentReference? _hr;
  DocumentReference? get hr => _hr;
  bool hasHr() => _hr != null;

  // "vacancy" field.
  DocumentReference? _vacancy;
  DocumentReference? get vacancy => _vacancy;
  bool hasVacancy() => _vacancy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "resume" field.
  String? _resume;
  String get resume => _resume ?? '';
  bool hasResume() => _resume != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "socialLink" field.
  String? _socialLink;
  String get socialLink => _socialLink ?? '';
  bool hasSocialLink() => _socialLink != null;

  // "isChatFinished" field.
  bool? _isChatFinished;
  bool get isChatFinished => _isChatFinished ?? false;
  bool hasIsChatFinished() => _isChatFinished != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "chat_summary" field.
  String? _chatSummary;
  String get chatSummary => _chatSummary ?? '';
  bool hasChatSummary() => _chatSummary != null;

  // "interview_date" field.
  DateTime? _interviewDate;
  DateTime? get interviewDate => _interviewDate;
  bool hasInterviewDate() => _interviewDate != null;

  void _initializeFields() {
    _applicant = snapshotData['applicant'] as DocumentReference?;
    _hr = snapshotData['hr'] as DocumentReference?;
    _vacancy = snapshotData['vacancy'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _resume = snapshotData['resume'] as String?;
    _website = snapshotData['website'] as String?;
    _socialLink = snapshotData['socialLink'] as String?;
    _isChatFinished = snapshotData['isChatFinished'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _chatSummary = snapshotData['chat_summary'] as String?;
    _interviewDate = snapshotData['interview_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('response');

  static Stream<ResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponseRecord.fromSnapshot(s));

  static Future<ResponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponseRecord.fromSnapshot(s));

  static ResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponseRecordData({
  DocumentReference? applicant,
  DocumentReference? hr,
  DocumentReference? vacancy,
  String? status,
  String? resume,
  String? website,
  String? socialLink,
  bool? isChatFinished,
  DateTime? createdTime,
  String? chatSummary,
  DateTime? interviewDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'applicant': applicant,
      'hr': hr,
      'vacancy': vacancy,
      'status': status,
      'resume': resume,
      'website': website,
      'socialLink': socialLink,
      'isChatFinished': isChatFinished,
      'created_time': createdTime,
      'chat_summary': chatSummary,
      'interview_date': interviewDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponseRecordDocumentEquality implements Equality<ResponseRecord> {
  const ResponseRecordDocumentEquality();

  @override
  bool equals(ResponseRecord? e1, ResponseRecord? e2) {
    return e1?.applicant == e2?.applicant &&
        e1?.hr == e2?.hr &&
        e1?.vacancy == e2?.vacancy &&
        e1?.status == e2?.status &&
        e1?.resume == e2?.resume &&
        e1?.website == e2?.website &&
        e1?.socialLink == e2?.socialLink &&
        e1?.isChatFinished == e2?.isChatFinished &&
        e1?.createdTime == e2?.createdTime &&
        e1?.chatSummary == e2?.chatSummary &&
        e1?.interviewDate == e2?.interviewDate;
  }

  @override
  int hash(ResponseRecord? e) => const ListEquality().hash([
        e?.applicant,
        e?.hr,
        e?.vacancy,
        e?.status,
        e?.resume,
        e?.website,
        e?.socialLink,
        e?.isChatFinished,
        e?.createdTime,
        e?.chatSummary,
        e?.interviewDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ResponseRecord;
}
