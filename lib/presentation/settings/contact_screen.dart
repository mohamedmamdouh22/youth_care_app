import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/presentation/widgets/contact_card.dart';

import '../widgets/divider.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  static String id = 'contactscreen';
  List<ContactCard> contactlist=[
    ContactCard(icon: Icon(FontAwesomeIcons.locationPin,color: primaryColor,), title: ' العنوان : كلية الهندسة بشبرا 108 ش شبرا - القاهرة'),
    ContactCard(icon: Icon(FontAwesomeIcons.phone,color: primaryColor,), title:'التليفون:022022310'),
    ContactCard(icon: Icon(FontAwesomeIcons.fax,color: primaryColor,), title:'الفاكس:0224303441'),
    ContactCard(icon: Icon(FontAwesomeIcons.at,color: primaryColor,), title:'info@feng.bu.edu.eg:البريد الالكتروني'),
    ContactCard(icon: Icon(FontAwesomeIcons.envelope,color: primaryColor,), title:'الرقم البريدي:11629'), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاتصال بالكلية'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.separated(
          itemBuilder: (context, index) => contactlist[index],
          separatorBuilder: (context, index) => CustomDivider(),
          itemCount: contactlist.length,
        ),
      ),
    );
  }
}
