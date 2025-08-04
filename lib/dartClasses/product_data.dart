class ProductInformation {
  final String? topBidValue;
  final String? numberOfParticipants;
  final String? numberOfBidding;

  ProductInformation({
    this.topBidValue,
    this.numberOfParticipants,
    this.numberOfBidding,
  });

  factory ProductInformation.fromJson(Map<String, dynamic> json) {
    return ProductInformation(
      topBidValue: json['topBidValue'],
      numberOfParticipants: json['numberOfParticipants'],
      numberOfBidding: json['numberOfBidding'],
    );
  }

  Map<String, dynamic> toJson() => {
        'topBidValue': topBidValue,
        'numberOfParticipants': numberOfParticipants,
        'numberOfBidding': numberOfBidding,
      };
}
