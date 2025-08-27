import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';

import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20indicators/property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart'
    show GetPropertiesRequestDetailsEvent;
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20property%20indicators%20bloc/send_property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/user%20sales%20requests%20bloc/user_sales_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/posted%20properties%20bloc/posted_properties_bloc.dart';

abstract class RequestsRepo {
  getPropertiesRequets(GetPropertiesRequestEvent event);
  getPropertiesRequetsDetails(GetPropertiesRequestDetailsEvent event);
  Future sendEconomicStudy(SendEconomicStudyApiEvent event);
  Future createNegotiationOffer(CreateNegotiationOffer event);
  Future editNegotiationOffer(EditNegotiationOffer event);
  Future getNegottionOffer(int propertyId);
  Future getPropertyIndicator(GetPropertyIndicatorsEvent event);
  Future sendPrpertyIndicators(SendPropertyApiIndicatorsEvent event);
  Future geUsertPropertiesRequets(GetUserPropertiesRequestEvent event);
  Future getPostedProperties(GetPostedPropertiesEvent event, int page);
}
