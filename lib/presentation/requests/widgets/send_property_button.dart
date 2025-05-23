import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendPropertyButton extends StatelessWidget {
  const SendPropertyButton({
    super.key,
    required this.negotiationId,
    required this.propertyForSaleId,
    required this.requestFromLawyerId,
    required this.isUserAccepted,
    this.isCompleted, required this.requestId,
  });
  final bool isUserAccepted;
  final bool? isCompleted;
  final int negotiationId;
  final int propertyForSaleId;
  final int requestFromLawyerId;
  final int requestId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8.0),
      child: BlocBuilder<CreateEconomicStudyBloc, CreateEconomicStudyState>(
        builder: (context, state) {
          return CustomSendButton(
            buttonName: isCompleted == true ? 'Edit' : 'Send',
            // isEnabled: isUserAccepted,
            onTap: () {
              if (!isUserAccepted) {
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
              isCompleted == true
                  ? context.read<SendEconomicStudyBloc>().add(
                    EditEconomicStudyApiEvent(createEconomicStudyState: state,requestId.toString()),
                  )
                  : context.read<SendEconomicStudyBloc>().add(
                    SendEconomicStudyApiEvent(createEconomicStudyState: state),
                  );
            },
          );
        },
      ),
    );
  }
}
