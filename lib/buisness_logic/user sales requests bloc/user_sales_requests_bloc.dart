import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/user_sale_requests_response/user_sale_requests_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'user_sales_requests_event.dart';
part 'user_sales_requests_state.dart';

class UserSalesRequestsBloc
    extends Bloc<UserSalesRequestsEvent, UserSalesRequestsState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  UserSalesRequestsBloc(this.requsetsRepoImpl)
    : super(UserSalesRequestsInitial()) {
    on<GetUserPropertiesRequestEvent>((event, emit) async {
      emit(UserSalesRequestsLoading());
      final response = await requsetsRepoImpl.geUsertPropertiesRequets(event);
      if (response is UserSaleRequestsResponse) {
        emit(UserSalesRequestsSuccess(userSaleRequestsResponse: response));
      }
      else {
        emit(UserSalesRequestsFailure(helperResponse: response));
      }
    });
  }
}
