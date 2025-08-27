import 'package:economic_team_desktop/buisness_logic/posted%20properties%20bloc/posted_properties_bloc.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PostedPropertiesView extends StatefulWidget {
  const PostedPropertiesView({super.key});

  @override
  State<PostedPropertiesView> createState() => _PostedPropertiesViewState();
}

class _PostedPropertiesViewState extends State<PostedPropertiesView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    final state = context.read<PostedPropertiesBloc>().state;
    if (current >= maxScroll - 200) {
      if (state is PostedPropertiesSuccess &&
          !state.hasReachedMax &&
          !state.isLoadingMore) {
        context.read<PostedPropertiesBloc>().add(GetPostedPropertiesEvent());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _gridCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1400) return 4;
    if (width >= 1100) return 3;
    if (width >= 800) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: const HomeHeader(title: 'Posted Properties'),
        ),
        SizedBox(height: 20.h),
        const CustomDivider(),
        Expanded(
          child: BlocBuilder<PostedPropertiesBloc, PostedPropertiesState>(
            builder: (context, state) {
              if (state is PostedPropertiesLoading ||
                  state is PostedPropertiesInitial) {
                return GridView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridCount(context),
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => const _ShimmerCard(),
                );
              }

              if (state is PostedPropertiesFailure) {
                return SomethingWrongWidget(
                  title: state.helperResponse.response,
                  elevatedButtonWidget: ElevatedButtonWidget(
                    title: 'Retry',
                    onPressed: () {
                      context.read<PostedPropertiesBloc>().add(
                        GetPostedPropertiesEvent(refresh: true),
                      );
                    },
                  ),
                );
              }

              if (state is PostedPropertiesSuccess) {
                if (state.properties.isEmpty) {
                  return SomethingWrongWidget(
                    title: 'No properties found!',
                    elevatedButtonWidget: ElevatedButtonWidget(
                      title: 'Refresh',
                      onPressed: () {
                        context.read<PostedPropertiesBloc>().add(
                          GetPostedPropertiesEvent(refresh: true),
                        );
                      },
                    ),
                  );
                }

                final hasLoader = !state.hasReachedMax && state.isLoadingMore;
                final itemCount = state.properties.length + (hasLoader ? 1 : 0);

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PostedPropertiesBloc>().add(
                      GetPostedPropertiesEvent(refresh: true),
                    );
                  },
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 16.h,
                        ),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            if (hasLoader && index == state.properties.length) {
                              return const _ShimmerCard();
                            }
                            final item = state.properties[index];
                            return _PostedPropertyCard(
                              title: item.propertyTitle ?? '-',
                              location: item.propertyLocation ?? '-',
                              progress:
                                  double.tryParse(
                                    item.progressPercent ?? '0',
                                  ) ??
                                  0,
                              totalChances:
                                  item.totalChances?.toString() ?? '-',
                              invested: item.totalInvested?.toString() ?? '-',
                              chancePrice: item.chancePrice ?? '-',
                            );
                          }, childCount: itemCount),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: _gridCount(context),
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 1.6,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: Colors.grey.shade700),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade800),
          ),
        ],
      ),
    );
  }
}

class _PostedPropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final double progress;
  final String totalChances;
  final String invested;
  final String chancePrice;

  const _PostedPropertyCard({
    required this.title,
    required this.location,
    required this.progress,
    required this.totalChances,
    required this.invested,
    required this.chancePrice,
  });

  @override
  Widget build(BuildContext context) {
    final num clampedProgress = (progress.isNaN ? 0 : progress).clamp(0, 100);
    final double progressFraction = clampedProgress / 100.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(
                            PhosphorIcons.mapPin(PhosphorIconsStyle.bold),
                            size: 16.sp,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.trendUp(PhosphorIconsStyle.bold),
                        size: 16.sp,
                        color: Colors.indigo,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '${clampedProgress.toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: progressFraction,
                minHeight: 8.h,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            ),
            SizedBox(height: 14.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                _StatChip(
                  icon: PhosphorIcons.coins(PhosphorIconsStyle.bold),
                  label: 'Price: $chancePrice',
                ),
                _StatChip(
                  icon: PhosphorIcons.wallet(PhosphorIconsStyle.bold),
                  label: 'Invested: $invested',
                ),
                _StatChip(
                  icon: PhosphorIcons.hash(PhosphorIconsStyle.bold),
                  label: 'Chances: $totalChances',
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                icon: Icon(
                  PhosphorIcons.arrowRight(PhosphorIconsStyle.bold),
                  size: 16.sp,
                ),
                label: Text(
                  'View details',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
