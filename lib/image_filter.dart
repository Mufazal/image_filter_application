import 'dart:io';

import 'package:flutter/material.dart';

class ImageFilterPage extends StatefulWidget {
  @override
  _ImageFilterPageState createState() => _ImageFilterPageState();
}

class _ImageFilterPageState extends State<ImageFilterPage> {
  File image;

  var height, width;
  Color filterColor;
  int selectedfilter;

  List<Color> listColors = [
    Colors.red.withOpacity(0.3),
    Colors.blue.withOpacity(0.3),
    Colors.yellow.withOpacity(0.3),
    Colors.green.withOpacity(0.3),
    Colors.pink.withOpacity(0.3),
    Colors.white.withOpacity(0.3),
    Colors.grey.withOpacity(0.3),
    Colors.orange.withOpacity(0.3)
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Filter"),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
                child: Container(
                    width: width * 0.8,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              filterColor == null
                                  ? Colors.transparent
                                  : filterColor,
                              BlendMode.color),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/image_edit.jpg",
                                  ),
                                  fit: BoxFit.fill),
                            ),
                            // child: Container(
                            //   height: height,
                            //   //  width: width * 0.2,
                            //   color: filterColor == null
                            //       ? Colors.transparent
                            //       : filterColor,
                            // ),
                          ),
                        )
                        // Container(
                        //   child: Image.asset(
                        //     "assets/image_edit.jpg",
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        // Container(
                        //   color: filterColor == null
                        //       ? Colors.transparent
                        //       : filterColor,
                        // )
                      ],
                    )),
              ),
            ),
            Container(
              height: height * 0.16,
              child: ListView.builder(
                itemCount: listColors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          filterColor = listColors[index];
                          selectedfilter = listColors[index].value;
                        });
                      },
                      child: Container(
                        width: width * 0.18,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/image_edit.jpg",
                                      ),
                                      fit: BoxFit.fill),
                                  border: Border.all(
                                      color: selectedfilter ==
                                              listColors[index].value
                                          ? Colors.blue
                                          : Colors.transparent,
                                      width: 2)),
                              child: Container(
                                height: height,
                                width: width * 0.2,
                                color: listColors[index],
                              ),
                              // child:
                              //image == null
                              // ? Container(
                              //     child: Center(
                              //     child: Text("Select Image"),
                              //   ))
                              // :
                              //     Image.asset(
                              //   "assets/image_edit.jpg",
                              //   fit: BoxFit.cover,
                              // )
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
