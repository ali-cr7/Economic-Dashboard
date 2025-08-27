part of 'user_sales_requests_bloc.dart';

@immutable
sealed class UserSalesRequestsState {}

final class UserSalesRequestsInitial extends UserSalesRequestsState {}

final class UserSalesRequestsLoading extends UserSalesRequestsState {}

final class UserSalesRequestsSuccess extends UserSalesRequestsState {
  final UserSaleRequestsResponse userSaleRequestsResponse;

  UserSalesRequestsSuccess({required this.userSaleRequestsResponse});
}

final class UserSalesRequestsFailure extends UserSalesRequestsState {
  final HelperResponse helperResponse;

  UserSalesRequestsFailure({required this.helperResponse});
}
