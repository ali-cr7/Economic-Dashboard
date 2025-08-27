import 'dart:convert';
import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/posted%20properties%20bloc/posted_properties_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20indicators/property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20property%20indicators%20bloc/send_property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/user%20sales%20requests%20bloc/user_sales_requests_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/models/ger_agreed_negotiaton_response/ger_agreed_negotiaton_response.dart';
import 'package:economic_team_desktop/data/models/get_indicator_response/get_indicator_response.dart';
import 'package:economic_team_desktop/data/models/get_requests_from_lawyer_response/get_requests_from_lawyer_response.dart';
import 'package:economic_team_desktop/data/models/posted_properties_response/posted_properties_response.dart';
import 'package:economic_team_desktop/data/models/request_details_response/request_details_response.dart';
import 'package:economic_team_desktop/data/models/user_sale_requests_response/user_sale_requests_response.dart';
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
    print("full requests response${helperResponse.fullBody}");
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
    print('the end point ${APIConfig.getRequestsDetails + event.requestId}');
    print(' the api response ${helperResponse.fullBody}');
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
  Future<HelperResponse> sendEconomicStudy(SendEconomicStudyEvent event) async {
    try {
      final formData = await event.createEconomicStudyState.toFormData();
      HelperResponse helperResponse = await _apiService.post(
        endpoint:
            event is SendEconomicStudyApiEvent
                ? APIConfig.createRequest
                : APIConfig.updateRequest + event.id!,
        data: formData,
        token: token,
      );
      print("servie state ${helperResponse.servicesResponse}");
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
      if (helperResponse.servicesResponse != ServicesResponseStatues.success) {
        print("checke state");
        try {
          final responseBody = helperResponse.fullBody;
          return responseBody?['errors[]'];
        } catch (e) {
          return helperResponse.copyWith(
            fullBody: helperResponse.fullBody,
            servicesResponse: ServicesResponseStatues.modelError,
          );
        }
      }
      return helperResponse;
    } catch (e) {
      print("checke state11");
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
    print(
      "negoEnd${APIConfig.getAgreedNegotiationforProperty + propertyId.toString()}",
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
      endpoint: APIConfig.updateNegotiationOffer + event.negotiationId,
      token: token,
    );
    print(
      "edit end point ${APIConfig.updateNegotiationOffer + event.negotiationId}",
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
  Future getPropertyIndicator(GetPropertyIndicatorsEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getIndicators,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetIndicatorResponse getIndicatorResponse = GetIndicatorResponse.from(
          helperResponse.fullBody!,
        );
        return getIndicatorResponse;
      } catch (e) {
        print('eroor no acceptance');
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future sendPrpertyIndicators(SendPropertyApiIndicatorsEvent event) async {
    final formData = await event.createPropertyIndicatorsState.toFormData(
      int.tryParse(event.id)!,
    );
    try {
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.storeValueToIndicator,
        data: formData,
        token: token,
      );
      print("sending request ${formData.fields}");
      print('sending response  ${helperResponse.fullBody}');
      print(APIConfig.storeValueToIndicator + event.id);
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
  Future geUsertPropertiesRequets(GetUserPropertiesRequestEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getUserSalesRequest + event.userID,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        UserSaleRequestsResponse userSalesRequestsSuccess =
            UserSaleRequestsResponse.from(helperResponse.fullBody!);
        return userSalesRequestsSuccess;
      } catch (e) {
        print('eroor no acceptance');
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future getPostedProperties(GetPostedPropertiesEvent event, int page) async {
    final HelperResponse helperResponse = await _apiService.get(
      endpoint: "${APIConfig.getPostedProperties}?page=$page",
      token: token,
    );
    print(" the end point is  ${APIConfig.getPostedProperties}?page=$page");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final body = helperResponse.fullBody;
        print('posted properties body type: ${body.runtimeType}');
        print(
          'parsed count: ${(PostedPropertiesResponse.from(Map<String, dynamic>.from(helperResponse.fullBody!)).data?.properties?.length ?? 0)}',
        );
        if (body is Map) {
          final map = Map<String, dynamic>.from(body as Map);
          return PostedPropertiesResponse.fromApi(map);
        }
        if (body is String) {
          try {
            final decoded = jsonDecode(body.toString()) as Map<String, dynamic>;
            return PostedPropertiesResponse.fromApi(decoded);
          } catch (_) {
            // If body is already a JSON string matching fromJson expectations
            return PostedPropertiesResponse.fromJson(body.toString());
          }
        }
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}
