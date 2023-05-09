class registeredchefs {
  final String name;
  final String specialty;
  final String bio;
  final String imageUrl;

  registeredchefs({
    required this.name,
    required this.specialty,
    required this.bio,
    required this.imageUrl,
  });

  factory registeredchefs.fromJson(Map<String, dynamic> json) {
    return registeredchefs(
      name: json['name'],
      specialty: json['specialty'],
      bio: json['bio'],
      imageUrl: json['imageUrl'],
    );
  }

  get experience => null;

  get rating => null;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'bio': bio,
      'imageUrl': imageUrl,
    };
  }
}
