import 'dart:io';

import 'package:logs/logs.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myapp/global_store/store.dart';
import 'package:myapp/entity/my_playlist.dart';
import 'package:myapp/utils/api_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import './app.dart';
import 'global_store/state.dart';
import 'screens/login/state.dart';

final Log httpLog = Log('http');

void main() async {
  httpLog.enabled = true;
  // 初始化
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  ApiClient(cookiesPath: tempPath);

  final persistor = Persistor<GlobalState>(
    storage: FlutterStorage(key: 'GlobalState'),
    serializer: JsonSerializer<GlobalState>(GlobalState.fromJson),
  );

  try {
    final initialState = await persistor.load();
    GlobalStore.initialState = initialState;
  } on SerializationException {
    print('初始化错误');
  }

  runApp(createApp());
}
