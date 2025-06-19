import 'package:economic_team_desktop/buisness_logic/cubit/negotiation_data_cubit_cubit.dart';
import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/label_widget.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NegotiationBox extends StatefulWidget {
  const NegotiationBox({
    super.key,
    this.propertyId,
    this.negotiationId,
    this.agredNegotiationState,
  });
  final propertyId;
  final negotiationId;
  final agredNegotiationState;
  @override
  State<NegotiationBox> createState() => _NegotiationBoxState();
}

class _NegotiationBoxState extends State<NegotiationBox> {
  String paymentType = 'Bank Card';
  final TextEditingController negotiationOfferController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NegotiationDataCubitCubit>();
    return BlocListener<NegotiationOfferBloc, NegotiationOfferState>(
      listener: (context, state) {
        if (state is NegotiationOfferSuccess) {
          // context.read<PropertyRequestDetailsBloc>().add(
          //   GetPropertiesRequestDetailsEvent(requestId: widget.propertyId),
          // );
          // context.read<NegotiationDataCubitCubit>().getNegotiationOffer(
          //   widget.propertyId,
          // );
          //  Navigator.of(context).pop();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cubit.getNegotiationOffer(int.tryParse(widget.propertyId!)!);
          });
          Navigator.of(context).pop();
          EasyLoading.showSuccess(state.message);
        } else if (state is NegotiationOfferFailure) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: Column(
        children: [
          LabelWidget(text: "Negotiation offer"),
          SaleEstateContainer(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create Negotiation:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        NegotiationInputField(
                          controller: negotiationOfferController,
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: DropdownField(
                              label: "Payment type:",
                              items: ['Bank Card', 'Cash', 'Installment'],
                              selectedValue: paymentType,
                              onChanged: (value) {
                                setState(() {
                                  paymentType = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: NegotiaitonButton(
                            widget: widget,
                            negotiationOfferController:
                                negotiationOfferController,
                            paymentType: paymentType,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NegotiaitonButton extends StatelessWidget {
  const NegotiaitonButton({
    super.key,
    required this.widget,
    required this.negotiationOfferController,
    required this.paymentType,
  });

  final NegotiationBox widget;
  final TextEditingController negotiationOfferController;
  final String paymentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 80.0.w),
      child: InkWell(
        onTap: () {
          widget.agredNegotiationState == 'معلق'
              ? context.read<NegotiationOfferBloc>().add(
                CreateNegotiationOffer(
                  offerContent: negotiationOfferController.text,
                  propertyId: widget.propertyId,
                  payWay: paymentType,
                ),
              )
              : context.read<NegotiationOfferBloc>().add(
                EditNegotiationOffer(
                  offerContent: negotiationOfferController.text,
                  negotiationId: widget.negotiationId.toString(),
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
              widget.agredNegotiationState == 'معلق' ? 'Send' : 'Edit',
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
    );
  }
}

class NegotiationInputField extends StatefulWidget {
  final TextEditingController controller;

  const NegotiationInputField({super.key, required this.controller});

  @override
  State<NegotiationInputField> createState() => _NegotiationInputFieldState();
}

class _NegotiationInputFieldState extends State<NegotiationInputField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) {
            final dialogController = TextEditingController(
              text: widget.controller.text,
            );

            return AlertDialog(
              title: const Text('Enter Negotiation Offer'),
              content: SizedBox(
                height: 200,
                child: TextField(
                  controller: dialogController,
                  autofocus: true,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: 'Type your offer here...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, dialogController.text);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );

        if (result != null) {
          setState(() {
            widget.controller.text = result;
          });
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.controller.text.isEmpty
              ? "Tap to enter negotiation offer"
              : widget.controller.text,
          style: TextStyle(
            fontSize: 14,
            color: widget.controller.text.isEmpty ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
  }
}
