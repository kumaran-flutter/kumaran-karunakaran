class ExperienceData {
  final String companyName;
  final String position;
  final String duration;
  final String description;
  final List<String> keyFeatures;
  final List<String> technologies;
  final String companyLogo;
  final bool isLeft;
  final String timeLineIcon;
  final bool showButton;
  final List<KeyProject>? keyProjects;
  final List<String>? photoPaths;
  final List<String>? importantLinks;

  ExperienceData({
    required this.companyName,
    required this.position,
    required this.duration,
    required this.description,
    required this.keyFeatures,
    required this.technologies,
    required this.companyLogo,
    required this.isLeft,
    required this.timeLineIcon,
    required this.showButton,
    this.keyProjects,
    this.photoPaths,
    this.importantLinks,
  });
}

class KeyProject {
  final String appName;
  final String imageUrl;
  final String? projectUrl;
  final List<String> descriptions;

  KeyProject({
    required this.appName,
    required this.imageUrl,
    this.projectUrl,
    required this.descriptions,
  });
}
