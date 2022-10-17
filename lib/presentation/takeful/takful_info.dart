import 'package:flutter/material.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/presentation/takeful/add_takeful.dart';

class TakeFullScreen extends StatelessWidget {
  TakeFullScreen({super.key});
  final Shader lgshader = const LinearGradient(
    colors: [
      Color(0xff891799),
      Color(0xff883ac9),
      Color(0xff6460d8),
      Color(0xff1f2e40),
      Color(0xff2f8bda),
      Color(0xff0ea6db)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(20.0, 100.0, 320.0, 400.0));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إدراة رعاية الشباب',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          actions: [Image.asset(benha)],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              padding: const EdgeInsets.only(
                  top: 8, bottom: 8, left: 8, right: 18),
              alignment: Alignment.centerRight,
              child: Text(
                'خدمة التكافل الأجتماعى',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = lgshader),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.blue),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                    ),
                    child: const Text(
                        'منحة من صندوق التكافل الأجتماعى الطلابى',
                        style: TextStyle(fontSize: 18)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('. إقامة سوق خيرى لصالح الطلاب',
                          style: TextStyle(fontSize: 16)),
                      Text(
                          '. إعطاء بعض الكتب مجانا من قبل هيئة أعضاء التدريس',
                          style: TextStyle(fontSize: 16)),
                      Text('. دفع رسوم المدينة الجامعية',
                          style: TextStyle(fontSize: 16)),
                      Text('. منحة طوارئ لحالة وفاة الوالد أو الظروف الطارئة',
                          style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.blue),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 48),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                    ),
                    child: const Text(
                        'إجراءات الحصول على دعم صندوق التكافل الأجتماعى',
                        style: TextStyle(fontSize: 17)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                          '. يقوم الصندوق بمساعدة الطلاب الذين يستحقون الإعانــــة',
                          style: TextStyle(fontSize: 16)),
                      Text('. بعد استيفاء الأوراق المطلوبة وبحث حالتهم',
                          style: TextStyle(fontSize: 16)),
                      Text('. وتكون المساعدة في الصور الآتية',
                          style: TextStyle(fontSize: 16)),
                      Text(
                          '. تسديد الرسوم الدراســية ، إعانة كتب، عمل النظارات الطبية ',
                          style: TextStyle(fontSize: 16)),
                      Text(
                          '. إعانة الكوارث، إعانة الوفــــاة، مساعدات خاصــة',
                          style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, TakafulRequest.id, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    child: const Text('تقديم الطلب',
                        style: TextStyle(fontSize: 16))),
                ElevatedButton(
                    onPressed: () {
                      // go back to news page
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    child: const Text('العودة الى صفحة الأخبار',
                        style: TextStyle(fontSize: 16))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
