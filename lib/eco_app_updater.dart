library eco_app_updater;

import 'dart:convert';
import 'dart:io';

import 'package:eco_app_updater/src/dialog_message.dart';
import 'package:eco_app_updater/src/version_status.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:url_launcher/url_launcher_string.dart';

export 'package:url_launcher/url_launcher.dart';

part 'src/eco_updater.dart';
part 'src/version_manager.dart';
