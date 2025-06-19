import 'package:cached_network_image/cached_network_image.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/custom_serach_bar.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.title, this.onPress});
  final String title;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onPress != null)
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              onPress!();
              // go back to list
            },
          ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 70),
              fontSize: 40.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Row(
          spacing: 20.w,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 88.44.r,
                height: 88.44.r,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    // side: BorderSide(
                    //   width: 4.w,
                    //   color: const Color(0xFF836BFD),
                    // ),
                  ),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  child: CachedNetworkImage(
                    imageUrl:
                        (personalPhoto != null && personalPhoto!.isNotEmpty)
                            ? APIConfig.baseUrl + personalPhoto!
                            : defaultImage,
                    fit: BoxFit.contain,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              //  Assets.images.profilePhoto.image(
              //   fit: BoxFit.fill,
              // ),
            ),
          ],
        ),
      ],
    );
  }
}
