part of list_redesign_models;

@freezed
class ListItemDTO with _$ListItemDTO {
  factory ListItemDTO({
    required String name,
    required String slug,
  }) = _ListItemDTO;

  factory ListItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ListItemDTOFromJson(json);
}

@freezed
class ListItemResult with _$ListItemResult {
  factory ListItemResult(
      List<ListItem> data,
      ) = _ListItemResult;

  factory ListItemResult.fromJson(Map<String, dynamic> json) =>
      _$ListItemResultFromJson(json);
}

@freezed
class ListItem with _$ListItem {
  factory ListItem(
      String uuid,
      String name,
      String slug,
      ) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);
}