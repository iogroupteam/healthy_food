import 'package:flutter/material.dart';
import 'package:food/Model/foodModel.dart';
import 'package:food/View/Pages/selectItem.dart';

class Item extends StatelessWidget {
  Item({Key? key, required this.item}) : super(key: key);

  FoodModel? item;

  @override
  Widget build(BuildContext context) {
    double MyHeight = MediaQuery.of(context).size.height;
    double MyWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SelectItem(item: item,)));
      },
      child: Container(
        // color: Colors.yellow,
        // height: MyHeight * 0.1,
        // width: MyWidth * 0.3,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MyWidth * 0.04),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MyHeight * 0.23,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25)),
                  // width: MyWidth * 0.1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyHeight * 0.09,
                      ),
                      Center(
                          child: Text(
                        item!.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: MyHeight * 0.008,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, indexx) {
                          return Padding(
                            padding: EdgeInsets.only(left: MyWidth * 0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 3,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: MyWidth * 0.01,
                                ),
                                Text(
                                  item!.material![indexx],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: MyHeight * 0.012,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/time.png',
                              height: MyHeight * 0.017,
                            ),
                            Text(
                              item!.time.toString() + ' min',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MyHeight * 0.06,
                backgroundImage: AssetImage(item!.mainPic.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
