import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/core/logic/auth_provider.dart';
import 'package:your_app_name/presentation/widgets/app_button.dart';
import 'package:your_app_name/presentation/widgets/app_text_display.dart';
import '../widgets/app_padding.dart';
import '../widgets/form_fields/app_input_text_field.dart';
import '../widgets/form_fields/app_password_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: AppPadding(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const AppText(
                  text: "Login",
                  isUpper: true,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const AppPadding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(
                    thickness: 3,
                    height: 2,
                  ),
                ),
                AppTextInputField(
                  controller: userNameController,
                  suffixIcon: const Icon(Icons.person),
                  hintText: "User Name",
                ),
                const SizedBox(height: 20),
                AppTextInputField(
                  controller: emailController,
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                ),
                const SizedBox(height: 20),
                AppPasswordInputField(
                  controller: passwordController,
                  hintText: "Password",
                ),
                const SizedBox(height: 20),
                AppButton(
                  color: Colors.teal,
                  translation: "Login",
                  onTap: () {
                    Provider.of<AuthProvider>(context,listen: false).defaultRegister(
                        email: emailController.text,
                        userName: userNameController.text,
                        password: passwordController.text,
                        context: context);
                  },
                )
              ],
            ),
        ),
      ),
          )),
    );
  }
}
