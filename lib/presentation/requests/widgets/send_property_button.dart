import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendPropertyButton extends StatelessWidget {
  const SendPropertyButton({
    super.key,
    required this.negotiationId,
    required this.propertyForSaleId,
    required this.requestFromLawyerId,
    required this.isUserAccepted,
    this.isCompleted,
    required this.requestId,
    required this.byWhom,
  });
  final bool isUserAccepted;
  final bool? isCompleted;
  final int negotiationId;
  final int propertyForSaleId;
  final int requestFromLawyerId;
  final int requestId;
  final String byWhom;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEconomicStudyBloc, CreateEconomicStudyState>(
      builder: (context, state) {
        return CustomSendButton(
          width: 100.w,
          height: 40.h,
          buttonName:
              isCompleted == false || byWhom == 'admin' ? 'Send' : 'Edit',
          // isEnabled: isUserAccepted,
          onTap: () {
            if (!isUserAccepted && state.negotiationMode == 'negotiation') {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('User Acceptance Required'),
                      content: Text(
                        'You cannot send this property until the user has accepted the negotiation.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
              );
              return;
            }
            isCompleted == false || byWhom == 'admin'
                ? context.read<SendEconomicStudyBloc>().add(
                  SendEconomicStudyApiEvent(createEconomicStudyState: state),
                )
                : context.read<SendEconomicStudyBloc>().add(
                  EditEconomicStudyApiEvent(
                    createEconomicStudyState: state,
                    requestId.toString(),
                  ),
                );
          },
        );
      },
    );
  }
}
