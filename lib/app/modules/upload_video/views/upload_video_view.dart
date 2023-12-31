import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../shared/theme/color.dart';
import '../controllers/upload_video_controller.dart';

class UploadVideoView extends GetView<UploadVideoController> {
  const UploadVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Course"),
        centerTitle: true,
      ),
      body: GetBuilder<UploadVideoController>(
        builder: (controller) => FutureBuilder(
          future: controller.futureProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              String creator = data["Name"];
              return Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Thumbnail", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                      controller.image == null
                          ? Container(
                              width: Get.width,
                              height: Get.width * 9 / 16,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: grey2),
                              ),
                              child: const Center(
                                child: Text("Image has not been selected"),
                              ),
                            )
                          : Container(
                              width: Get.width,
                              height: Get.width * 9 / 16,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: FileImage(File(controller.image!.path))),
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: grey2),
                              ),
                            ),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () => controller.pickImage(),
                          child: const Text("Choose image"),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Title", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: controller.titleCtrl,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Enter your video title",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your video title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text("Description", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: controller.descriptionCtrl,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        minLines: 5,
                        maxLines: 20,
                        decoration: const InputDecoration(
                          hintText: "Enter your video description",
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your video description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text("Category", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                      DropdownSearch(
                        validator: (value) => value == null ? "Please choose your video category" : null,
                        autoValidateMode: AutovalidateMode.disabled,
                        items: const [
                          "Animation",
                          "Business",
                          "Design",
                          "Development",
                          "Finance & Accounting",
                          "Health",
                          "Lifestyle",
                          "Marketing",
                          "Personal Development",
                          "Science",
                          "IT & Software",
                        ],
                        onChanged: (value) => controller.categoryCtrl.text = value!,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          baseStyle: TextStyle(fontSize: 16),
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Choose your video category",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        clearButtonProps: const ClearButtonProps(isVisible: true),
                      ),
                      const SizedBox(height: 16),
                      const Text("Video URL", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: controller.videoURLCtrl,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Enter your video URL",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your video URL';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          text: "Price  ",
                          style: TextStyle(color: black, fontSize: 16),
                          children: [
                            TextSpan(text: "  (Ex: Rp999.000,00)", style: TextStyle(color: grey2, fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: controller.priceCtrl,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Enter your video price",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your video price';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: Get.width,
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (controller.formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                controller.uploadVideo(creator);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                            ),
                            child: controller.isLoading.isFalse
                                ? const Text(
                                    "Upload",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                : const Text(
                                    "Loading...",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
