import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/posted_properties_response/pagination.dart';
import 'package:economic_team_desktop/data/models/posted_properties_response/posted_properties_response.dart';
import 'package:economic_team_desktop/data/models/posted_properties_response/property.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'posted_properties_event.dart';
part 'posted_properties_state.dart';

class PostedPropertiesBloc
    extends Bloc<PostedPropertiesEvent, PostedPropertiesState> {
  final RequsetsRepoImpl requestsRepo;

  bool _isFetching = false;

  PostedPropertiesBloc(this.requestsRepo) : super(PostedPropertiesInitial()) {
    on<GetPostedPropertiesEvent>((event, emit) async {
      if (_isFetching) return;

      final currentState = state;

      if (event.refresh) {
        emit(PostedPropertiesLoading());
      } else if (currentState is PostedPropertiesSuccess) {
        if (currentState.hasReachedMax) {
          return;
        }
        emit(currentState.copyWith(isLoadingMore: true));
      } else {
        emit(PostedPropertiesLoading());
      }

      _isFetching = true;
      try {
        final int nextPage;
        if (event.refresh) {
          nextPage = 1;
        } else if (currentState is PostedPropertiesSuccess) {
          nextPage = currentState.page + 1;
        } else {
          nextPage = 1;
        }

        final response = await requestsRepo.getPostedProperties(
          event,
          nextPage,
        );
        print("theeee response $response");
        if (response is PostedPropertiesResponse) {
          final List<Property> newItems =
              response.data?.properties ?? <Property>[];
          final Pagination? pagination = response.data?.pagination;
          final bool reachedMaxByServer =
              pagination == null
                  ? (newItems.isEmpty)
                  : (pagination.currentPage != null &&
                          pagination.lastPage != null
                      ? (pagination.currentPage! >= pagination.lastPage!)
                      : newItems.isEmpty);

          if (event.refresh) {
            emit(
              PostedPropertiesSuccess(
                properties: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else if (currentState is PostedPropertiesSuccess) {
            emit(
              currentState.copyWith(
                properties: List.of(currentState.properties)..addAll(newItems),
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          } else {
            emit(
              PostedPropertiesSuccess(
                properties: newItems,
                hasReachedMax: reachedMaxByServer,
                page: pagination?.currentPage ?? nextPage,
                isLoadingMore: false,
              ),
            );
          }
        } else {
          emit(
            PostedPropertiesFailure(helperResponse: response as HelperResponse),
          );
        }
      } finally {
        _isFetching = false;
      }
    });
  }
}
