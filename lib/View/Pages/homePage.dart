import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/Model/foodModel.dart';

import '../Components/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = [
    'All',
    'Breakfast',
    'Snack',
    'Drink',
    'Dinner',
  ];
  List categorySelect = [
    true,
    false,
    false,
    false,
    false,
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  List data = [];

  List<FoodModel> foodList = [];

  loadJson() async {
    String mydata = await rootBundle.loadString('assets/json/file.json');

    setState(() {
      data = json.decode(mydata);
      foodList = data.map((e) => FoodModel.fromJson(e)).toList();
      foodList = foodList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double MyHeight = MediaQuery.of(context).size.height;
    double MyWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Container(
          height: MyHeight,
          width: MyWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MyWidth * 0.08, vertical: MyHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Shakila',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'What food do you want to try today?',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/profile.png',
                      height: MyHeight * 0.05,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MyHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.1),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search For Healthy Food',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4), fontSize: 15),
                        icon: Image.asset(
                          'assets/icons/Search.png',
                          height: MyHeight * 0.03,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: MyHeight * 0.04,
              ),
              Container(
                height: MyHeight * 0.04,
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: MyWidth * 0.1),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              categorySelect = [
                                false,
                                false,
                                false,
                                false,
                                false,
                              ];
                              categorySelect[index] = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                category[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: categorySelect[index] == true
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.3)),
                              ),
                              Container(
                                height: MyHeight * 0.002,
                                width: MyWidth * 0.035,
                                color: categorySelect[index] == true
                                    ? Color(0xffF39A06)
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MyHeight * 0.03,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.03),
                child: GridView.builder(
                  itemCount: foodList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Item(
                      item: foodList[index],
                    ));
                  },
                ),
              ))
            ],
          )),
    ));
  }
}
