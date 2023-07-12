import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missed_people/core/API/user.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/widgets/app_widgets.dart';

import '../../../core/shared_preferences/shared_pref_user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController textEmailController =
      TextEditingController(text: PrefUser.getUser()?.email);

  TextEditingController textMobileController =
      TextEditingController(text: PrefUser.getUser()?.phone);

  TextEditingController textPasswordController = TextEditingController();

  TextEditingController textNameController =
      TextEditingController(text: PrefUser.getUser()?.name);

  XFile? image;
  final ImagePicker picker = ImagePicker();
  String fireBasePath = '';
  bool loading = false;
  String imageData = '';

  Future selectImage() async {
    imageData = '';
    if (image == null) return;

    setState(() => loading = true);
    print("Selected File Name is: ");
    print(image!.name);

    imageData = base64Encode(await image!.readAsBytes());

    setState(() => loading = false);
  }

  // we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() => image = img);
    await selectImage();
  }

  // show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: imageData.isNotEmpty
                            ? Image.memory(
                                base64Decode(imageData),
                              ).image
                            : PrefUser.getUser()!.picture.isNotEmpty
                                ? Image.network(
                                    PrefUser.getUser()!.picture,
                                  ).image
                                : const NetworkImage(
                                    'https://th.bing.com/th/id/OIP.C4_ifNigEcuZrZttvlxbgwAAAA?pid=ImgDet&w=358&h=358&rs=1'),
                      ),
                      InkWell(
                        onTap: () {
                          myAlert();
                        },
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Center(
                  child: Text(
                    PrefUser.getUser()?.name ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                AppWidgets.customTextFormField(
                  context,
                  textNameController,
                  TextInputType.text,
                  false,
                  'Client',
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                AppWidgets.customTextFormField(
                  context,
                  textEmailController,
                  TextInputType.emailAddress,
                  false,
                  'email@domain.com',
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'Mobile Number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                AppWidgets.customTextFormField(
                  context,
                  textMobileController,
                  TextInputType.phone,
                  false,
                  '+201234567890',
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'New password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                AppWidgets.customTextFormField(
                  context,
                  textPasswordController,
                  TextInputType.text,
                  true,
                  '***********',
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                MaterialButton(
                  onPressed: () async {
                    Map<String, dynamic>? response = await updateData(
                      textMobileController.text,
                      textEmailController.text,
                      textPasswordController.text,
                      textNameController.text,
                      imageData,
                    );
                    if (response != null) {
                      PrefUser.setUser(response);
                      AppWidgets.showMessage(
                        context,
                        'Account updated successfully!',
                        isError: false,
                      );
                      setState(() {});
                    }
                  },
                  minWidth: double.infinity,
                  color: AppColors.primaryColor,
                  height: context.height * 0.07,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
