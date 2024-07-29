import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/app/auth/data/models/register_model.dart';
import 'package:tut_app/app/auth/data/repository/auth_repository.dart';
import 'package:tut_app/services/errors/exceptions.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;
  RegisterCubit({required this.authService}) : super(RegisterInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  XFile? profilePic;

  Future<void> uploadImage({required XFile image}) async {
    profilePic = image;
    emit(UploadImageSuccess(image: image)); // success
  }

  void validateRegisterDataAndSignUp() {
    if (formKey.currentState!.validate()) {
      _register();
    }
  }

  //! backend request
  Future<void> _register() async {
    try {
      emit(RegisterLoading());

      final RegisterModel registerData = await authService.register(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        profilePic: profilePic,
      );
      emit(RegisterSuccess(message: registerData.message));
    } on ServerException catch (e) {
      debugPrint('====?>>> register cubit error:: ${e.error.errorMessage}');
      debugPrint('====?>>> register cubit error:: ${e.error.errorDetails}');
      emit(
        RegisterFailure(
          errMsg: e.error.errorDetails.toString() == 'null'
              ? e.error.errorMessage
              : e.error.errorDetails.toString(),
        ),
      );
    }
  }
}
