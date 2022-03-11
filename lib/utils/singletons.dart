part of list_redesign_utils;

class Singletons {
  static final _shoeApiService = ShoeApiServiceImpl();

  static List<BlocProvider> registerCubits() => [
    BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit(
        shoeApiService: _shoeApiService,
      ),
    ),
  ];
}