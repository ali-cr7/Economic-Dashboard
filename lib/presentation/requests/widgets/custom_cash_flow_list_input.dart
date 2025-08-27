import 'package:economic_team_desktop/utility/app_colors%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCashFlowListInput extends StatefulWidget {
  final void Function(List<double>)? onChanged;

  const CustomCashFlowListInput({super.key, this.onChanged});

  @override
  State<CustomCashFlowListInput> createState() =>
      _CustomCashFlowListInputState();
}

class _CustomCashFlowListInputState extends State<CustomCashFlowListInput> {
  final List<TextEditingController> _controllers = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addCashFlow(); // Add initial input
  }

  void _addCashFlow() {
    setState(() {
      _controllers.add(TextEditingController());
    });
    _notifyChanges();
    // Scroll to bottom when new field is added
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _removeCashFlow(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
    _notifyChanges();
  }

  void _notifyChanges() {
    final values =
        _controllers.map((c) => double.tryParse(c.text) ?? 0).toList();
    widget.onChanged?.call(values);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // This Expanded contains the scrollable list of inputs
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children:
                  _controllers.asMap().entries.map((entry) {
                    final index = entry.key;
                    final controller = entry.value;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _notifyChanges(),
                              decoration: InputDecoration(
                                labelText: 'Year ${index + 1} Cash Flow',
                                labelStyle: TextStyle(fontSize: 12.sp),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          IconButton(
                            onPressed: () => _removeCashFlow(index),
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
        // Add Cash Flow button (fixed height)
        InkWell(
          onTap: _addCashFlow,
          child: Container(
            decoration: ShapeDecoration(
              gradient: AppColors.purple2Gradient,
              //color: Colors.white.withOpacity(0.74),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            height: 50.h,
            width: 40.w,
            child: Icon(Icons.add, size: 12.sp, color: AppColors.white),
          ),
        ),

    
      ],
    );
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }
}
