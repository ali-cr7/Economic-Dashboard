import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/models/ger_agreed_negotiaton_response/ger_agreed_negotiaton_response.dart';
import 'package:economic_team_desktop/data/models/get_requests_from_lawyer_response/get_requests_from_lawyer_response.dart';
import 'package:economic_team_desktop/data/models/request_details_response/request_details_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requests_repo.dart';
import 'package:economic_team_desktop/enums.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';

class RequsetsRepoImpl implements RequestsRepo {
  final ApiService _apiService;

  RequsetsRepoImpl(this._apiService);
  @override
  getPropertiesRequets(GetPropertiesRequestEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getAllRequestFromLawyer,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetRequestsFromLawyerResponse getOfferedProprtiesResponse =
            GetRequestsFromLawyerResponse.from(helperResponse.fullBody!);
        return getOfferedProprtiesResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  getPropertiesRequetsDetails(GetPropertiesRequestDetailsEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getRequestsDetails + event.requestId,
      token: token,
    );
    print('hi');
    print(helperResponse.fullBody);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        RequestDetailsResponse requestDetailsResponse =
            RequestDetailsResponse.from(helperResponse.fullBody!);
        return requestDetailsResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future<HelperResponse> sendEconomicStudy(
    SendEconomicStudyEvent event,
  ) async {
    try {

      final formData = await event.createEconomicStudyState.toFormData();
      HelperResponse helperResponse = await _apiService.post(
        endpoint: event is SendEconomicStudyApiEvent?  APIConfig.createRequest : APIConfig.updateRequest + event.id!,
        data: formData,
        token: token,
      );
     
      print("sending request ${formData}");
      print('sending response  ${helperResponse.fullBody}');
      return helperResponse;
    } catch (e) {
      // Handle any unexpected errors during form data conversion
      return HelperResponse(
        fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
        response: 'Failed to prepare property data',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    }
  }

  @override
  Future createNegotiationOffer(CreateNegotiationOffer event) async {
    HelperResponse helperResponse = await _apiService.post(
      data: {
        'Text_of_the_agreement': event.offerContent,
        'Payment_Mechanism': event.payWay,
        'property_for_sale_id': event.propertyId,
      },
      endpoint: APIConfig.createNegotiationOffer,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future getNegottionOffer(int propertyId) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint:
          APIConfig.getAgreedNegotiationforProperty + propertyId.toString(),
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GerAgreedNegotiatonResponse gerAgreedNegotiatonResponse =
            GerAgreedNegotiatonResponse.from(helperResponse.fullBody!);
        return gerAgreedNegotiatonResponse;
      } catch (e) {
        print('eroor no acceptance');
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }
  
  @override
  Future editNegotiationOffer(EditNegotiationOffer event) async {
    HelperResponse helperResponse = await _apiService.post(
      data: {
        'Text_of_the_agreement': event.offerContent,
        'Payment_Mechanism': event.payWay,
       // 'property_for_sale_id': event.,
      },
      endpoint: APIConfig.updateNegotiationOffer+ event.negotiationId,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }
}
