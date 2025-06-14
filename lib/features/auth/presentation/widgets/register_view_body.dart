import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late final TextEditingController firstName, lastName, email, password;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    formKey = GlobalKey<FormState>();
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
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Lastname',
              controller: lastName,
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Email Address',
              controller: email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              onSaved: (value) {
                password.text = value.toString();
              },
              isObscure: true,
            ),
            SizedBox(height: 40),
            CustomButton(
              text: 'Continue',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  UserCreateReqModel user = UserCreateReqModel(
                    firstName: firstName.text,
                    lastName: lastName.text,
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.pushNamed(context, '/user-prefs', arguments: user);

                  // Use these values now
                } else {}
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              },
            ),
            SizedBox(height: 40),
            RowText(
              text: 'Forgot Password ? ',
              tappedText: 'Reset',
              onTap: () {
                Navigator.pushNamed(context, '/reset');
              },
            ),
          ],
        ),
      ),
    );
  }
}
