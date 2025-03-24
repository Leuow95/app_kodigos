class Order {
  final int? id;
  final String? description;
  final List<String>? checklist;
  final String? photoData;

  Order({
    required this.id,
    required this.description,
    required this.checklist,
    required this.photoData,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      description: json['description'],
      checklist: List<String>.from(json['checklist']),
      photoData: json['photoData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'checklist': checklist,
      'photoData': photoData,
    };
  }
}
