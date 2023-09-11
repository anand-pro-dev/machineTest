import 'package:flutter/material.dart';
import 'package:test_mvvm/home/add_scren.dart';
import 'package:test_mvvm/home/home_page.dart';
import 'package:test_mvvm/train/dummy.dart';
import 'package:test_mvvm/widgets/constants.dart';

import '../widgets/app_bar.dart';
import '../widgets/button.dart';

class DetialsScreen extends StatelessWidget {
  // final String first_name;
  // final String lastController;
  // final String town_Controller;
  // final String objController;
  // final String numberController;
  // final String emailController;

  const DetialsScreen({
    Key? key,
    // required this.lastController,
    // required this.town_Controller,
    // required this.objController,
    // required this.numberController,
    // required this.emailController,
    // required this.first_name
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              CommonAppBar(
                title: "Company's Friend",
                page: AddCompanyScreen(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppColors.kGreeyColor.withOpacity(0.6))),
                //   child: Column(
                //     children: [
                //       RowTextWidget(
                //         one: 'First Name',
                //         two: first_name,
                //       ),
                //       const SizedBox(height: 7),
                //       RowTextWidget(
                //         one: 'Last name',
                //         two: lastController,
                //       ),
                //       const SizedBox(height: 7),
                //       RowTextWidget(
                //         one: 'Email',
                //         two: emailController,
                //       ),
                //       const SizedBox(height: 7),
                //       RowTextWidget(
                //         one: 'Phone',
                //         two: numberController,
                //       ),
                //       const SizedBox(height: 7),
                //       RowTextWidget(
                //         one: 'bussiness friends',
                //         two: objController,
                //       ),
                //     ],
                //   ),
                // ),),
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: "ACCESS MANAGER",
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrainScheduleScreen()));
                },
                text: "Train Screen",
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowTextWidget extends StatelessWidget {
  final String one;
  final String two;
  const RowTextWidget({
    super.key,
    required this.one,
    required this.two,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(one),
        ),
        const Expanded(
          child: Text("  :  "),
        ),
        Expanded(
          flex: 2,
          child: Text(two),
        ),
      ],
    );
  }
}
