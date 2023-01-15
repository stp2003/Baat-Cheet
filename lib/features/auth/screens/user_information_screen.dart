import 'dart:io';

import 'package:flutter/material.dart';

import '../../../common/utils/utils.dart';

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    image == null
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.redwolf.in%2Fimage%2Fcatalog%2Fstickers%2Fstar-wars-darth-vader-mask-sticker.jpg&imgrefurl=https%3A%2F%2Fwww.redwolf.in%2Fstar-wars-darth-vader-mask-sticker&tbnid=WMEVsaFiPwPSEM&vet=12ahUKEwir7aKPjsn8AhWd83MBHdq7DGgQMyggegUIARCsAg..i&docid=m-S8fHpn29qHJM&w=700&h=700&q=darth%20vader%20images&ved=2ahUKEwir7aKPjsn8AhWd83MBHdq7DGgQMyggegUIARCsAg',
                            ),
                            radius: 60,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(
                              image!,
                            ),
                            radius: 60,
                          ),
                    Positioned(
                      bottom: -8,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
