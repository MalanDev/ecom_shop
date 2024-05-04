import 'package:ecom_shop/config/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../config/assets_manager.dart';
import '../../config/values_manager.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              ImagePngAssets.appLogo,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product 1", style: getMediumStyle()),
                const SizedBox(height: 4.0),
                Text(
                  "description",
                  style: getLightStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
