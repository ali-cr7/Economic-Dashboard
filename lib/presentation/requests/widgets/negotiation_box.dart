import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleEconomyStudySection extends StatefulWidget {
  const SimpleEconomyStudySection({
    super.key,
    this.propertyId,
    this.negotiationId,
  });
  final propertyId;
  final negotiationId;
  @override
  State<SimpleEconomyStudySection> createState() =>
      _SimpleEconomyStudySectionState();
}

class _SimpleEconomyStudySectionState extends State<SimpleEconomyStudySection> {
  String paymentType = 'Bank Card';
  final TextEditingController negotiationOfferController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NegotiationOfferBloc, NegotiationOfferState>(
      listener: (context, state) {
        if (state is NegotiationOfferSuccess) {
          context.read<PropertyRequestDetailsBloc>().add(
            GetPropertiesRequestDetailsEvent(requestId: widget.propertyId),
          );
          EasyLoading.showSuccess(state.message);
        } else if (state is NegotiationOfferFailure) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: SaleEstateContainer(
        height: 400.h,
        width: 300.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: BlocBuilder<NegotiationOfferBloc, NegotiationOfferState>(
            builder: (context, state) {
              if (state is NegotiationOfferLoading) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "economy study:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: negotiationOfferController,
                      decoration: InputDecoration(
                        labelText: "negotiation offer:",
                        labelStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: DropdownField(
                        label: "payment type:",
                        items: ['Bank Card', 'Cash', 'Installment'],
                        selectedValue: paymentType,
                        onChanged: (value) {
                          setState(() {
                            paymentType = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 80.0.w),
                        child: InkWell(
                          onTap: () {
                            widget.negotiationId == 0
                                ? context.read<NegotiationOfferBloc>().add(
                                  CreateNegotiationOffer(
                                    offerContent:
                                        negotiationOfferController.text,
                                    propertyId: widget.propertyId,
                                    payWay: paymentType,
                                  ),
                                )
                                : context.read<NegotiationOfferBloc>().add(
                                  EditNegotiationOffer(
                                    offerContent:
                                        negotiationOfferController.text,
                                    negotiationId: widget.propertyId,
                                    payWay: paymentType,
                                  ),
                                );
                          },
                          child: Container(
                            width: 90.w,
                            height: 35.26.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, 1.00),
                                end: Alignment(1.00, 0.00),
                                colors: [
                                  const Color(0xFF836BFD),
                                  const Color(0xFF6855CA),
                                  const Color(0xFF5B4AB0),
                                  const Color(0xFF4E3F97),
                                ],
                              ).withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                widget.negotiationId == 0 ? 'Send' : 'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
