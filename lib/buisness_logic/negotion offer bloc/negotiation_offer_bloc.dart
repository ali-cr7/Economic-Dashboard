import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:economic_team_desktop/data/models/ger_agreed_negotiaton_response/ger_agreed_negotiaton_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'negotiation_offer_event.dart';
part 'negotiation_offer_state.dart';

class NegotiationOfferBloc
    extends Bloc<NegotiationOfferEvent, NegotiationOfferState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  NegotiationOfferBloc(this.requsetsRepoImpl)
    : super(NegotiationOfferInitial()) {
    on<CreateNegotiationOffer>((event, emit) async {
      emit(NegotiationOfferLoading());
      final response = await requsetsRepoImpl.createNegotiationOffer(event);
      if (response is String) {
        emit(NegotiationOfferSuccess(message: response));
      } else {
        emit(NegotiationOfferFailure(helperResponse: response));
      }
    });
     on<EditNegotiationOffer>((event, emit) async {
      emit(NegotiationOfferLoading());
      final response = await requsetsRepoImpl.editNegotiationOffer(event);
      if (response is String) {
        emit(NegotiationOfferSuccess(message: response));
      } else {
        emit(NegotiationOfferFailure(helperResponse: response));
      }
    });

    //     on<GetNegotiationOffer>((event, emit) async {
    //   emit(NegotiationOfferLoading());
    //   final response = await requsetsRepoImpl.getNegottionOffer(event);
    //   if (response is GerAgreedNegotiatonResponse) {
    //     emit(GetNegotiationOfferSuccess(gerAgreedNegotiatonResponse: response));
    //   } else {
    //     emit(NegotiationOfferFailure(helperResponse: response));
    //   }
    // });
  }
}
