import 'dart:io';

import 'package:flutter/services.dart';

class NativeMogiChannel {
  static const MethodChannel _channel = MethodChannel('manga_mogi.app.channel'); 

  static bool _preMethodExecution() {
    return Platform.isIOS;
  }

 static Future<String?> getPlatformVersion() async {
    
    try {
      final String version = await _channel.invokeMethod('getPlatformVersion');
      print("Versión de la plataforma: $version");
      return version;
    } catch (e) {
      return _handleError(e);
    }
  }

  static final Map<Type, String> errorMessages = {
    MissingPluginException: "Método no implementado en la plataforma actual.",
    PlatformException: "Error en la plataforma al ejecutar el método.",
    Exception: "Error desconocido.",
  };

  static String? _handleError(Object e) {
    for (var errorType in errorMessages.keys) {
      if (e.runtimeType == errorType) {
        print("Error: ${errorMessages[errorType]}");
        return errorMessages[errorType];
      }
    }
    print("Error inesperado: $e");
    return "Error inesperado.";
  }
}
