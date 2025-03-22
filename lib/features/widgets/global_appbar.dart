import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/widgets/rightside_menu.dart';

class GlobalAppbar extends StatefulWidget implements PreferredSizeWidget {
  const GlobalAppbar({super.key});

  @override
  State<GlobalAppbar> createState() => _GlobalAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

void _openMenu(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Close on tap outside
    builder: (context) {
      return RightSideMenu();
    },
  );
}

class _GlobalAppbarState extends State<GlobalAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75.0,
      backgroundColor: AppColors.appBarBackground,
      iconTheme: IconThemeData(color: AppColors.fieryRed),
      title: Row(
        children: <Widget>[
          Image.asset('assets/images/logo_main.png', height: 45.0),
          SizedBox(width: 10),
          Text(
            'VEILED\nFRAMES',
            style: TextStyle(
              fontFamily: 'Lisu Bosa',
              color: AppColors.white,
              fontSize: 25.0,
              height: 0.90,
              fontWeight: FontWeight.w200,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu, color: AppColors.white, size: 40.0),
          onPressed: () => _openMenu(context),
        ),
      ],
    );
  }
}
