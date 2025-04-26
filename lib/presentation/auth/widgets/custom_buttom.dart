import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:flutter/material.dart';

// class CustomButtom extends StatelessWidget {
//   const CustomButtom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   width: 234,
//   height: 76,
//   decoration: ShapeDecoration(
//     gradient: AppColors.blueGradient,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//   ),
// );
//   }
// }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: SizedBox(
            width: 130,
            height: 45,
            child: Container(
              decoration: ShapeDecoration(
                gradient: AppColors.blueGradient,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
