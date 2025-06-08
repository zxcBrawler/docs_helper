import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Dashboard',
      style: TextStyle(color: AppColor.textColor, fontSize: 34),
    ));
  }
}
