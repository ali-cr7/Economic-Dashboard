import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputChatField extends StatelessWidget {
  const InputChatField({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });
  final TextEditingController controller;
  final Function(String) onSubmitted;

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
              controller: controller,
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
              onSubmitted: onSubmitted, // Add this to handle Enter key
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF786CB9)),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onSubmitted(controller.text); // Call the function with the text
                controller.clear(); // Clear the text field after sending
              }
            },
          ),
        ],
      ),
    );
  }
}

// class InputChatField extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String) onSubmitted;

//   const InputChatField({
//     super.key,
//     required this.controller,
//     required this.onSubmitted,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: 'Type your message...',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       onSubmitted: onSubmitted,
//     );
//   }
// }
