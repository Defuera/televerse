part of 'models.dart';

/// This object represents one shipping option.
class ShippingOption {
  /// Shipping option identifier
  final String id;

  /// Option title
  final String title;

  /// List of price portions
  final List<LabeledPrice> prices;

  /// Constructs a [ShippingOption] object
  const ShippingOption({
    required this.id,
    required this.title,
    required this.prices,
  });

  /// Creates a [ShippingOption] object from JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'prices': prices.map((e) => e.toJson()).toList(),
    }..removeWhere(_nullFilter);
  }

  /// Converts a [ShippingOption] object to JSON object
  factory ShippingOption.fromJson(Map<String, dynamic> json) {
    return ShippingOption(
      id: json['id']!,
      title: json['title']!,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => LabeledPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
