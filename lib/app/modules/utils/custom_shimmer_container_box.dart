import 'package:flutter/material.dart';
import 'package:inspecly/app/modules/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmerContainerBox extends StatelessWidget {
  final double height;
  final double? width;
  const CustomShimmerContainerBox({
    super.key,
    required this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, 
      highlightColor: Colors.grey.shade50, 
      child: Container(
        height: getProportionateScreenHeight(height), 
        width: width != null ? getProportionateScreenWidth(width!) : null,
        margin: EdgeInsets.only(top: getProportionateScreenHeight(5)),
        color: Colors.white
      ),
    );
  }
}
