part of '../../televerse.dart';

/// Filename extension for [io.File] is used to get the filename of a file.
extension Filename on io.File {
  /// The filename of this file.
  String get filename => path.split('/').last;

  /// The extension of this file.
  String get extension => filename.split('.').last;

  /// The filename without the extension.
  String get filenameWithoutExtension => filename.split('.').first;
}

/// [String] extension, to clean the [String]
extension CleanString on String {
  /// Typesafe for args, replace all white space or multiple space in [String] into single space
  String get clean => trim().replaceAll(RegExp(r'\s{2,}|[\t\r\n]'), ' ');
}

/// Internal method to generate a random id.
/// Include a-z, A-Z, 0-9
String _getRandomID([
  int len = 20,
]) {
  final random = Random();
  final chars =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  return List.generate(len, (index) => chars[random.nextInt(chars.length)])
      .join();
}

/// Null filter function.
bool _nullFilter(String _, dynamic value) => value == null || value == 'null';

/// [Update] extension to get the [Chat] and [User] from the update.
extension FromAndChatExt on Update {
  /// A shorthand getter for the [Chat] instance from the update.
  ///
  /// This can be any of `msg.chat` or `myChatMember.chat` or `chatMember.chat` or `chatJoinRequest.chat` or `messageReaction.chat` or `messageReactionCount.chat` or `chatBoost.chat` or `removedChatBoost.chat` or `callbackQuery.message.chat`, or `businessMessage.chat` or `editedBusinessMessage.chat`.
  Chat? get chat {
    Chat? x = (chatJoinRequest ??
            removedChatBoost ??
            chatBoost ??
            chatMember ??
            myChatMember ??
            messageReaction ??
            messageReactionCount ??
            msg)
        ?.chat;

    if (callbackQuery?.message is Message) {
      x ??= (callbackQuery?.message as Message).chat;
    }

    return x;
  }

  /// A shorthand getter for the [User] instance from the update.
  User? get from {
    User? x = (callbackQuery ??
            inlineQuery ??
            shippingQuery ??
            preCheckoutQuery ??
            chosenInlineResult ??
            msg ??
            myChatMember ??
            chatMember ??
            chatJoinRequest)
        ?.from;
    if (callbackQuery?.message is Message) {
      x ??= (callbackQuery?.message as Message).from;
    }
    return x;
  }

  /// This is a shorthand getter for the [Message] recieved in the current context
  ///
  /// This can either be `Message` or `Channel Post` or `Edited Message` or `Edited Channel Post` or `Business Message` or `Edited Business Message` or `Callback Query Message`.
  Message? get msg {
    Message? m = message ??
        editedMessage ??
        channelPost ??
        editedChannelPost ??
        businessMessage ??
        editedBusinessMessage;
    if (callbackQuery?.message is Message) {
      m ??= (callbackQuery?.message as Message);
    }
    return m;
  }
}
