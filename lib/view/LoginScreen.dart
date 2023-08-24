// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm/res/components/rounde_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obesecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Login Screen'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: emailFocusNode,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              style: TextStyle(fontSize: 18.0),
              onSubmitted: (value) {
                Utils.fieldChanged(context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: _obesecurePassword,
                builder: (context, value, child) {
                  return TextField(
                    obscureText: _obesecurePassword.value,
                    obscuringCharacter: '*',
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "password",
                        labelText: "password",
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obesecurePassword.value =
                                  !_obesecurePassword.value;
                            },
                            child: Icon(_obesecurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility))),
                    style: TextStyle(fontSize: 18.0),
                  );
                }),
            SizedBox(
              height: 50,
            ),
            DefaultButton(
                press: () {
                  if (emailController.text.isEmpty) {
                    Utils.show_Custom_Flushbar(
                        'please enter your Email', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.show_Custom_Flushbar(
                        'please enter your Password', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.show_Custom_Flushbar(
                        'please enter 6 digits', context);
                  } else {
                    Map data = {
                      'email': emailController.text,
                      'password': passwordController.text
                    };
                    _authViewModel.loginApi(data, context);
                    print('api hit');
                  }
                },
                text: 'Login'),
          ],
        ),
      ),
    );
  }
}
