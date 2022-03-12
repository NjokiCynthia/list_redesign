import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_redesign/models/_index.dart';
import 'package:list_redesign/services/_index.dart';
import 'package:logger/logger.dart';

part 'post_shoe_state.dart';
part 'post_shoe_cubit.freezed.dart';

class PostShoeCubit extends Cubit<PostShoeState> {
  PostShoeCubit({required ShoeApiService shoeApiService})
      : super(const PostShoeState.initial()) {
    _shoeApiService = shoeApiService;
  }

  late ShoeApiService _shoeApiService;

  void loadFormPage() {
    emit(const PostShoeState.initial());
  }

  Future postShoes(ListItemDTO listItemDTO) async {
    emit(const PostShoeState.sending());
    try {
      final _result = await _shoeApiService.addItem(shoeItemDTO: listItemDTO);
      emit(PostShoeState.sent(_result));
    } on Failure catch (err) {
      emit(PostShoeState.error(err.message));
    } catch (e) {
      Logger().e(e);
      emit(
        const PostShoeState.error('An unexepected error occured'),
      );
    }
  }
}
