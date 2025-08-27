import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomSendButton extends StatelessWidget {
//   const CustomSendButton({
//     super.key,
//     required this.onTap,
//     required this.buttonName,
//     this.isEnabled = true, this.width, this.height,
//   });

//   final VoidCallback onTap;
//   final String buttonName;
//   final bool isEnabled;
//   final double? width;
//   final double? height;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isEnabled ? onTap : null,
//       child: Opacity(
//         opacity: isEnabled ? 1.0 : 0.5,
//         child: Container(
//           width:width?? 350.w,
//           height:height?? 44.h,
//           decoration: ShapeDecoration(
//             gradient: AppColors.backgroundGradient.withOpacity(0.65),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               buttonName,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class CustomSendButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double height;
  final double width;
  final String buttonName;
  final bool isEnabled;

  const CustomSendButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.buttonName,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey,
        minimumSize: Size(width, height),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}