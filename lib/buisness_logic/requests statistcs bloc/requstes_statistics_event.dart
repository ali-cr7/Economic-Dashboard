part of 'requstes_statistics_bloc.dart';

@immutable
sealed class RequstesStatisticsEvent {}

class GetRequstesStatisticsEvent extends RequstesStatisticsEvent {
  final int year;

  GetRequstesStatisticsEvent({required this.year});
  @override
  List<Object?> get props => [];
}
