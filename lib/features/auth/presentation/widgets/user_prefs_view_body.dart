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

class UserPrefsViewBody extends StatefulWidget {
  const UserPrefsViewBody({super.key, required this.user});

  final UserCreateReqModel user;

  @override
  State<UserPrefsViewBody> createState() => _UserPrefsViewBodyState();
}

class _UserPrefsViewBodyState extends State<UserPrefsViewBody> {
  bool isMan = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        } else if (state is AuthSuccess) {
          showSnackBar(context, 'Register Successfully');
          Navigator.pushReplacementNamed(context, '/home');
          log(widget.user.toString());
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
                    SmallButton(
                      text: 'Men',
                      color: isMan
                          ? AppColors.primary
                          : AppColors.secondBackground,
                      onTap: () {
                        setState(() {
                          isMan = !isMan;
                        });
                        widget.user.gender = 'Male';
                      },
                    ),
                    SmallButton(
                      text: 'Women',
                      color: !isMan
                          ? AppColors.primary
                          : AppColors.secondBackground,
                      onTap: () {
                        setState(() {
                          isMan = !isMan;
                        });
                        widget.user.gender = 'Female';
                      },
                    ),
                  ],
                ),
                SizedBox(height: 56),
                AgeRangeDropdown(
                  onChanged: (value) {
                    widget.user.age = value;
                  },
                ),
                Spacer(),
                CustomButton(
                  text: 'Finish',
                  onTap: () {
                    widget.user.gender = isMan ? 'Male' : 'Female';
                    widget.user.age = widget.user.age ?? 'not- specified';
                    context.read<AuthCubit>().register(user: widget.user);
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
