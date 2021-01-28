import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums.dart';
import '../models/api.dart';
import '../models/views.dart';
import '../query.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class GetPost implements _$GetPost, LemmyApiQuery<FullPostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory GetPost({
    @required int id,
    String auth,
  }) = _GetPost;

  GetPost._();
  factory GetPost.fromJson(Map<String, dynamic> json) =>
      _$GetPostFromJson(json);

  @override
  String path() => '/post';

  @override
  HttpMethod httpMethod() => HttpMethod.get;

  @override
  FullPostView responseFactory(Map<String, dynamic> json) =>
      FullPostView.fromJson(json);
}

@freezed
abstract class CreatePost implements _$CreatePost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory CreatePost({
    @required String name,
    String url,
    String body,
    @required bool nsfw,
    @required int communityId,
    @required String auth,
  }) = _CreatePost;

  CreatePost._();
  factory CreatePost.fromJson(Map<String, dynamic> json) =>
      _$CreatePostFromJson(json);

  @override
  String path() => '/post';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class GetPosts implements _$GetPosts, LemmyApiQuery<List<PostView>> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory GetPosts({
    @required @JsonKey(name: 'type_') PostListingType type,
    @required SortType sort,
    int page,
    int limit,
    int communityId,
    String communityName,
    String auth,
  }) = _GetPosts;

  GetPosts._();
  factory GetPosts.fromJson(Map<String, dynamic> json) =>
      _$GetPostsFromJson(json);

  @override
  String path() => '/post/list';

  @override
  HttpMethod httpMethod() => HttpMethod.get;

  @override
  List<PostView> responseFactory(Map<String, dynamic> json) =>
      (json['posts'] as List).map((e) => PostView.fromJson(e)).toList();
}

@freezed
abstract class CreatePostLike
    implements _$CreatePostLike, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory CreatePostLike({
    @required int postId,
    @required VoteType score,
    @required String auth,
  }) = _CreatePostLike;

  CreatePostLike._();
  factory CreatePostLike.fromJson(Map<String, dynamic> json) =>
      _$CreatePostLikeFromJson(json);

  @override
  String path() => '/post/like';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class EditPost implements _$EditPost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory EditPost({
    @required int postId,
    @required String name,
    String url,
    String body,
    @required bool nsfw,
    @required String auth,
  }) = _EditPost;

  EditPost._();
  factory EditPost.fromJson(Map<String, dynamic> json) =>
      _$EditPostFromJson(json);

  @override
  String path() => '/post';

  @override
  HttpMethod httpMethod() => HttpMethod.put;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class DeletePost implements _$DeletePost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory DeletePost({
    @required int postId,
    @required bool deleted,
    @required String auth,
  }) = _DeletePost;

  DeletePost._();
  factory DeletePost.fromJson(Map<String, dynamic> json) =>
      _$DeletePostFromJson(json);

  @override
  String path() => '/post/delete';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class RemovePost implements _$RemovePost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory RemovePost({
    @required int postId,
    @required bool removed,
    String reason,
    @required String auth,
  }) = _RemovePost;

  RemovePost._();
  factory RemovePost.fromJson(Map<String, dynamic> json) =>
      _$RemovePostFromJson(json);

  @override
  String path() => '/post/remove';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class LockPost implements _$LockPost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory LockPost({
    @required int postId,
    @required bool locked,
    @required String auth,
  }) = _LockPost;

  LockPost._();
  factory LockPost.fromJson(Map<String, dynamic> json) =>
      _$LockPostFromJson(json);

  @override
  String path() => '/post/lock';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class StickyPost implements _$StickyPost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory StickyPost({
    @required int postId,
    @required bool stickied,
    @required String auth,
  }) = _StickyPost;

  StickyPost._();
  factory StickyPost.fromJson(Map<String, dynamic> json) =>
      _$StickyPostFromJson(json);

  @override
  String path() => '/post/sticky';

  @override
  HttpMethod httpMethod() => HttpMethod.post;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

@freezed
abstract class SavePost implements _$SavePost, LemmyApiQuery<PostView> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory SavePost({
    @required int postId,
    @required bool save,
    @required String auth,
  }) = _SavePost;

  SavePost._();
  factory SavePost.fromJson(Map<String, dynamic> json) =>
      _$SavePostFromJson(json);

  @override
  String path() => '/post/save';

  @override
  HttpMethod httpMethod() => HttpMethod.put;

  @override
  PostView responseFactory(Map<String, dynamic> json) =>
      PostView.fromJson(json['post_view']);
}

// TODO: this does not seem to exist yet
@freezed
abstract class CreatePostReport
    implements _$CreatePostReport, LemmyApiQuery<bool> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory CreatePostReport({
    @required int postId,
    @required String reason,
    @required String auth,
  }) = _CreatePostReport;

  CreatePostReport._();
  factory CreatePostReport.fromJson(Map<String, dynamic> json) =>
      _$CreatePostReportFromJson(json);

  @override
  String path() => null;

  @override
  HttpMethod httpMethod() => null;

  @override
  bool responseFactory(Map<String, dynamic> json) => json['success'] as bool;
}

// TODO: this does not seem to exist yet
@freezed
abstract class ResolvePostReport
    implements _$ResolvePostReport, LemmyApiQuery<ResolvePostReportResponse> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory ResolvePostReport({
    @required int reportId,
    @required bool resolved,
    @required String auth,
  }) = _ResolvePostReport;

  ResolvePostReport._();
  factory ResolvePostReport.fromJson(Map<String, dynamic> json) =>
      _$ResolvePostReportFromJson(json);

  @override
  String path() => null;

  @override
  HttpMethod httpMethod() => null;

  @override
  ResolvePostReportResponse responseFactory(Map<String, dynamic> json) =>
      ResolvePostReportResponse.fromJson(json);
}

// TODO: this does not seem to exist yet
@freezed
abstract class ListPostReports
    implements _$ListPostReports, LemmyApiQuery<List<PostReportView>> {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  factory ListPostReports({
    int page,
    int limit,
    int community,
    @required String auth,
  }) = _ListPostReports;

  ListPostReports._();
  factory ListPostReports.fromJson(Map<String, dynamic> json) =>
      _$ListPostReportsFromJson(json);

  @override
  String path() => null;

  @override
  HttpMethod httpMethod() => null;

  @override
  List<PostReportView> responseFactory(Map<String, dynamic> json) =>
      (json as List).map((e) => PostReportView.fromJson(json)).toList();
}