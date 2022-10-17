import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactCard extends StatelessWidget {
  ContactCard({required this.icon,required this.title});
  Icon icon;
  String title;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width/40),
      child: Card(
        child: ListTile(
          title: Text(title,textAlign: TextAlign.end,),
          trailing: icon,
        ),
      ),
    );
  }
}