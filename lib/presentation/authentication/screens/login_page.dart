import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/constants/widget/reusable_textfield.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:alibaba_clone/presentation/authentication/widget/alt.dart';
import 'package:alibaba_clone/presentation/authentication/widget/have_acct.dart';
import 'package:alibaba_clone/presentation/authentication/widget/top_row_text.dart';
import 'package:alibaba_clone/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String routeName = '/login_page';
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final AuthService authService = AuthService();

  void signInUser() {
    authService.signinUser(
        ref: ref,
        context: context,
        email: _emailCont.text,
        password: _passwordCont.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailCont.dispose();
    _passwordCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Login Screen',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  //Column Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const TopRowText(
                        text1: 'Back to shopping convinience',
                        text2: 'Choose one of the options to go'),
                  ),

                  Form(
                      key: _signInFormKey,
                      child: Column(children: [
                        SizedBox(
                          height: 25.h,
                        ),

                        //Email TextField
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: ReusableTextfield(
                            controller: _emailCont,
                            hintText: 'johndoe@gmail.com',
                            obscureText: false,
                            maxLines: 1,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 10.h),
                            hintStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w200),
                          ),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),

                        //Password TextField
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: ReusableTextfield(
                            controller: _passwordCont,
                            hintText: 'password',
                            obscureText: true,
                            maxLines: 1,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 10.h),
                            hintStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w200),
                          ),
                        ),

                        SizedBox(
                          height: 25.h,
                        ),

                        //Or login with alternative and Don't have an account? row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: HaveAcctRow(
                              text1: 'Or continue with',
                              text2: "Don't have account?",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()));
                              }),
                        ),

                        SizedBox(
                          height: 25.h,
                        ),

                        //Alternatives rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AltItem(
                                onTap: () {},
                                item: 'assets/images/google_logo.png'),
                            AltItem(
                                onTap: () {},
                                item: 'assets/images/facebook_logo.png'),
                            AltItem(
                                onTap: () {},
                                item: 'assets/images/apple_logo.png'),
                          ],
                        ),

                        SizedBox(
                          height: 25.h,
                        ),

                        //Login Button
                        Center(
                          child: ReusableButton(
                            text: 'Log in',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14.sp),
                            minimumSize: Size(200.w, 40.h),
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                          ),
                        ),
                      ])),

                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ));
  }
}
