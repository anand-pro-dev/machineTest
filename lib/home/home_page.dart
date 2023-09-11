import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/home/add_scren.dart';
import 'package:test_mvvm/provider/search_provider.dart';
import 'package:test_mvvm/services/api/fatch_api.dart';
import 'package:test_mvvm/services/models/home_list_model.dart';
import 'package:test_mvvm/widgets/app_bar.dart';
import 'package:test_mvvm/widgets/button.dart';
import 'package:test_mvvm/widgets/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    statesBarTheme;
    final _mqH = MediaQuery.of(context).size.height;
    final _mqW = MediaQuery.of(context).size.width;
    final userList = Provider.of<SearchProvider>(context);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     title: Text(
        //   "Company's Friend",
        // )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              CommonAppBar(
                page: HomePage(),
                title: "Company's Friend",
              ),
              Container(
                padding: const EdgeInsets.all(12),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kwhiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kAmberColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Name',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          onFieldSubmitted: (String inputText) {
                            // chatUsersList.clear();
                          },
                          onChanged: (query) {
                            userList.searchTickets(query);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              userList.isLoading
                  ? Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.kwhiteColor,
                        border: Border.all(
                            color: AppColors.kGreeyColor.withOpacity(0.5)),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                          // height: _mqH * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.kwhiteColor,
                            border: Border.all(
                                color: AppColors.kGreeyColor.withOpacity(0.5)),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          child: Center(
                            child: ListView.builder(
                                itemCount: userList.filteredName.length,
                                itemBuilder: (context, index) {
                                  final myData = userList.filteredName[index];
                                  return ListTile(
                                    leading: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(),
                                    ),
                                    title: Text(
                                      myData.firstName ?? "No Name",
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                    subtitle: Text(
                                      myData.email ?? "No Email ",
                                      style: const TextStyle(
                                          color: Colors.black45),
                                    ),
                                  );
                                }),
                          )),
                    ),
              Container(
                height: _mqH * 0.15,
                width: double.maxFinite,
                child: Center(
                  child: AppButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCompanyScreen()));
                    },
                    text: "Add",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
