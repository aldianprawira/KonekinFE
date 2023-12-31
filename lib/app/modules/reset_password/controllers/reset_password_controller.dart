import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';

// ResetPasswordController adalah kelas GetX controller yang menangani logika reset password.
// Controller ini menggunakan GlobalKey<FormState> untuk validasi formulir, RxBool isLoading untuk melacak status loading, dan TextEditingController untuk menangani input alamat email.
// Metode resetPassword memeriksa apakah alamat email valid, kemudian mencoba mengirim email reset password melalui instance FirebaseAuth.
// Jika berhasil, controller menampilkan dialog konfirmasi dengan informasi bahwa tautan reset password telah dikirim ke alamat email yang bersangkutan, dan menawarkan opsi untuk kembali ke halaman login.
// Pada kasus kegagalan, controller menangani error dengan menampilkan dialog informasi bahwa reset password gagal.
// Keseluruhan proses berjalan dalam blok try-catch-finally, dan validasi alamat email dilakukan menggunakan GetUtils.isEmail dari GetX.

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if (GetUtils.isEmail(email)) {
      try {
        isLoading.value = true;
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Reset password",
          middleText: "A link for reset password has been sent to $email",
          textConfirm: "Login",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          buttonColor: primary,
          confirmTextColor: white,
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Something when wrong",
          middleText: "Failed to reset password.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Invalid email.",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
        buttonColor: primary,
        confirmTextColor: white,
      );
    }
  }
}
