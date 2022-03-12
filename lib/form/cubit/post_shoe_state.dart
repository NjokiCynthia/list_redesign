part of 'post_shoe_cubit.dart';

@freezed
class PostShoeState with _$PostShoeState {
  const factory PostShoeState.initial() = _Initial;
  const factory PostShoeState.sending() = _Sending;
  const factory PostShoeState.sent(List<ListItem> books) = _Sent;
  const factory PostShoeState.error(String message) = _Error;
}