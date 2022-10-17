import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:youth_care/constants.dart';

class TakafulRequest extends StatefulWidget {
  const TakafulRequest({super.key});
  static String id = 'takaful';

  @override
  State<TakafulRequest> createState() => _TakafulRequestState();
}

class _TakafulRequestState extends State<TakafulRequest> {
  bool requestLoading = false ;
  GlobalKey<FormState> requestkey = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: requestLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إدراة رعاية الشباب',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          actions: [Image.asset(benha)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:  [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 10
                  ),
                  child: const Text(
                    'طلب الحصول على خدمة التكافل',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    )
                  )
                ),
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    );
  }
}
