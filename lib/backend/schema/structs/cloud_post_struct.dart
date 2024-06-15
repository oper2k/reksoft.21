// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CloudPostStruct extends FFFirebaseStruct {
  CloudPostStruct({
    String? fileUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileUrl = fileUrl,
        super(firestoreUtilData);

  // "fileUrl" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  set fileUrl(String? val) => _fileUrl = val;

  bool hasFileUrl() => _fileUrl != null;

  static CloudPostStruct fromMap(Map<String, dynamic> data) => CloudPostStruct(
        fileUrl: data['fileUrl'] as String?,
      );

  static CloudPostStruct? maybeFromMap(dynamic data) => data is Map
      ? CloudPostStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fileUrl': _fileUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fileUrl': serializeParam(
          _fileUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static CloudPostStruct fromSerializableMap(Map<String, dynamic> data) =>
      CloudPostStruct(
        fileUrl: deserializeParam(
          data['fileUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CloudPostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CloudPostStruct && fileUrl == other.fileUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([fileUrl]);
}

CloudPostStruct createCloudPostStruct({
  String? fileUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CloudPostStruct(
      fileUrl: fileUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CloudPostStruct? updateCloudPostStruct(
  CloudPostStruct? cloudPost, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cloudPost
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCloudPostStructData(
  Map<String, dynamic> firestoreData,
  CloudPostStruct? cloudPost,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cloudPost == null) {
    return;
  }
  if (cloudPost.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cloudPost.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cloudPostData = getCloudPostFirestoreData(cloudPost, forFieldValue);
  final nestedData = cloudPostData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cloudPost.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCloudPostFirestoreData(
  CloudPostStruct? cloudPost, [
  bool forFieldValue = false,
]) {
  if (cloudPost == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cloudPost.toMap());

  // Add any Firestore field values
  cloudPost.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCloudPostListFirestoreData(
  List<CloudPostStruct>? cloudPosts,
) =>
    cloudPosts?.map((e) => getCloudPostFirestoreData(e, true)).toList() ?? [];
