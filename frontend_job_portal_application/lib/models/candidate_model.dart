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
        jobRole: json["job_role"],
        profileImageURL: json["profile_image_url"],
        resumeURL: json["resume_url"],
      );

  Map<String, String> toJson() => {
        "name": name,
        "email": email,
        "contact": contact,
        "education": education,
        "job_role": jobRole,
        "profile_image_url": profileImageURL,
        "resume_url": resumeURL,
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
