import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});
  static String id='addnew screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('add news'),
    );
  }
}