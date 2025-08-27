part of 'posted_properties_bloc.dart';

@immutable
sealed class PostedPropertiesState {}

final class PostedPropertiesInitial extends PostedPropertiesState {}

class PostedPropertiesLoading extends PostedPropertiesState {}

class PostedPropertiesFailure extends PostedPropertiesState {
  final HelperResponse helperResponse;
  PostedPropertiesFailure({required this.helperResponse});
}

class PostedPropertiesSuccess extends PostedPropertiesState {
  final List<Property> properties;
  final bool hasReachedMax;
  final int page;
  final bool isLoadingMore;

  PostedPropertiesSuccess({
    required this.properties,
    required this.hasReachedMax,
    required this.page,
    this.isLoadingMore = false,
  });

  PostedPropertiesSuccess copyWith({
    List<Property>? properties,
    bool? hasReachedMax,
    int? page,
    bool? isLoadingMore,
  }) {
    return PostedPropertiesSuccess(
      properties: properties ?? this.properties,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
