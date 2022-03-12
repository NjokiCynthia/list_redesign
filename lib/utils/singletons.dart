part of list_redesign_utils;

class Singletons {
  static final _shoeApiService = ShoeApiServiceImpl();

  static List<BlocProvider> registerCubits() => [
    BlocProvider<PostShoeCubit>(
      create: (context) => PostShoeCubit(
        shoeApiService: _shoeApiService,
      ),
    ),
    BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit(
        shoeApiService: _shoeApiService,
      ),
    ),
  ];
}