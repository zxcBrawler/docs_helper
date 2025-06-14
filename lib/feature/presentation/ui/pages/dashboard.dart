import 'package:docs_helper/config/app_constants.dart';
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
    return Scrollbar(
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryBackground,
                      borderRadius: AppConstants.deaultElementBorderRadius,
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryBackground,
                        borderRadius: AppConstants.deaultElementBorderRadius,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryBackground,
                        borderRadius: AppConstants.deaultElementBorderRadius,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryBackground,
                      borderRadius: AppConstants.deaultElementBorderRadius,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
