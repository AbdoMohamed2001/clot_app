import 'dart:developer';

import 'package:clot_app/core/build_snack_bar.dart';
import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/range_widget.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/small_button.dart';

class UserPrefsViewBody extends StatelessWidget {
  const UserPrefsViewBody({super.key, required this.user});

  final UserCreateReqModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        } else if (state is AuthSuccess) {
          showSnackBar(context, 'Register Successfully');
          Navigator.pushReplacementNamed(context, '/home');
          log(user.toString());
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AuthLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us About yourself',
                  style: TextStyles.bold24,
                ),
                SizedBox(height: 49),
                Text(
                  'Who do you shop for ?',
                  style: TextStyles.book16,
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallButton(text: 'Men'),
                    SmallButton(
                        text: 'Women', color: AppColors.secondBackground),
                  ],
                ),
                SizedBox(height: 56),
                AgeRangeDropdown(),
                Spacer(),
                CustomButton(
                  text: 'Finish',
                  onTap: () {
                    user.gender = 'Male';
                    user.age = '18-24';
                    context.read<AuthCubit>().register(user: user);
                  },
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
        );
      },
    );
  }
}
