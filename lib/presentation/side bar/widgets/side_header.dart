import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Row(
        children: [Assets.images.appIcon2.image(width: 140.w, height: 140.w)],
      ),
    );
  }
}
