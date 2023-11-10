import 'package:flutter/material.dart';

import '../constants/constants.dart';

Column icons(String text, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: AppConstants.iconColor,
        ),
        Text(
          text,
          style: const TextStyle(
              color: AppConstants.primarytTextColor,
              fontSize: AppConstants.smallFont),
        )
      ],
    );
  }

 