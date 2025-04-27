import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberPicker extends StatefulWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final String? suffix;

  const NumberPicker({
    required this.label,
    required this.value,
    required this.onChanged,
    this.suffix,
    super.key,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Row(
        spacing: 10.w,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 80),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 107.w,
            height: 30.63.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: Text(
                    '${widget.value}',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 7.0.w,
                    top: 1.0.h,
                    //   bottom: 9.0.h,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => widget.onChanged(widget.value + 1),
                        child: Transform.rotate(
                          angle: 90 * (3.1415926535 / 180),
                          child: Icon(Icons.arrow_back_ios, size: 10.sp),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () => widget.onChanged(widget.value - 1),
                        child: Transform.rotate(
                          angle: -90 * (3.1415926535 / 180),
                          child: Icon(Icons.arrow_back_ios, size: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (widget.suffix != null) ...[
            //  const SizedBox(width: 2),
            Text(widget.suffix!, style: TextStyle(fontSize: 14.sp)),
          ],
        ],
      ),
    );
  }
}
