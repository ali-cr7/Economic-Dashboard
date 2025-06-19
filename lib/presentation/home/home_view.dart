import 'package:economic_team_desktop/buisness_logic/currency%20bloc/currency_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/requests%20statistcs%20bloc/requstes_statistics_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/statistics%20chart%20bloc/staitstics_chart_bloc.dart';
import 'package:economic_team_desktop/enums.dart';

import 'package:economic_team_desktop/presentation/home/widgets/chart_container.dart';
import 'package:economic_team_desktop/presentation/home/widgets/chart_shimmer.dart';
import 'package:economic_team_desktop/presentation/home/widgets/currency_item.dart';
import 'package:economic_team_desktop/presentation/home/widgets/currency_item_shimmer.dart';

import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_progress_row.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late int selectedYear;
  late List<int> years;
  @override
  void initState() {
    super.initState();
    final currentYear = DateTime.now().year;
    years = List.generate(5, (index) => currentYear - index); // Last 5 years
    selectedYear = currentYear;

    _loadDataForYear(selectedYear);
  }

  void _loadDataForYear(int year) {
    context.read<StaitsticsChartBloc>().add(
      GetStaitsticsChartEvent(year: year),
    );
    context.read<RequstesStatisticsBloc>().add(
      GetRequstesStatisticsEvent(year: year),
    );
    context.read<CurrencyBloc>().add(GetCurrencyEvent());
  }

  @override
  Widget build(BuildContext context) {
    final List<String> currencyList = [
      'USD',
      'EUR',
      'GBP',
      'AED',
      'SAR',
      'JPY',
      "SYP",
    ];

    return BlocListener<StaitsticsChartBloc, StaitsticsChartState>(
      listener: (context, state) {
        if (state is StaitsticsChartFailure &&
            state.helperResponse.servicesResponse ==
                ServicesResponseStatues.unauthorized) {
          print(" stateServicesResponseStatues.unauthorized hiiiiiiiiiiiiiii");
          GoRouter.of(context).push(AppRouter.kLogin);
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _loadDataForYear(selectedYear);
          context.read<CurrencyBloc>().add(GetCurrencyEvent());
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              child: Column(
                // spacing: 2.h,
                children: [
                  HomeHeader(title: 'Home'),
                  CustomDivider(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: DropdownButton<int>(
                        value: selectedYear,
                        dropdownColor: AppColors.background,
                        iconEnabledColor: AppColors.lightBlue,
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: 16.sp,
                        ),
                        items:
                            years.map((year) {
                              return DropdownMenuItem(
                                value: year,
                                child: Text(
                                  '$year',
                                  style: const TextStyle(
                                    color: AppColors.purple,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => selectedYear = value);
                            _loadDataForYear(value);
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    spacing: 40.w,
                    children: [
                      Expanded(
                        child: BlocBuilder<
                          StaitsticsChartBloc,
                          StaitsticsChartState
                        >(
                          builder: (context, state) {
                            if (state is StaitsticsChartSuccess) {
                              return MyChartContainer(
                                items: state.staisticsChartResponse,
                              );
                            }
                            return ChartShimmer();
                          },
                        ),
                      ),
                      Container(
                        width: 288.w,
                        height: 550.83.h,
                        decoration: ShapeDecoration(
                          gradient: RadialGradient(
                            center: Alignment(0.00, 1.00),
                            radius: 1.41,
                            colors: [
                              const Color(0x7F9A8AEC),
                              const Color(0xFF574E86),
                            ],
                          ).withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              color: const Color(0xFF826AFC),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: BlocBuilder<CurrencyBloc, CurrencyState>(
                            builder: (context, state) {
                              if (state is CurrencyLoading) {
                                return ListView.builder(
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return CurrencyItemShimmer();
                                  },
                                );
                              } else if (state is CurrencySuccess) {
                                final rates = state.currencyResponse.rates;

                                final selectedRates =
                                    currencyList
                                        .map(
                                          (code) =>
                                              MapEntry(code, rates?[code]),
                                        )
                                        .where((entry) => entry.value != null)
                                        .toList();

                                return Column(
                                  spacing: 20.h,
                                  children:
                                      selectedRates.map((entry) {
                                        return CurrencyItem(
                                          currencyName: entry.key,
                                          currencyValue: entry.value.toString(),
                                        );
                                      }).toList(),
                                );
                              } else if (state is CurrencyFailure) {
                                return Column(
                                  children: [
                                    Text(
                                      'Failed to load currency',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Try Again",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<CurrencyBloc>().add(
                                          GetCurrencyEvent(),
                                        );
                                      },
                                      icon: Icon(
                                        CupertinoIcons.arrow_2_squarepath,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  SizedBox(width: double.infinity, child: HomeProgressRow()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
