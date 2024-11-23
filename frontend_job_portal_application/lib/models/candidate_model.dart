class CandidateModel {
  CandidateModel({
    required this.name,
    required this.email,
    required this.contact,
    required this.education,
    required this.jobRole,
    this.profileImageURL = "",
    this.resumeURL = "",
  });

  final String name;
  final String email;
  final String contact;
  final String education;
  final String jobRole;
  final String profileImageURL;
  final String resumeURL;

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        education: json["education"],
        jobRole: json["jobRole"],
        profileImageURL: json["profileImageURL"],
        resumeURL: json["resumeURL"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contact": contact,
        "education": education,
        "jobRole": jobRole,
        "profileImageURL": profileImageURL,
        "resumeURL": resumeURL,
      };

  CandidateModel copyWith({
    String? name,
    String? email,
    String? contact,
    String? education,
    String? jobRole,
    String? profileImageURL,
    String? resumeURL,
  }) =>
      CandidateModel(
        name: name ?? this.name,
        email: email ?? this.email,
        contact: contact ?? this.contact,
        education: education ?? this.education,
        jobRole: jobRole ?? this.jobRole,
        profileImageURL: profileImageURL ?? this.profileImageURL,
        resumeURL: resumeURL ?? this.resumeURL,
      );
}
