import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/presentation/login/login_screen.dart';
import 'package:youth_care/presentation/settings/contact_screen.dart';
import 'package:youth_care/presentation/settings/dean_speech.dart';
import 'package:youth_care/presentation/widgets/setting_card.dart';

import '../widgets/divider.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     List<SettingCard> settinglist = [
    SettingCard(
      icon: Icon(
        FontAwesomeIcons.microphone,
        color: primaryColor,
      ),
      title: 'كلمة عميد الكلية',
      ontap: () {
        Navigator.pushNamed(context, DeanSpeech.id);
      },
    ),
    SettingCard(
      icon: Icon(
        FontAwesomeIcons.phone,
        color: primaryColor,
      ),
      title: 'Contact Us',
      ontap: () {
        Navigator.pushNamed(context, ContactScreen.id);
      },
    ),
    SettingCard(
        icon: Icon(
          FontAwesomeIcons.rightFromBracket,
          color: primaryColor,
        ),
        title: 'Log Out',
        ontap: () {
          showDialog(context: context,
           builder:(context) {
             return AlertDialog(
              title: Text('Log Out'),
              content: Text("Are you sure?"),
              actions: [
                 Row(
                          children: [
                            //btn cancel
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },

                                  child: Text("Cancel"),
                                ),
                              ),
                            ),

                            //btn sure
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                  child: Text('Sure',style: TextStyle(color: primaryColor),),
                                  onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        LoginScreen.id,
                                        (Route<dynamic> route) => false,
                                      );
                                    }
                                    ),
                                  
                                  
                                ),
                              ),
                          ],
                        ),
                      
              ],
             );
           }, 
           );
        }),
  ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height / 30),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return settinglist[index];
          },
          separatorBuilder: (context, index) => CustomDivider(),
          itemCount: settinglist.length,
        ),
      ),
    );
  }
}
