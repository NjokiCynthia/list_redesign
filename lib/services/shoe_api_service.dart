part of list_redesign_services;

abstract class ShoeApiService {
  Future<List<ListItem>> getItems();
  Future<List<ListItem>> addItem({
    required ListItemDTO shoeItemDTO,
  });
}

class ShoeApiServiceImpl implements ShoeApiService {
  final _baseUrl = ListConfig.instance!.values.baseDomain;

  @override
  Future<List<ListItem>> getItems() async {
    final _shoeApiUrl = '$_baseUrl/b/3GQR';
    try {
      final _resp = await _networkUtil.getReq(_shoeApiUrl);

      return ListItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ListItem>> addItem({required ListItemDTO shoeItemDTO}) async {
    final _shoeApiUrl = '$_baseUrl/b/3GQR';
    try {
      final _resp = await _networkUtil.postReq(
        _shoeApiUrl,
        body: shoeItemDTO.toString(),
      );

      return ListItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }
}