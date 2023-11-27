import 'package:flutter/material.dart';
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

class ReserPassScreen extends StatefulWidget {
  const ReserPassScreen({super.key});

  @override
  State<ReserPassScreen> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ReserPassScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteF7Color,
      body: SafeArea(
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
                      height: 128,
                      width: 128,
                    ),
                  ),
                  196.0.dp,
                  Form(
                    key: _formKey,
                    child: Box(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: resetPassHeader.lg(
                              1,
                              TextOverflow.ellipsis,
                              color: blackColor,
                              bold: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          128.0.dp,
                          SizedBox(
                            width: double.infinity,
                            child: resetPassDesc.sm(
                              3,
                              TextOverflow.ellipsis,
                              color: darkGreyColor,
                              bold: false,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          128.0.dp,
                          (email + requiredSymbol).sm(
                            1,
                            TextOverflow.ellipsis,
                            color: blackColor,
                            bold: false,
                            textAlign: TextAlign.center,
                          ),
                          16.0.dp,
                          TextBox(
                            textEditingController: _emailController,
                            last: true,
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
                          196.0.dp,
                          PrimaryButton(
                            withIcon: false,
                            icon: Icons.login,
                            text: resetPassBtn.md(1, TextOverflow.ellipsis,
                                color: whiteColor,
                                bold: true,
                                textAlign: TextAlign.center),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(resetPassMsg),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  loginRoute,
                                  (route) => false,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  128.0.dp,
                  TextActionButton(
                    text: resetPassBack,
                    bgColor: whiteF7Color,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
