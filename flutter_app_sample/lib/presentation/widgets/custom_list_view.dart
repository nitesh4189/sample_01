//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  int index;
  String imageURL;
  String title;
  CustomListView({this.index, this.imageURL, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: index % 2 == 0 ? Colors.white : Color(0xFFF9F6F0),
        ),
        //height: 65,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("$imageURL"),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '$title',
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ));
  }
}
