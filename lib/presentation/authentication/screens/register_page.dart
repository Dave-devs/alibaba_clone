import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/constants/widget/reusable_textField.dart';
import 'package:alibaba_clone/presentation/authentication/screens/login_page.dart';
import 'package:alibaba_clone/presentation/authentication/widget/alt.dart';
import 'package:alibaba_clone/presentation/authentication/widget/have_acct.dart';
import 'package:alibaba_clone/presentation/authentication/widget/top_row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCont.dispose();
    emailCont.dispose();
    passwordCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Register Screen',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(height: 100.h,),
            Center(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.w,),
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 30.h,),

                    //Column Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: const TopRowText(
                        text1: 'Back to shopping convinience',
                        text2: 'Choose one of the options to go'
                      ),
                    ),
                    
                    SizedBox(height: 25.h,),
                    
                    //Email TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ReusableText(
                        controller: nameCont,
                        hintText: 'johndoe',
                        obscureText: false,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                        hintStyle: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w200),
                      ),
                    ),
                    
                    SizedBox(height: 10.h,),
                    
                    //Email TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ReusableText(
                        controller: emailCont,
                        hintText: 'johndoe@gmail.com',
                        obscureText: false,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                        hintStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                      ),
                    ),
                    
                    SizedBox(height: 10.h,),
                    
                    //Password TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ReusableText(
                        controller: passwordCont,
                        hintText: 'password',
                        obscureText: true,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                        hintStyle: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w200),
                      ),
                    ),
                    
                    SizedBox(height: 25.h,),
                    
                    //Or login with alternative and Don't have an account? row
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: HaveAcctRow(
                        text1: 'Or continue with',
                        text2: "Don't have account?",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage())
                          );
                        }
                      ),
                    ),

                    SizedBox(height: 25.h,),
                    
                    //Alternatives rows
                    Row(
                      children: [
                        AltItem(
                          onTap: () {

                          },
                          item: 'assets/images/google_logo.png'),
                        AltItem(
                          onTap: () {

                          },
                          item: 'assets/images/facebook_logo.png'),
                        AltItem(
                          onTap: () {

                          },
                          item: 'assets/images/apple_logo.png')
                      ],
                    ),
                    
                    SizedBox(height: 25.h,),
                    
                    //Login Button
                    Center(
                      child: ReusableButton(
                        text: 'Register',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                        minimumSize: Size(200.w, 40.h),
                      ),
                    ),
                    
                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100.h,),
          ],
        ));
  }
}
