part of 'models.dart';

/// Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
class InlineQueryResultCachedVideo extends InlineQueryResult {
  /// Type of the result, always [InlineQueryResultType.video]
  @override
  InlineQueryResultType get type => InlineQueryResultType.video;

  /// A valid file identifier for the video file
  final String videoFileId;

  /// Title for the result
  final String title;

  /// Optional. Short description of the result
  final String? description;

  /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
  final String? caption;

  /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
  final ParseMode? parseMode;

  /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
  final List<MessageEntity>? captionEntities;

  /// Optional. Inline keyboard attached to the message
  final InlineKeyboardMarkup? replyMarkup;

  /// Optional. Content of the message to be sent instead of the video
  final InputMessageContent? inputMessageContent;

  /// Constructs an [InlineQueryResultCachedVideo] object
  InlineQueryResultCachedVideo({
    required this.videoFileId,
    required this.title,
    required super.id,
    this.description,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Converts an [InlineQueryResultCachedVideo] object to a JSON map
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.value,
      'video_file_id': videoFileId,
      'title': title,
      'description': description,
      'caption': caption,
      'parse_mode': parseMode?.value,
      'caption_entities': captionEntities?.map((e) => e.toJson()).toList(),
      'reply_markup': replyMarkup?.toJson(),
      'input_message_content': inputMessageContent?.toJson(),
      'id': id,
    }..removeWhere(_nullFilter);
  }

  /// Constructs an [InlineQueryResultCachedVideo] object from a JSON map
  factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) {
    return InlineQueryResultCachedVideo(
      videoFileId: json['video_file_id'] as String,
      title: json['title'] as String,
      id: json['id'] as String,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] == null
          ? null
          : ParseMode.fromJson(json['parse_mode'] as String),
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>,
            ),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>,
            ),
    );
  }
}
