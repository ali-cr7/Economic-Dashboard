import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNegotiationPart extends StatelessWidget {
  const UserNegotiationPart({
    super.key,
    required this.agreedNegotiationStatus,
    required this.agreedNegotiationText,
  });

  final String? agreedNegotiationStatus;
  final String? agreedNegotiationText;

  @override
  Widget build(BuildContext context) {
    return SaleEstateContainer(
      width: 605.h,
      height: 148.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                top: 4,
              ),
              child: _buildNegotiationStatusIcon(
                agreedNegotiationStatus!,
              ),
            ),
    
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.start,
                children: [
                  Text(
                    'negotiation offer:',
                    style: TextStyle(
                      color: const Color(
                        0xFF27B055,
                      ),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    agreedNegotiationText!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildNegotiationStatusIcon(String status) {
  IconData iconData;
  Color iconColor;

  switch (status.trim()) {
    case 'تم قبول الطلب من قبل المستخدم':
      iconData = Icons.check_circle;
      iconColor = Colors.green;
      break;
    case 'تم الرفض من قبل المستخدد':
      iconData = Icons.cancel;
      iconColor = Colors.red;
      break;
    case 'معلق':
      iconData = Icons.hourglass_top;
      iconColor = Colors.orange;
      break;
    default:
      iconData = Icons.help_outline;
      iconColor = Colors.grey;
  }

  return Icon(iconData, color: iconColor, size: 28.sp);
}