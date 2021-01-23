import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums.dart';
import '../models/views.dart';
import '../query.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class GetCommunity
    implements _$GetCommunity, LemmyApiQuery<GetCommunityResponse> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory GetCommunity({
    int id,
    String name,
    String auth,
  }) = _GetCommunity;

  GetCommunity._();

  factory GetCommunity.fromJson(Map<String, dynamic> json) =>
      _$GetCommunityFromJson(json);

  @override
  String path() => '/community';

  @override
  HttpMethod httpMethod() => HttpMethod.get;

  @override
  GetCommunityResponse responseFactory(Map<String, dynamic> json) =>
      GetCommunityResponse.fromJson(json);
}

@freezed
abstract class GetCommunityResponse implements _$GetCommunityResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory GetCommunityResponse({
    @required CommunityView communityView,
    @required List<CommunityModeratorView> moderators,
    @required int online,
  }) = _GetCommunityResponse;

  GetCommunityResponse._();

  factory GetCommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommunityResponseFromJson(json);
}

@freezed
abstract class CreateCommunity
    implements _$CreateCommunity, LemmyApiQuery<CommunityView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory CreateCommunity({
    @required String name,
    @required String title,
    String description,
    String icon,
    String banner,
    @required int categoryId,
    @required bool nsfw,
    @required String auth,
  }) = _CreateCommunity;

  CreateCommunity._();

  factory CreateCommunity.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunityFromJson(json);

  @override
  String path() => '/community';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  CommunityView responseFactory(Map<String, dynamic> json) =>
      CommunityView.fromJson(json['community_view']);
}

@freezed
abstract class ListCommunities
    implements _$ListCommunities, LemmyApiQuery<List<CommunityView>> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory ListCommunities({
    @required SortType sort,
    int page,
    int limit,
    String auth,
  }) = _ListCommunities;

  ListCommunities._();

  factory ListCommunities.fromJson(Map<String, dynamic> json) =>
      _$ListCommunitiesFromJson(json);

  @override
  String path() => '/community/list';

  @override
  HttpMethod httpMethod() => HttpMethod.get;

  @override
  List<CommunityView> responseFactory(Map<String, dynamic> json) =>
      (json['communities'] as List)
          .map((e) => CommunityView.fromJson(e))
          .toList();
}

@freezed
abstract class BanFromCommunity
    implements _$BanFromCommunity, LemmyApiQuery<BanFromCommunityResponse> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory BanFromCommunity({
    @required int communityId,
    @required int userId,
    @required bool ban,
    @required bool removeData,
    String reason,
    int expires,
    @required String auth,
  }) = _BanFromCommunity;

  BanFromCommunity._();

  factory BanFromCommunity.fromJson(Map<String, dynamic> json) =>
      _$BanFromCommunityFromJson(json);

  @override
  String path() => '/community/ban_user';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  BanFromCommunityResponse responseFactory(Map<String, dynamic> json) =>
      BanFromCommunityResponse.fromJson(json);
}

@freezed
abstract class BanFromCommunityResponse implements _$BanFromCommunityResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory BanFromCommunityResponse({
    @required UserViewSafe userView,
    @required bool banned,
  }) = _BanFromCommunityResponse;

  BanFromCommunityResponse._();

  factory BanFromCommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$BanFromCommunityResponseFromJson(json);
}

@freezed
abstract class AddModToCommunity
    implements
        _$AddModToCommunity,
        LemmyApiQuery<List<CommunityModeratorView>> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory AddModToCommunity({
    @required int communityId,
    @required int userId,
    @required bool added,
    @required String auth,
  }) = _AddModToCommunity;

  AddModToCommunity._();

  factory AddModToCommunity.fromJson(Map<String, dynamic> json) =>
      _$AddModToCommunityFromJson(json);

  @override
  String path() => '/community/mod';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  List<CommunityModeratorView> responseFactory(Map<String, dynamic> json) =>
      (json['moderators'] as List)
          .map((e) => CommunityModeratorView.fromJson(e))
          .toList();
}

@freezed
abstract class EditCommunity
    implements _$EditCommunity, LemmyApiQuery<CommunityView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory EditCommunity({
    @required int communityId,
    @required String title,
    String description,
    String icon,
    String banner,
    @required int categoryId,
    @required bool nsfw,
    @required String auth,
  }) = _EditCommunity;

  EditCommunity._();

  factory EditCommunity.fromJson(Map<String, dynamic> json) =>
      _$EditCommunityFromJson(json);

  @override
  String path() => '/community';

  @override
  HttpMethod httpMethod() => HttpMethod.put;

  @override
  CommunityView responseFactory(Map<String, dynamic> json) =>
      CommunityView.fromJson(json['community_view']);
}

@freezed
abstract class DeleteCommunity
    implements _$DeleteCommunity, LemmyApiQuery<CommunityView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory DeleteCommunity({
    @required int communityId,
    @required bool deleted,
    @required String auth,
  }) = _DeleteCommunity;

  DeleteCommunity._();

  factory DeleteCommunity.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommunityFromJson(json);

  @override
  String path() => '/community/delete';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  CommunityView responseFactory(Map<String, dynamic> json) =>
      CommunityView.fromJson(json['community_view']);
}

@freezed
abstract class RemoveCommunity
    implements _$RemoveCommunity, LemmyApiQuery<CommunityView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory RemoveCommunity({
    @required int communityId,
    @required bool removed,
    String reason,
    int expires,
    @required String auth,
  }) = _RemoveCommunity;

  RemoveCommunity._();

  factory RemoveCommunity.fromJson(Map<String, dynamic> json) =>
      _$RemoveCommunityFromJson(json);

  @override
  String path() => '/community/remove';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  CommunityView responseFactory(Map<String, dynamic> json) =>
      CommunityView.fromJson(json['community_view']);
}

@freezed
abstract class FollowCommunity
    implements _$FollowCommunity, LemmyApiQuery<CommunityView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory FollowCommunity({
    @required int communityId,
    @required bool follow,
    @required String auth,
  }) = _FollowCommunity;

  FollowCommunity._();

  factory FollowCommunity.fromJson(Map<String, dynamic> json) =>
      _$FollowCommunityFromJson(json);

  @override
  String path() => '/community/follow';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  CommunityView responseFactory(Map<String, dynamic> json) =>
      CommunityView.fromJson(json['community_view']);
}

@freezed
abstract class GetFollowedCommunities
    implements
        _$GetFollowedCommunities,
        LemmyApiQuery<List<CommunityFollowerView>> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory GetFollowedCommunities({
    @required String auth,
  }) = _GetFollowedCommunities;

  GetFollowedCommunities._();

  factory GetFollowedCommunities.fromJson(Map<String, dynamic> json) =>
      _$GetFollowedCommunitiesFromJson(json);

  @override
  String path() => '/user/followed_communities';

  @override
  HttpMethod httpMethod() => HttpMethod.get;

  @override
  List<CommunityFollowerView> responseFactory(Map<String, dynamic> json) =>
      (json['communities'] as List)
          .map((e) => CommunityFollowerView.fromJson(e))
          .toList();
}

@freezed
abstract class TransferCommunity
    implements _$TransferCommunity, LemmyApiQuery<GetCommunityResponse> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory TransferCommunity({
    @required int communityId,
    @required int userId,
    @required String auth,
  }) = _TransferCommunity;

  TransferCommunity._();

  factory TransferCommunity.fromJson(Map<String, dynamic> json) =>
      _$TransferCommunityFromJson(json);

  @override
  String path() => '/community/transfer';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  GetCommunityResponse responseFactory(Map<String, dynamic> json) =>
      GetCommunityResponse.fromJson(json);
}
