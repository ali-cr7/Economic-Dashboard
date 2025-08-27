part of 'user_sales_requests_bloc.dart';

@immutable
sealed class UserSalesRequestsEvent {}

class GetUserPropertiesRequestEvent extends UserSalesRequestsEvent {
  final String userID;

  GetUserPropertiesRequestEvent({required this.userID});
  @override
  List<Object?> get props => [];
}
