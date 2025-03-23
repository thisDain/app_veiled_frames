import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(),
      body: formBody(),
      backgroundColor: AppColors.background,
    );
  }

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();

  void handleEditProfile() async {
    //TODO: add edit functionality
  }

  Widget formBody() {
    return (SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            inputField(
              _firstName,
              "First Name:",
              "First Name",
              TextInputType.text,
            ),
            inputField(_lastName, "Last Name", "Last Name", TextInputType.text),
            inputField(
              _image,
              "Change Profile Picture",
              "Paste URL here",
              TextInputType.text,
            ),
            inputField(
              _emailAddress,
              "Email Address",
              "Email Address",
              TextInputType.emailAddress,
            ),
            inputField(
              _contactNumber,
              "Contact Number",
              "--",
              TextInputType.number,
            ),
            inputField(_address, "Address", "--", TextInputType.text),
            inputField(_city, "City/Municipality", "--", TextInputType.text),
            inputField(_province, "Province", "--", TextInputType.text),
            inputField(_postalCode, "Postal Code", "--", TextInputType.number),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // todo: edit profile
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.fieryRed,
                  side: const BorderSide(color: AppColors.fieryRed, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  "Update Profile",
                  style: TextStyle(
                    color: AppColors.whiteShade,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget inputField(
    TextEditingController controller,
    String title,
    String label,
    TextInputType type,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align label to the left
      children: [
        Text(
          title, // Static label above the TextField
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        // Add spacing between label and TextField
        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color: AppColors.fieryRed.withOpacity(0.75),
              fontStyle: FontStyle.italic,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.whiteShade,
          ),

          keyboardType: type,
        ),
        SizedBox(height: 17),
      ],
    );
  }
}
