import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:manga_mogi_app/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const MultiProviderData(
      child: MainApp()
    )
  );
}