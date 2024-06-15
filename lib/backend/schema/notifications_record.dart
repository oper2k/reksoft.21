import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "from" field.
  DocumentReference? _from;
  DocumentReference? get from => _from;
  bool hasFrom() => _from != null;

  // "to" field.
  DocumentReference? _to;
  DocumentReference? get to => _to;
  bool hasTo() => _to != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isViewed" field.
  bool? _isViewed;
  bool get isViewed => _isViewed ?? false;
  bool hasIsViewed() => _isViewed != null;

  // "response" field.
  DocumentReference? _response;
  DocumentReference? get response => _response;
  bool hasResponse() => _response != null;

  // "vacancy" field.
  DocumentReference? _vacancy;
  DocumentReference? get vacancy => _vacancy;
  bool hasVacancy() => _vacancy != null;

  void _initializeFields() {
    _from = snapshotData['from'] as DocumentReference?;
    _to = snapshotData['to'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _text = snapshotData['text'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isViewed = snapshotData['isViewed'] as bool?;
    _response = snapshotData['response'] as DocumentReference?;
    _vacancy = snapshotData['vacancy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? from,
  DocumentReference? to,
  String? type,
  String? text,
  DateTime? createdTime,
  bool? isViewed,
  DocumentReference? response,
  DocumentReference? vacancy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'from': from,
      'to': to,
      'type': type,
      'text': text,
      'created_time': createdTime,
      'isViewed': isViewed,
      'response': response,
      'vacancy': vacancy,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.type == e2?.type &&
        e1?.text == e2?.text &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isViewed == e2?.isViewed &&
        e1?.response == e2?.response &&
        e1?.vacancy == e2?.vacancy;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.from,
        e?.to,
        e?.type,
        e?.text,
        e?.createdTime,
        e?.isViewed,
        e?.response,
        e?.vacancy
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
