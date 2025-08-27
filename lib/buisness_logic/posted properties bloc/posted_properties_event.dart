part of 'posted_properties_bloc.dart';

@immutable
sealed class PostedPropertiesEvent {}

class GetPostedPropertiesEvent extends PostedPropertiesEvent {
  final bool refresh;
  GetPostedPropertiesEvent({this.refresh = false});
}
