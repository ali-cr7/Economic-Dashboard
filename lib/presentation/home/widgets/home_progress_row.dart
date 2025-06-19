import 'package:economic_team_desktop/buisness_logic/requests%20statistcs%20bloc/requstes_statistics_bloc.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_progress_item.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_progress_shimmer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeProgressRow extends StatelessWidget {
  const HomeProgressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<RequstesStatisticsBloc, RequstesStatisticsState>(
        builder: (context, state) {
          if (state is RequstesStatisticsLoading ||
              state is RequstesStatisticsInitial) {
            Row(
              spacing: 40.sp,
              children: [
                HomeProgressShimmer(),
                HomeProgressShimmer(),
                HomeProgressShimmer(),
              ],
            );
          }
          if (state is RequstesStatisticsSuccess) {
            return Row(
              spacing: 40.w,
              children: [
                HomeProgressItem(
                  color: const Color(0xFF826AFC),
                  title: 'Legally Rejected',
                  value:
                      state
                          .requestsStatisticsResponse
                          .rejectedByLawyerPercentage! /
                      100,
                  percent:
                      state
                          .requestsStatisticsResponse
                          .rejectedByLawyerPercentage
                          .toString(),
                ),
                HomeProgressItem(
                  color: const Color(0x9927B055),
                  title: 'Accepted admin',
                  value:
                      state
                          .requestsStatisticsResponse
                          .acceptedByAdminPercentage! /
                      100,
                  percent:
                      state.requestsStatisticsResponse.acceptedByAdminPercentage
                          .toString(),
                ),
                HomeProgressItem(
                  color: const Color(0xAADEEF80),
                  title: 'Rejected user',
                  value:
                      state
                          .requestsStatisticsResponse
                          .rejectedByUserPercentage! /
                      100,
                  percent:
                      state.requestsStatisticsResponse.rejectedByUserPercentage
                          .toString(),
                ),
              ],
            );
          }
          return Row(
            spacing: 20,
            children: [
              HomeProgressShimmer(),
              HomeProgressShimmer(),
              HomeProgressShimmer(),
            ],
          );
        },
      ),
    );
  }
}
