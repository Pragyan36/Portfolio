import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portfilio/contants/colors.dart';
import 'package:portfilio/contants/nav_items.dart';
import 'package:portfilio/contants/size.dart';
import 'package:portfilio/contants/skills_items.dart';
import 'package:portfilio/style/style.dart';
import 'package:portfilio/widgets/drawer_mobile.dart';
import 'package:portfilio/widgets/header_desktop.dart';
import 'package:portfilio/widgets/header_mobile.dart';
import 'package:portfilio/widgets/main_desktop.dart';
import 'package:portfilio/widgets/main_mobile.dart';
import 'package:portfilio/widgets/site_logo.dart';
import 'package:portfilio/widgets/skills_desktop.dart';
import 'package:portfilio/widgets/skills_mobile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffolfKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
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
            if (constraints.maxWidth >= kMinDesktopWidth)
              const MainDesktop()
            else
              const MainMobile(),

            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  const Text(
                    "What I Can Do",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (constraints.maxWidth >= kMedDesktopWidth)
                    const Skills()
                  else
                    const SkillsMobile(),
                ],
              ),
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
