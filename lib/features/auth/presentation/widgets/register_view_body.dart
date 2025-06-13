import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';
import 'row_text.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late final GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  late final TextEditingController firstName, lastName, email, password;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    formKey = GlobalKey<FormState>();
    autoValidateMode = AutovalidateMode.always;
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              'Create Account',
              style: TextStyles.bold32,
            ),
            SizedBox(height: 32),
            CustomTextField(
              hintText: 'Firstname',
              controller: firstName,
              // onSaved: (value) {
              //   firstName.text = value.toString();
              // },
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Lastname',
              controller: lastName,
              // onSaved: (value) {
              //   lastName.text = value.toString();
              // },
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Email Address',
              controller: email,
              keyboardType: TextInputType.emailAddress,
              // onSaved: (value) {
              //   email.text = value.toString();
              // },
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              onSaved: (value) {
                password.text = value.toString();
              },
            ),
            SizedBox(height: 40),
            CustomButton(
              text: 'Continue',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  autoValidateMode = AutovalidateMode.always;
                  // No need to call formKey.currentState!.save();
                  final first = firstName.text;
                  final last = lastName.text;
                  final mail = email.text;
                  final pass = password.text;
                  Navigator.pushNamed(context, '/user-prefs');

                  // Use these values now
                }
                autoValidateMode = AutovalidateMode.disabled;
              },
            ),
            SizedBox(height: 40),
            RowText(
              text: 'Forgot Password ? ',
              tappedText: 'Reset',
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
