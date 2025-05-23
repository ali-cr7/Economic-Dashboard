import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';

import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart'
    show GetPropertiesRequestDetailsEvent;
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';

abstract class RequestsRepo {
  getPropertiesRequets(GetPropertiesRequestEvent event);
  getPropertiesRequetsDetails(GetPropertiesRequestDetailsEvent event);
  Future sendEconomicStudy(SendEconomicStudyApiEvent event);
  Future createNegotiationOffer(CreateNegotiationOffer event);
    Future editNegotiationOffer(EditNegotiationOffer event);
  Future getNegottionOffer(int propertyId );
}
