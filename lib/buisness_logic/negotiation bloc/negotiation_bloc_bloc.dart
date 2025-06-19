import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/message.dart';
import 'package:meta/meta.dart';

part 'negotiation_bloc_event.dart';
part 'negotiation_bloc_state.dart';

class NegotiationBlocBloc extends Bloc<NegotiationBlocEvent, NegotiationBlocState> {
  NegotiationBlocBloc() : super(NegotiationBlocInitial()) {
    on<NegotiationBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
