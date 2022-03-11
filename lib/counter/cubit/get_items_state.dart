part of 'get_items_cubit.dart';

@freezed
class GetItemsState with _$GetItemsState {
  const factory GetItemsState.initial() = _Initial;
  const factory GetItemsState.loading() = _Loading;
  const factory GetItemsState.loaded(List<ListItem> items) = _Loaded;
  const factory GetItemsState.error(String message) = _Error;
}