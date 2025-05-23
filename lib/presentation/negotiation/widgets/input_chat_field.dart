import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputChatField extends StatelessWidget {
  const InputChatField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Color(0x4F786CB9),
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
    
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'message.....',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 13.sp,
                  fontFamily: 'Inter',
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xFF786CB9),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}