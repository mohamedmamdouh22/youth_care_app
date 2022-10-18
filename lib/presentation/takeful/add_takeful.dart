import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/logic/requests/request_cubit.dart';
import 'package:youth_care/presentation/layout/layout_screen.dart';
import 'package:youth_care/presentation/widgets/custom_button.dart';
import 'package:youth_care/presentation/widgets/custom_text_field.dart';

class TakafulRequester extends StatelessWidget {
  TakafulRequester({super.key});

  static String id = 'takaful';
  bool requestLoading = false;
  GlobalKey<FormState> requestkey = GlobalKey();
  String? name, nat_id, stdemail, phone;
  String dep = 'القسم', ferka = 'الفرقة';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestCubit, RequestState>(
      listener: (context, state) {
        if (state is RequestLoading) {
          requestLoading = true;
        } else if (state is RequestSuccess) {
          showTopSnackBar(
              context,
              const CustomSnackBar.success(
                  message: 'Request Successfully Added !'));
          requestLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, LayoutScreen.id, (route) => false);
        } else if (state is RequestFailure) {
          showTopSnackBar(
              context, CustomSnackBar.error(message: state.errMessage));
          requestLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, LayoutScreen.id, (route) => false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: requestLoading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: const Text(
                'إدراة رعاية الشباب',
                style: TextStyle(fontSize: 25),
              ),
              centerTitle: true,
              actions: [Image.asset(benha)],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: requestkey,
                child: ListView(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text('طلب الحصول على خدمة التكافل',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))),
                    CustomFormTextField(
                      hint: 'الأسم بالكامل',
                      onChanged: (val) => name = val,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      hint: 'الرقم القومى',
                      onChanged: (val) => nat_id = val,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      hint: 'الايميل',
                      onChanged: (val) => stdemail = val,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      hint: 'رقم الهاتف',
                      onChanged: (val) => phone = val,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'الرياضيات و الفزيقا',
                                child: Text('الرياضيات و الفزيقا')),
                            DropdownMenuItem<String>(
                                value: 'الهندسة الكهربية',
                                child: Text('الهندسة الكهربية')),
                            DropdownMenuItem<String>(
                                value: 'الهندسة الميكانيكية',
                                child: Text('الهندسة الميكانيكية')),
                            DropdownMenuItem<String>(
                                value: 'الهندسة المدنية',
                                child: Text('الهندسة المدنية')),
                            DropdownMenuItem<String>(
                                value: 'الهندسة المعمارية',
                                child: Text('الهندسة المعمارية')),
                            DropdownMenuItem<String>(
                                value: 'هندسة المساحة',
                                child: Text('هندسة المساحة')),
                          ],
                          hint:
                              Text(BlocProvider.of<RequestCubit>(context).dep),
                          onChanged: (value) {
                            BlocProvider.of<RequestCubit>(context)
                                .setDepartement(value!);
                            dep =
                                BlocProvider.of<RequestCubit>(context).dep;
                          }),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'الإعدادية', child: Text('الإعدادية')),
                            DropdownMenuItem<String>(
                                value: 'الأولى', child: Text('الأولى')),
                            DropdownMenuItem<String>(
                                value: 'الثانية', child: Text('الثانية')),
                            DropdownMenuItem<String>(
                                value: 'الثالثة', child: Text('الثالثة')),
                            DropdownMenuItem<String>(
                                value: 'الرابعة', child: Text('الرابعة')),
                          ],
                          hint: Text(
                              BlocProvider.of<RequestCubit>(context).stdferka),
                          onChanged: (value) {
                            BlocProvider.of<RequestCubit>(context)
                                .setFerka(value!);
                            ferka =
                                BlocProvider.of<RequestCubit>(context).stdferka;
                          }),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'تقديم الطلب',
                      onPressed: () {
                        BlocProvider.of<RequestCubit>(context).appendRequest(
                          name: name!,
                          nat_id: nat_id!,
                          stdemail: stdemail!,
                          phone: phone!,
                          dep: dep,
                          ferka: ferka,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'إلغاء الطلب',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
