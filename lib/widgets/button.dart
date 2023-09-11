import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onTap;
  const AppButton(
      {Key? key, required this.text, this.loading = false, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
