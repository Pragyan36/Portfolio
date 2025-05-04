import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portfilio/contants/colors.dart';
import 'package:portfilio/contants/nav_items.dart';
import 'package:portfilio/contants/size.dart';
import 'package:portfilio/style/style.dart';
import 'package:portfilio/widgets/drawer_mobile.dart';
import 'package:portfilio/widgets/header_desktop.dart';
import 'package:portfilio/widgets/header_mobile.dart';
import 'package:portfilio/widgets/main_desktop.dart';
import 'package:portfilio/widgets/site_logo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffolfKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        //layount builder containt constraints which gives the size of screen as well
        builder: (context, constraints) {
      return Scaffold(
        key: scaffolfKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //Header
            if (constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffolfKey.currentState?.openEndDrawer();
                },
              ),
            //Dashboard
            const MainDesktop(),

            //skills
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            //project
            Container(
              height: 500,
              width: double.infinity,
            ),
            //contact
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            //footer
            Container(
              height: 500,
              width: double.infinity,
            ),
          ],
        ),
      );
    });
  }
}
