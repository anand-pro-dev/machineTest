import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:test_mvvm/widgets/constants.dart';
import 'package:test_mvvm/widgets/text_field.dart';
import 'package:test_mvvm/widgets/utils/utils.dart';
import '../provider/log_controller.dart';

import '../widgets/button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _passWord = TextEditingController();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final _mqH = MediaQuery.of(context).size.height;
    final _mqW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              alignment: Alignment.topLeft,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 1,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.asset("assets/image/Vector.png"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: 120,
                      width: 130,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image/logo_text.png",
                            height: 120,
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Login to continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFieldWideget(
                    controller: _name,
                    iconData: FaIcon(
                      FontAwesomeIcons.envelope,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'email',
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: (context, value, child) {
                        return TextFieldWideget(
                          obscureText: _obsecurePassword.value,
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                          controller: _passWord,
                          iconData: FaIcon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: AppColors.kGreeyColor.withOpacity(0.7),
                          ),
                          hint: 'password',
                        );
                      }),
                  const SizedBox(height: 80),
                  AppButton(
                    loading: authViewMode.loading,
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                      // submitDataAdd();

                      if (_name.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please enter email', context, Colors.red);
                      } else if (_passWord.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please enter password', context, Colors.red);
                      } else if (!_name.text.contains("@")) {
                        Utils.flushBarErrorMessage(
                            'Please enter a valid Email', context, Colors.red);
                      } else {
                        Map data = {
                          'email': _name.text.toString(),
                          'password': _passWord.text.toString(),
                          "registerId": "Administrator",
                          "type": "Administrator"
                        };

                        authViewMode.loginApi(data, context);
                        print('api hit');
                      }
                    },
                    text: "SUBMIT",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
