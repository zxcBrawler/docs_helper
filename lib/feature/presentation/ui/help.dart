import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('HelpAndSupport',
            style: TextStyle(color: AppColor.textColor, fontSize: 34)));
  }
}
