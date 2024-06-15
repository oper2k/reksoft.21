import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "hashTags" field.
  List<String>? _hashTags;
  List<String> get hashTags => _hashTags ?? const [];
  bool hasHashTags() => _hashTags != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "companyLogo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  bool hasCompanyLogo() => _companyLogo != null;

  // "publishDate" field.
  DateTime? _publishDate;
  DateTime? get publishDate => _publishDate;
  bool hasPublishDate() => _publishDate != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _hashTags = getDataList(snapshotData['hashTags']);
    _content = snapshotData['content'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _companyLogo = snapshotData['companyLogo'] as String?;
    _publishDate = snapshotData['publishDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? title,
  String? image,
  DateTime? createdTime,
  String? category,
  String? content,
  String? shortDescription,
  String? companyLogo,
  DateTime? publishDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'created_time': createdTime,
      'category': category,
      'content': content,
      'shortDescription': shortDescription,
      'companyLogo': companyLogo,
      'publishDate': publishDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.hashTags, e2?.hashTags) &&
        e1?.content == e2?.content &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.companyLogo == e2?.companyLogo &&
        e1?.publishDate == e2?.publishDate;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.image,
        e?.createdTime,
        e?.category,
        e?.hashTags,
        e?.content,
        e?.shortDescription,
        e?.companyLogo,
        e?.publishDate
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
