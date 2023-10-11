import 'package:flutter/material.dart';
import 'package:medical_device_classifier/medical_device_classifier.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


void main() {
  usePathUrlStrategy();
  runApp(const MedicalDeviceClassifier());
}
