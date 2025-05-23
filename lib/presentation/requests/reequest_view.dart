import 'package:economic_team_desktop/buisness_logic/cubit/negotiation_data_cubit_cubit.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/request_item.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/request_shimmer.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: HomeHeader(title: 'Requests'),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        BlocBuilder<PropertyRequestsBloc, PropertyRequestsState>(
          builder: (context, state) {
            final requestsState = context.watch<PropertyRequestsBloc>().state;
            if (requestsState is PropertyRequestsLoading ||
                requestsState is PropertyRequestsInitial) {
              return Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(25.0.sp),
                      child: RequestsShimmerItem(),
                    );
                  },
                ),
              );
            }
            if (requestsState is PropertyRequestsSuccess &&
                requestsState.getRequestsFromLawyerResponse.data!.isEmpty) {
              SomethingWrongWidget(
                title: "No Questions found !",
                svgPath: 'assets/images/search.svg',
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed: () {
                    context.read<PropertyRequestsBloc>().add(
                      GetPropertiesRequestEvent(),
                    );
                  },
                ),
              );
            }
            if (requestsState is PropertyRequestsSuccess) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.all(25.0.sp),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<PropertyRequestsBloc>().add(
                        GetPropertiesRequestEvent(),
                      );
                    },
                    child: ListView.builder(
                      itemCount:
                          requestsState
                              .getRequestsFromLawyerResponse
                              .data!
                              .length!,
                      itemBuilder: (context, index) {
                        final propertyItem =
                            requestsState
                                .getRequestsFromLawyerResponse
                                .data![index];
                        return Padding(
                          padding: EdgeInsets.only(top: 12.0.h, bottom: 12.0.w),
                          child: RequestsItem(item: propertyItem),
                        );
                      },
                    ),
                  ),
                ),
              );
            }

            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<PropertyRequestsBloc>().add(
                    GetPropertiesRequestEvent(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
