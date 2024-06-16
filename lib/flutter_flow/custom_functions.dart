import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSON(String prompt) {
  return json.decode('{"role": "user", "content": "$prompt"}');
}

dynamic convertUrlToJSON(String fileUrl) {
  return json.decode('{"fileUrl": "$fileUrl"}');
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSONSystem() {
  return json.decode(
      '{"role": "system", "content": "Ты проводишь собеседование с кандидатом. Твоя задача задать все вопросы из этого списка вопросов к соискателю: 1.Почему вы хотите работать в нашей компании и что привлекло вас к этой позиции? 2.Какие навыки и качества вы считаете наиболее важными для успешной работы на этой позиции? 3.Расскажите об одном (действительно важном для вас) случае, когда вам пришлось решать сложную задачу или преодолевать значительные трудности. 4.Можете привести пример успешного завершения нескольких проектов в сжатые сроки?  5.Можете рассказать о конкретной ситуации, когда вам пришлось разрешить конфликт в команде? Каждый вопрос должен быть в отдельном сообщении. Задавай первый вопрос, начни с фразы Здравствуйте, давайте начнем собеседование, и задавай первый вопрос. Ты не должен отвечать на вопросы соискателя. Твоя задача провести собеседование по вопросам и только его. Если соискатель задает вопросы, скажи что ты не компетентен на них отвечать. Из ответа пользователя ты должен понять ответил ли он на вопрос. Если соискатель не ответил, сообщи ему об этом и задай вопрос повторно. Если соискатель ответил на вопрос переходи к следующему вопросу. После того как соискатель ответит на все вопросы ты должен должен прислать в чат строго эту фразу -Спасибо за ваши ответы, мы свяжемся с вами-"}');
}

String? calcUserAge(DateTime? birthday) {
  if (birthday == null) return "не указан";

  DateTime today = DateTime.now();
  int age = today.year - birthday.year;
  if (today.month < birthday.month ||
      (today.month == birthday.month && today.day < birthday.day)) {
    age--;
  }

  String suffix;

  if (age % 10 == 1 && age % 100 != 11) {
    suffix = 'год';
  } else if ((age % 10 >= 2 && age % 10 <= 4) &&
      (age % 100 < 10 || age % 100 >= 20)) {
    suffix = 'года';
  } else {
    suffix = 'лет';
  }

  return '$age $suffix';
}

dynamic convertToJSONSystemForChech() {
  var newchat = json.decode(
      '{"role": "system", "content": "Ты проводишь собеседование с кандидатом. Твоя задача задать все вопросы из этого списка вопросов к соискателю: 1.Почему вы хотите работать в нашей компании и что привлекло вас к этой позиции? 2.Какие навыки и качества вы считаете наиболее важными для успешной работы на этой позиции? 3.Расскажите об одном (действительно важном для вас) случае, когда вам пришлось решать сложную задачу или преодолевать значительные трудности. 4.Можете привести пример успешного завершения нескольких проектов в сжатые сроки?  5.Можете рассказать о конкретной ситуации, когда вам пришлось разрешить конфликт в команде? Каждый вопрос должен быть в отдельном сообщении. Задавай первый вопрос, начни с фразы Здравствуйте, давайте начнем собеседование, и задавай первый вопрос. Ты не должен отвечать на вопросы соискателя. Твоя задача провести собеседование по вопросам и только его. Если соискатель задает вопросы, скажи что ты не компетентен на них отвечать. Из ответа пользователя ты должен понять ответил ли он на вопрос. Если соискатель не ответил, сообщи ему об этом и задай вопрос повторно. Если соискатель ответил на вопрос переходи к следующему вопросу. После того как соискатель ответит на все вопросы ты должен должен прислать в чат строго эту фразу -Спасибо за ваши ответы, мы свяжемся с вами-"}');

  return [newchat];
}

String createSalaryText(
  int? salaryFrom,
  int? salaryTo,
) {
  if (salaryFrom != null && salaryTo != null) {
    if (salaryFrom == salaryTo || salaryTo == 0) {
      return '$salaryFrom руб.';
    } else {
      return 'от $salaryFrom до $salaryTo руб.';
    }
  } else if (salaryFrom != null) {
    return 'от $salaryFrom руб.';
  } else if (salaryTo != null) {
    return 'до $salaryTo руб.';
  } else {
    return 'не указано';
  }
}

String calcWorkingExperience(
  DateTime? startWorkingDate,
  DateTime? endWorkingDate,
) {
  if (startWorkingDate == null) {
    return 'дата начала работы не указана';
  }

  final endDate = endWorkingDate ?? DateTime.now();
  final duration = endDate.difference(startWorkingDate);

  final years = duration.inDays ~/ 365;
  final months = (duration.inDays % 365) ~/ 30;

  String yearStr;
  if (years % 10 == 1 && years % 100 != 11) {
    yearStr = 'год';
  } else if ((years % 10 >= 2 && years % 10 <= 4) &&
      (years % 100 < 10 || years % 100 >= 20)) {
    yearStr = 'года';
  } else {
    yearStr = 'лет';
  }

  final monthStr = months == 1
      ? 'месяц'
      : (months >= 2 && months <= 4 ? 'месяца' : 'месяцев');

  if (years > 0 && months > 0) {
    return '$years $yearStr $months $monthStr';
  } else if (years > 0) {
    return '$years $yearStr';
  } else if (months > 0) {
    return '$months $monthStr';
  } else {
    return 'меньше месяца';
  }
}

List<String> generateKeywords(List<String> textArray) {
  // Множество для хранения уникальных ключевых слов
  final Set<String> keywords = {};

  for (String text in textArray) {
    // Приведение текста к нижнему регистру
    final lowerText = text.toLowerCase();

    // Разделение текста на слова и части слов с дефисами
    final words = lowerText.split(RegExp(r'[\s-]+'));

    // Добавление отдельных слов в множество
    keywords.addAll(words);

    // Добавление исходной строки в множество
    keywords.add(lowerText);
  }

  // Преобразование множества в список и возвращение
  return keywords.toList();
}

String? convertStringToImagePath(String? url) {
  if (url == null || url.isEmpty) {
    return null;
  }
  // Assuming the url is already a valid image path
  return url;
}

List<ResponseRecord> reverseListResponses(List<ResponseRecord> responsesList) {
  return responsesList.reversed.toList();
}

DocumentReference? stringToDocReference(String? documentID) {
  if (documentID == null || documentID.isEmpty) {
    return null;
  }

  return FirebaseFirestore.instance.collection('vacancies').doc(documentID);
}

List<VacanciesRecord> reverseListVacansion(
    List<VacanciesRecord> vacansionsList) {
  return vacansionsList.reversed.toList();
}
