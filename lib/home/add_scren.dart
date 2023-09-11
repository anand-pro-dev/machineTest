import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_mvvm/home/details_screen.dart';
import 'package:test_mvvm/home/home_page.dart';
import 'package:test_mvvm/provider/user_view_model.dart';
import 'package:test_mvvm/widgets/button.dart';
import 'package:test_mvvm/widgets/constants.dart';
import 'package:test_mvvm/widgets/text_field.dart';
import '../services/models/auth_get_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/utils/utils.dart';

class AddCompanyScreen extends StatefulWidget {
  AddCompanyScreen({Key? key}) : super(key: key);

  @override
  _AddCompanyScreenState createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _objController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastController.dispose();
    _townController.dispose();
    _objController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 200,
          width: double.maxFinite,
          child: Center(
            child: AppButton(
              loading: loading,
              onTap: () async {
                if (_nameController.text == " " &&
                    _emailController.text == "") {
                  Utils.flushBarErrorMessage(
                      'Name and Email field Should be filled',
                      context,
                      Colors.red);
                  // await postData();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => DetialsScreen()));
                } else {
                  setState(() {
                    loading = true;
                  });
                  await postData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetialsScreen(
                              // emailController: _emailController.text,
                              // lastController: _lastController.text,
                              // first_name: _nameController.text,
                              // numberController: _numberController.text,
                              // objController: _objController.text,
                              // town_Controller: _townController.text,
                              )));
                }
                setState(() {
                  loading = false;
                });
              },
              text: "SUBMIT",
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CommonAppBar(
                    title: "Company's Friend",
                    page: HomePage(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFieldWideget(
                    controller: _nameController,
                    iconData: FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'First Name',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWideget(
                    controller: _lastController,
                    iconData: FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'Last Name',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWideget(
                    controller: _townController,
                    iconData: FaIcon(
                      FontAwesomeIcons.tentArrowTurnLeft,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'Town',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWideget(
                    controller: _objController,
                    iconData: FaIcon(
                      FontAwesomeIcons.bullseye,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'Object Name',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWideget(
                    controller: _numberController,
                    numberField: true,
                    iconData: FaIcon(
                      FontAwesomeIcons.phone,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'Mobile Number',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWideget(
                    controller: _emailController,
                    iconData: FaIcon(
                      FontAwesomeIcons.envelope,
                      size: 20,
                      color: AppColors.kGreeyColor.withOpacity(0.7),
                    ),
                    hint: 'Email',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> postData() async {
    Future<Result> getUserDate() => UserViewModel().getUser();

    final url = Uri.parse(AppConstants.addDetailsListUrl);

    getUserDate().then((value) async {
      final body = {
        "country": "91",
        "password": "123456",
        "town": "dewas",
        "user_id": "1",
        "object_name": _objController.text,
        "mobile": _nameController.text,
        "last_name": _lastController.text,
        "first_name": _nameController.text,
        "email": _emailController.text,
        "token": value.token.toString(),
      };
      log(body.toString() + ">body");
      log(value.token.toString() + "Token");

      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        log('Response: ${response.body}');
        log("happy");
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    });
  }
}
