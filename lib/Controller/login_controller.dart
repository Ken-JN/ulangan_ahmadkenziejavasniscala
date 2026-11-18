import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Models/login_model.dart';
import 'package:ulangan_ahmadkenziejavasniscala/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar("Error", "Username dan Password harus diisi");
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString(),
        });

        isLoading.value = false;

        if (response.statusCode == 200) {
           loginModel.value = loginModelFromJson(response.body);

          if (loginModel.value?.status == true) {

            Get.snackbar("Success", loginModel.value!.message.toString());
            Get.offNamed(Routes.mainmenu);

          } else {

            Get.snackbar("Error", loginModel.value!.message.toString());

          }
        } else {
          Get.snackbar("Error", "Check internet connection");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("Error", e.toString());
      }
    }
  }
}