part of 'staitstics_chart_bloc.dart';

@immutable
sealed class StaitsticsChartEvent {}

class GetStaitsticsChartEvent extends StaitsticsChartEvent {
  final int year;

  GetStaitsticsChartEvent({required this.year});
  @override
  List<Object?> get props => [];
}