import 'package:flutter/material.dart';
import 'package:food/Model/foodModel.dart';

class SelectItem extends StatefulWidget {
  SelectItem({this.item});

  FoodModel? item;

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
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
              Stack(
                children: [
                  Container(
                    height: MyHeight * 0.3,
                    width: MyWidth,
                    child: Image.asset(
                      widget.item!.mainPic.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MyHeight * 0.3,
                    width: MyWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xff1E1E1E)])),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MyWidth * 0.05, vertical: MyHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/icons/Back.png',
                            height: MyHeight * 0.03,
                          ),
                        ),
                        Image.asset(
                          'assets/icons/like.png',
                          height: MyHeight * 0.03,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MyWidth * 0.08, vertical: MyHeight * 0.01),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: MyWidth * 0.01,
                        right: MyWidth * 0.06,
                        top: MyHeight * 0.009,
                        bottom: MyHeight * 0.009,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/time.png',
                            height: MyHeight * 0.028,
                          ),
                          Text(
                            widget.item!.time.toString() + ' min',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MyHeight * 0.02,
              ),
              Expanded(
                  child: ListView(
                children: [
                  Center(
                    child: Text(
                      widget.item!.name.toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: 30, letterSpacing: 4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MyWidth * 0.08, vertical: MyHeight * 0.02),
                    child: Text(
                      widget.item!.prepare.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MyHeight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Protein',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: myLine()),
                        Text(
                          widget.item!.nutritionalValue![0].protein.toString(),
                          style:
                              TextStyle(color: Color(0xffF39A06), fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fats',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: myLine()),
                        Text(
                          widget.item!.nutritionalValue![0].fat.toString(),
                          style:
                              TextStyle(color: Color(0xffF39A06), fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Carbohydrates',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: myLine()),
                        Text(
                          widget.item!.nutritionalValue![0].carbohydrates
                              .toString(),
                          style:
                              TextStyle(color: Color(0xffF39A06), fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Calories',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: myLine()),
                        Text(
                          widget.item!.nutritionalValue![0].calories.toString(),
                          style:
                              TextStyle(color: Color(0xffF39A06), fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MyHeight * 0.02,
                  ),
                  Center(
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MyHeight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.08),
                    child: Container(
                        height: MyHeight * 0.1,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.item!.materialPics!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: MyWidth * 0.05),
                              child: Container(
                                height: MyHeight * 0.1,
                                width: MyWidth * 0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            widget.item!.materialPics![index]),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                        )),
                  )
                ],
              ))
            ],
          )),
    ));
  }

  Widget myLine() {
    double MyHeight = MediaQuery.of(context).size.height;
    double MyWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.05),
      child: Container(
        height: MyHeight * 0.0003,
        color: Colors.white,
      ),
    );
  }
}
