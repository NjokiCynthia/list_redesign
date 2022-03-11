import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_items_state.dart';

class GetItemsCubit extends Cubit<GetItemsState> {
  GetItemsCubit() : super(GetItemsInitial());
}
