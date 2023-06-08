import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class WelcomeMessage extends StateNotifier<String> {
  WelcomeMessage() : super('');

  void setWelcomeMessage(String provider, String loginmethod) {
    if (loginmethod == 'FACEBOOK' || loginmethod == 'GOOGLE') {
      state = "Welcome, You are logged in via $provider";
    } else {
      state = "Welcome to home screen";
    }
  }
}

final messageProvider =
    StateNotifierProvider<WelcomeMessage, String>((ref) => WelcomeMessage());
