const admin = require("firebase-admin/app");
admin.initializeApp();

const analyzePdfFile = require("./analyze_pdf_file.js");
exports.analyzePdfFile = analyzePdfFile.analyzePdfFile;
const parsePdfFile = require("./parse_pdf_file.js");
exports.parsePdfFile = parsePdfFile.parsePdfFile;
const analyzeJsonData = require("./analyze_json_data.js");
exports.analyzeJsonData = analyzeJsonData.analyzeJsonData;
const generateVacancy = require("./generate_vacancy.js");
exports.generateVacancy = generateVacancy.generateVacancy;
