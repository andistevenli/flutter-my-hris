import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/login/controller/login_controller.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/feature/widget/primary_button.dart';
import 'package:my_hris/feature/widget/text_action_button.dart';
import 'package:my_hris/feature/widget/text_box.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_route.dart';
import 'package:my_hris/utils/constant/constant_text.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';
import 'package:my_hris/utils/regex/regex.dart';
import 'package:my_hris/utils/responsive/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void loginSuccess(bool isLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('logged_in', isLoggedIn);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: whiteF7Color,
      body: Consumer(
        builder: (context, ref, child) => ref.watch(loginController).when(
              data: (data) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(pagePadding),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: Image.network(
                              eurekaEdutechLogoUrl,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          32.0.dp,
                          Form(
                            key: _formKey,
                            child: Box(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: loginHeader.lg(
                                      1,
                                      TextOverflow.ellipsis,
                                      color: blackColor,
                                      bold: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  16.0.dp,
                                  (email + requiredSymbol).sm(
                                    1,
                                    TextOverflow.ellipsis,
                                    color: blackColor,
                                    bold: false,
                                    textAlign: TextAlign.center,
                                  ),
                                  8.0.dp,
                                  TextBox(
                                    textEditingController: _emailController,
                                    last: false,
                                    textInputType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    isPassword: false,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        email + isRequired;
                                      }
                                      if (!RegExp(emailRegex).hasMatch(value)) {
                                        invalid + email;
                                      }
                                    },
                                    hintText: hint + email,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return email + isRequired;
                                      }
                                      if (!RegExp(emailRegex).hasMatch(value)) {
                                        return invalid + email;
                                      }
                                      return null;
                                    },
                                  ),
                                  16.0.dp,
                                  (password + requiredSymbol).sm(
                                    1,
                                    TextOverflow.ellipsis,
                                    color: blackColor,
                                    bold: false,
                                    textAlign: TextAlign.center,
                                  ),
                                  8.0.dp,
                                  TextBox(
                                    textEditingController: _passwordController,
                                    last: true,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    textCapitalization: TextCapitalization.none,
                                    isPassword: true,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        password + isRequired;
                                      }
                                      if (!RegExp(passwordRegex)
                                          .hasMatch(value)) {
                                        invalid + password;
                                      }
                                    },
                                    hintText: hint + password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return password + isRequired;
                                      }
                                      if (!RegExp(passwordRegex)
                                          .hasMatch(value)) {
                                        return invalid + password;
                                      }
                                      return null;
                                    },
                                  ),
                                  64.0.dp,
                                  PrimaryButton(
                                    withIcon: false,
                                    icon: Icons.login,
                                    text: loginBtn.md(1, TextOverflow.ellipsis,
                                        color: whiteColor,
                                        bold: true,
                                        textAlign: TextAlign.center),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (_emailController.text ==
                                                data.email &&
                                            _passwordController.text ==
                                                data.password) {
                                          loginSuccess(true);
                                          Navigator.pushReplacementNamed(
                                              context, dashboardRoute);
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              backgroundColor: whiteColor,
                                              title: const Text(incorrect),
                                              content: const Text(
                                                  "Your $email and/or $password is $incorrect."),
                                              actions: [
                                                TextActionButton(
                                                  text: okay,
                                                  bgColor: whiteColor,
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          24.0.dp,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              loginForgotPass.sm(
                                1,
                                TextOverflow.ellipsis,
                                color: darkGreyColor,
                                bold: false,
                                textAlign: TextAlign.center,
                              ),
                              TextActionButton(
                                text: loginResetPass,
                                bgColor: whiteF7Color,
                                onPressed: () {
                                  Navigator.pushNamed(context, resetPassRoute);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              error: (error, stackTrace) => const Center(
                child: Text("Yah Error Nih :("),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 2,
                ),
              ),
            ),
      ),
    );
  }
}
