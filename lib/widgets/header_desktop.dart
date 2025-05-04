import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfilio/contants/colors.dart';
import 'package:portfilio/contants/nav_items.dart';
import 'package:portfilio/style/style.dart';
import 'package:portfilio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary),
                ),
              ),
            )
        ],
      ),
    );
  }
}
