import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/expert_message.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/expert_message_with_buttons.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/input_chat_field.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NegotaitionView extends StatefulWidget {
  const NegotaitionView({super.key});

  @override
  State<NegotaitionView> createState() => _NegotaitionViewState();
}

class _NegotaitionViewState extends State<NegotaitionView> {
  bool _showNegotiationBox = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeHeader(title: 'Negotiation '),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        SizedBox(height: 30.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 32.0.w, right: 32.0.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      // Message from expert (left bubble)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ExpertMessage(),
                      ),
                      SizedBox(height: 8.h),
                      // Message from user (right bubble)
                      Align(
                        alignment: Alignment.centerRight,
                        child: UserMessage(),
                      ),
                      SizedBox(height: 8.h),
                      // Offer message with buttons
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ExpertMessageWithButtons(),
                      ),
                      const Spacer(),
                      // Input Field
                      if (_showNegotiationBox)
                        Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: NegotiationOfferBox(),
                        ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showNegotiationBox = !_showNegotiationBox;
                          });
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 14.0.w),
                              child: Assets.images.saveIcon.image(
                                width: 32.w,
                                height: 32.h,
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(12.0.sp),
                                child: InputChatField(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    width: 530.w,
                    height: 868.h,
                    decoration: ShapeDecoration(
                      color: const Color(0x3D9A8AEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 200.44.r,
                          height: 200.44.r,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 4.w,
                                color: const Color(0xFF836BFD),
                              ),
                            ),
                          ),
                          child: Assets.images.profilePhoto.image(
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NegotiationOfferBox extends StatelessWidget {
  const NegotiationOfferBox({super.key});

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
                const TextField(
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
                  onChanged: (value) {},
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle send action
                    //  context.read<NegotiationOfferBloc>().add(CreateNegotiationOffer(offerContent: offerContent, propertyId: propertyId, payWay: payWay))
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
