import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecomapp/provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'Log In to Mynthra',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'EASILY USING',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.generalLogin,
                          text: 'FACEBOOK',
                          fontSize: 15,
                          textColor: Colors.black,
                          imageWidth: 30,
                          width: 170,
                          backgroundColor: Colors.white,
                          imagePath: 'assets/images/fblogo.png',
                          onPressed: () {
                            ref
                                .read(messageProvider.notifier)
                                .setWelcomeMessage('FACEBOOK', 'FACEBOOK');
                            context.go('/home');
                          }),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.generalLogin,
                          text: 'GOOGLE',
                          fontSize: 15,
                          textColor: Colors.black,
                          imageWidth: 30,
                          width: 170,
                          backgroundColor: Colors.white,
                          imagePath: 'assets/images/google.png',
                          onPressed: () {
                            ref
                                .read(messageProvider.notifier)
                                .setWelcomeMessage('GOOGLE', 'GOOGLE');
                            context.go('/home');
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    '-OR USING EMAIL-',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " Required field";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Invalid Email';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        hintText: 'password', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checklogin(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00A86B),
                          maximumSize: const Size.fromWidth(200)),
                      child: const Text("LOG IN",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                      onTap: () {},
                      child: const Text('FORGOT PASSWORD?',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    )
                  ])
                ],
              ),
            ),
          ),
        )));
  }

  void checklogin(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == "abc@gmail.com" && password == "pass123") {
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('username password does not match'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ));
    }
  }
}
