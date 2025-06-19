import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NegotiationOfferBox extends StatefulWidget {
  const NegotiationOfferBox({super.key, required this.propertyId});
  final String propertyId;
  @override
  State<NegotiationOfferBox> createState() => _NegotiationOfferBoxState();
}

class _NegotiationOfferBoxState extends State<NegotiationOfferBox> {
  TextEditingController offerController = TextEditingController();
late  String payWay;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.sp),
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: const Color(0x3F9A8AEC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: BlocBuilder<NegotiationOfferBloc, NegotiationOfferState>(
        builder: (context, state) {
          if (state is NegotiationOfferLoading) {
            return CircularProgressIndicator();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "economy study:",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: offerController,
                  decoration: InputDecoration(hintText: "negotiation offer"),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  value: 'Bank Card',
                  decoration: const InputDecoration(labelText: "payment type"),
                  items:
                      ['Bank Card', 'Cash', 'Installment'].map((type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      payWay = value!;
                    });
                  },
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle send action
                      context.read<NegotiationOfferBloc>().add(
                        CreateNegotiationOffer(
                          offerContent: offerController.text,
                          propertyId: widget.propertyId,
                          payWay: payWay,
                        ),
                      );
                    },
                    child: const Text("Send"),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
