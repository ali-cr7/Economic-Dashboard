import 'package:economic_team_desktop/buisness_logic/user%20sales%20requests%20bloc/user_sales_requests_bloc.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserSalesRequestsBloc, UserSalesRequestsState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    // Trigger the BLoC event to load user requests
                    context.read<UserSalesRequestsBloc>().add(
                      GetUserPropertiesRequestEvent(
                        userID: userId.replaceFirst('user_', ''),
                      ),
                    );

                    showDialog(
                      context: context,
                      builder: (_) {
                        return BlocBuilder<
                          UserSalesRequestsBloc,
                          UserSalesRequestsState
                        >(
                          builder: (context, state) {
                            if (state is UserSalesRequestsLoading) {
                              return const AlertDialog(
                                content: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state is UserSalesRequestsSuccess) {
                              final requests =
                                  state.userSaleRequestsResponse.data ?? [];

                              return AlertDialog(
                                title: const Text(
                                  'Requests',
                                  style: TextStyle(
                                    color: Color(0xFF836BFD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: SizedBox(
                                  width: double.maxFinite,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: requests.length,
                                    separatorBuilder:
                                        (_, __) => const Divider(thickness: 1),
                                    itemBuilder: (context, index) {
                                      final request = requests[index];
                                      return InkWell(
                                        onTap: () {
                                          GoRouter.of(context).push(
                                            AppRouter.kRequestDetailsView,
                                            extra: {
                                              'propertyForSaleId':
                                                  request.propertyForSaleId
                                                      .toString(),
                                              'byWhom': request.userName,
                                              'requestId':
                                                  request.requestId.toString(),
                                              'acceptAdmin':
                                                  request.acceptAdmin,
                                              'agreedNegotiationStatus':
                                                  request
                                                      .agreedNegotiation!
                                                      .status ??
                                                  " ",
                                              'agreedNegotiationId':
                                                  request
                                                      .agreedNegotiation!
                                                      .id ??
                                                  " ",
                                              'agreedNegotiationText':
                                                  request
                                                      .agreedNegotiation!
                                                      .textOfTheAgreement ??
                                                  " ",
                                            },
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _infoRow(
                                              Icons.person,
                                              "Name",
                                              request.userName ?? '',
                                            ),
                                            _infoRow(
                                              Icons.location_on,
                                              "Property",
                                              request.propertyInfo ?? '',
                                            ),
                                            _infoRow(
                                              Icons.check_circle,
                                              "Status",
                                              request.statusRequest ?? '',
                                            ),
                                            _infoRow(
                                              Icons.admin_panel_settings,
                                              "Admin",
                                              request.acceptAdmin ?? '',
                                            ),
                                            _infoRow(
                                              Icons.calendar_today,
                                              "Date",
                                              request.createdAt ?? '',
                                            ),
                                            _infoRow(
                                              Icons.handshake,
                                              "Negotiation",
                                              request
                                                      .agreedNegotiation
                                                      ?.status! ??
                                                  'N/A',
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                        color: Color(0xFF836BFD),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is UserSalesRequestsFailure) {
                              return const AlertDialog(
                                title: Text("Error"),
                                content: Text("Failed to load requests."),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    );
                  },

                  child: const Text(
                    'Show Request',
                    style: TextStyle(
                      color: Color(0xFF836BFD),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Container(
              width: 200.44.r,
              height: 200.44.r,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(width: 4.w, color: const Color(0xFF836BFD)),
                ),
              ),
              child: Assets.images.profilePhoto.image(fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blue),
          const SizedBox(width: 6),
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF836BFD)),
            ),
          ),
        ],
      ),
    );
  }
}
