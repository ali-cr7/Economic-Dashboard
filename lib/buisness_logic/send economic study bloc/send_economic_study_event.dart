part of 'send_economic_study_bloc.dart';

@immutable
sealed class SendEconomicStudyEvent {
  final CreateEconomicStudyState createEconomicStudyState;
 final String? id;
  SendEconomicStudyEvent(this.id, {required this.createEconomicStudyState});
}

class SendEconomicStudyApiEvent extends SendEconomicStudyEvent {
  SendEconomicStudyApiEvent({required this.createEconomicStudyState , this.id})
    : super(createEconomicStudyState: createEconomicStudyState,id);
 final String? id;
  final CreateEconomicStudyState createEconomicStudyState;
  @override
  List<Object?> get props => [createEconomicStudyState];
}

class EditEconomicStudyApiEvent extends SendEconomicStudyEvent {
  EditEconomicStudyApiEvent(this.id, {required this.createEconomicStudyState})
    : super(createEconomicStudyState: createEconomicStudyState,id);
  @override
  final String id;
  final CreateEconomicStudyState createEconomicStudyState;
  @override
  List<Object?> get props => [createEconomicStudyState];
}
