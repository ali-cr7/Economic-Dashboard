import 'package:economic_team_desktop/presentation/home/widgets/home_progress_item.dart';
import 'package:flutter/widgets.dart';

class HomeProgressRow extends StatelessWidget {
  const HomeProgressRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        spacing: 20,
        children: [
          HomeProgressItem(
            color: const Color(0xFF826AFC),
            title: 'Investment',
            value: 0.5,
            percent: '50',
          ),
          HomeProgressItem(
            color: const Color(0x9927B055),
            title: 'Buying',
            value: 0.8,
            percent: '80',
          ),
          HomeProgressItem(
            color: const Color(0xAADEEF80),
            title: 'Waitting',
            value: 0.7,
            percent: '70',
          ),
        ],
      ),
    );
  }
}


