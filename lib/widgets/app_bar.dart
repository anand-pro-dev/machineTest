import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_mvvm/home/home_page.dart';
import 'package:test_mvvm/widgets/constants.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Widget? page;
  const CommonAppBar({
    super.key,
    required this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.kGreeyColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 18,
                  ),
                  onPressed: () {
                    print("Back Pressed");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => page!));
                  }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )
        ],
      ),
    );
  }
}
