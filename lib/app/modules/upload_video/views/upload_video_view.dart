import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_video_controller.dart';

class UploadVideoView extends GetView<UploadVideoController> {
  const UploadVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadVideoView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Title", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
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
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "Enter your video category",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your video category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Video URL", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
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
              const Text("Thumbnail", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "Enter your video thumbnail URL",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your video thumbnail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Price", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
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
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (controller.formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
