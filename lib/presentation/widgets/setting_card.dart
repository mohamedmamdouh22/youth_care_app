import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingCard extends StatelessWidget {
  SettingCard({required this.icon,required this.title,required this.ontap});
  Icon icon;
  String title;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width/40),
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          child: ListTile(
            leading:icon,
            
            title: Text(title),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}