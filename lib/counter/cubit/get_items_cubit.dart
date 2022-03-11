import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:list_redesign/models/_index.dart';
import 'package:list_redesign/services/_index.dart';

part 'get_items_state.dart';
part 'get_items_cubit.freezed.dart';


class GetItemsCubit extends Cubit<GetItemsState> {
  GetItemsCubit({
    required ShoeApiService shoeApiService,
  }) : super(const GetItemsState.initial()) {
    _shoeApiService = shoeApiService;
  }

  late ShoeApiService _shoeApiService;

  Future getItems() async {
    emit(const GetItemsState.loading());
    try {
      final _result = await _shoeApiService.getItems();
      emit(GetItemsState.loaded(_result));
    } on Failure catch (err) {
      emit(GetItemsState.error(err.message));
    } catch (e) {
      Logger().e(e);
      emit(
        const GetItemsState.error('An unexepected error occured'),
      );
    }
  }
}