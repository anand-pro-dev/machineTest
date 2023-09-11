import 'package:flutter/material.dart';

class TrainLogicPage extends StatefulWidget {
  TrainLogicPage({Key? key}) : super(key: key);

  @override
  _TrainLogicPageState createState() => _TrainLogicPageState();
}

class _TrainLogicPageState extends State<TrainLogicPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(250, 255, 255, 255),
          title: const Text("Train Deshboard"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text("time")),
                  Expanded(flex: 3, child: Text("time")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
