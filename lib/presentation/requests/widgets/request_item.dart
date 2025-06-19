import 'package:economic_team_desktop/buisness_logic/cubit/negotiation_data_cubit_cubit.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/data/models/get_requests_from_lawyer_response/datum.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/utility/app_colors%20copy.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RequestsItem extends StatelessWidget {
  const RequestsItem({super.key, required this.item, required this.isHistory});
  final RequestsModel item;
  final bool isHistory;
  @override
  Widget build(BuildContext context) {
    final int propertyId = item.propertyForSaleId!;
    final cubit = context.read<NegotiationDataCubitCubit>();

    // Initial fetch if needed
    if (cubit.getStatusForId(propertyId) == null) {
      cubit.getNegotiationOffer(propertyId);
    }

    return BlocBuilder<NegotiationDataCubitCubit, NegotiationDataCubitState>(
      buildWhen: (previous, current) {
        if (current is NegotiationDataCubitLoaded) {
          final previousStatus =
              previous is NegotiationDataCubitLoaded
                  ? previous.negotiationMap[propertyId]
                  : null;
          final currentStatus = current.negotiationMap[propertyId];
          return previousStatus != currentStatus;
        }
        return false;
      },
      builder: (context, state) {
        final status =
            state is NegotiationDataCubitLoaded
                ? state.negotiationMap[propertyId]
                : null;

        String statusText = 'Loading...';
        int negotiationId = 0;
        String negotiationText = '';
        String acceptedDate = '';

        if (status is NegotiationSuccess) {
          final data = status.response.data?.first;
          if (data != null) {
            negotiationId = data.id!;
            statusText = data.status ?? 'Unknown';
            negotiationText = data.textOfTheAgreement ?? '';
            acceptedDate = data.createdAt.toString() ?? '';
            print("statusText: $statusText");
          }
        } else if (status is NegotiationNotFound) {
          statusText = 'Error';
        } else if (status is NegotiationLoading) {
          statusText = 'Loading...';
        }

        return Container(
          width: 1150.w,
          height: 95.h,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 1.00),
              end: Alignment(1.00, -0.00),
              colors: [
                const Color(0xFFD5CFF5),
                const Color(0xB2A9A4C2),
                const Color(0xB2928EA8),
                const Color(0xB27C798F),
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2.w, color: const Color(0xFF836BFD)),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 12.0.w,
                    right: 12.0.w,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          item.byWhom != "admin"
                              ? Text(
                                'from: ${item.userName}   property: ${item.propertyInfo}  ',
                                style: TextStyle(
                                  color: Colors.black.withValues(alpha: 10),
                                  fontSize: 12.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              : Text(
                                'from: ${'admin'}   property: ${item.propertyInfo}  ',
                                style: TextStyle(
                                  color: Colors.black.withValues(alpha: 10),
                                  fontSize: 12.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          Expanded(
                            child: Row(
                              spacing: 10.w,
                              children: [
                                Container(
                                  width: 160.w,
                                  height: 34.h,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF27B055),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.w,
                                        color: const Color(
                                          0xFF27B055,
                                        ).withOpacity(0.47),
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Assets.images.balance.image(
                                        width: 18.w,
                                        height: 18.h,
                                      ),
                                      Text(
                                        'Legally Accepted ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${item.createdAt} ',
                                          style: TextStyle(
                                            color: const Color(0xFF1E1E1E),
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                if (item.acceptAdmin == 'مرفوض')
                                  Container(
                                    width: 120.w,
                                    height: 34.h,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xAFFB647B),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.w,
                                          color: const Color(0xFFEC2846),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Assets.images.up_down.image(
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                        Text(
                                          're-study ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '12-2-2025 ',
                                          style: TextStyle(
                                            color: const Color(0xFF1E1E1E),
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (status != null) ...[
                                  if (status is NegotiationLoading &&
                                      statusText == 'Loading...')
                                    Container(
                                      width: 180.w,
                                      height: 34.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.w,
                                            color: const Color(0xFF836BFD),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.sp,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 20.w,
                                            height: 20.h,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.w,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    const Color(0xFF836BFD),
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            'Loading...',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else if (status is NegotiationSuccess &&
                                      statusText ==
                                          'تم قبول الطلب من قبل المستخدم' &&
                                      item.byWhom != 'admin')
                                    NegotiationAccepted(
                                      propertyId: propertyId,
                                      acceptedDate: acceptedDate,
                                    )
                                  else if (status is NegotiationSuccess &&
                                      statusText == 'تم الرفض من قبل المستخدد')
                                    Container(
                                      key: ValueKey('accepted_$propertyId'),
                                      width: 200.w,
                                      height: 38.h,
                                      decoration: ShapeDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          86,
                                          97,
                                        ).withOpacity(0.67),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.w,
                                            color: const Color(0x77E5FF55),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.sp,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Assets.images.discussingCriticize
                                              .image(
                                                width: 20.w,
                                                height: 20.h,
                                                color: AppColors.redColor,
                                              ),
                                          Text(
                                            'negotiation rejected ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            formatJoinedDate(acceptedDate),

                                            style: TextStyle(
                                              color: const Color(0xFF1E1E1E),
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else if (status is NegotiationSuccess &&
                                      item.byWhom == 'admin')
                                    Container(
                                      key: ValueKey('accepted_$propertyId'),
                                      width: 200.w,
                                      height: 38.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent.withOpacity(
                                          0.2,
                                        ),
                                        border: Border.all(
                                          color: Colors.orangeAccent,
                                          width: 1.w,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10.sp,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.history,
                                            color: Colors.orange,
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 6.w),
                                          Expanded(
                                            child: Text(
                                              'Admin Re-study Request',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            formatJoinedDate(acceptedDate),
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else if (statusText == "Error")
                                    SizedBox.shrink(),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),

                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          context.read<PropertyRequestDetailsBloc>().add(
                            GetPropertiesRequestDetailsEvent(
                              requestId: item.requestFromLawyerId.toString(),
                            ),
                          );
                          GoRouter.of(context).push(
                            AppRouter.kRequestDetailsView,
                            extra: {
                              'propertyForSaleId':
                                  item.propertyForSaleId.toString(),
                              'byWhom': item.byWhom,
                              'requestId': item.requestFromLawyerId.toString(),
                              'acceptAdmin': item.acceptAdmin,
                              'agreedNegotiationStatus': statusText,
                              'agreedNegotiationId': negotiationId,
                              'agreedNegotiationText': negotiationText,
                            },
                          );
                        },
                        child: Container(
                          width: 79.w,
                          height: 33.h,
                          decoration: ShapeDecoration(
                            color: Colors.white.withValues(alpha: 201),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                color: const Color(0xFF836BFD),
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isHistory)
                Padding(
                  padding: EdgeInsets.only(bottom: 39.0.h),
                  child: Assets.images.linkChain.image(
                    // width: 65.w,
                    height: 120.h,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class NegotiationAccepted extends StatelessWidget {
  const NegotiationAccepted({
    super.key,
    required this.propertyId,
    required this.acceptedDate,
  });

  final int propertyId;
  final String acceptedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('accepted_$propertyId'),
      width: 200.w,
      height: 38.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFE6FF56).withOpacity(0.67),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0x77E5FF55)),
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
      child: Row(
        children: [
          Assets.images.discussingCriticize.image(width: 20.w, height: 20.h),
          Text(
            'negotiation Accepted ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            formatJoinedDate(acceptedDate),

            style: TextStyle(
              color: const Color(0xFF1E1E1E),
              fontSize: 10.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

String formatJoinedDate(String isoDate) {
  try {
    // Parse the ISO date string into a DateTime object
    DateTime date = DateTime.parse(isoDate);

    // Format the date as "d MMMM yyyy" (e.g., "14 April 2025")
    String formattedDate = DateFormat('d MMMM yyyy').format(date);

    return '$formattedDate';
  } catch (e) {
    // Fallback if parsing fails
    return 'joined in Unknown date';
  }
}
