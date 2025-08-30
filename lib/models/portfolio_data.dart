class PortfolioData {
  final Personal personal;
  final Contact contact;
  final List<SocialLink> socialLinks;
  final List<NavigationItem> navigation;
  final Stats stats;
  final List<Skill> skills;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;
  final List<Community> communities;
  final List<Certification> certifications;
  final Footer footer;

  PortfolioData({
    required this.personal,
    required this.contact,
    required this.socialLinks,
    required this.navigation,
    required this.stats,
    required this.skills,
    required this.experiences,
    required this.projects,
    required this.education,
    required this.communities,
    required this.certifications,
    required this.footer,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      personal: Personal.fromJson(json['personal']),
      contact: Contact.fromJson(json['contact']),
      socialLinks: (json['socialLinks'] as List)
          .map((item) => SocialLink.fromJson(item))
          .toList(),
      navigation: (json['navigation'] as List)
          .map((item) => NavigationItem.fromJson(item))
          .toList(),
      stats: Stats.fromJson(json['stats']),
      skills: (json['skills'] as List)
          .map((item) => Skill.fromJson(item))
          .toList(),
      experiences: (json['experiences'] as List)
          .map((item) => Experience.fromJson(item))
          .toList(),
      projects: (json['projects'] as List)
          .map((item) => Project.fromJson(item))
          .toList(),
      education: (json['education'] as List)
          .map((item) => Education.fromJson(item))
          .toList(),
      communities: (json['communities'] as List)
          .map((item) => Community.fromJson(item))
          .toList(),
      certifications: (json['certifications'] as List)
          .map((item) => Certification.fromJson(item))
          .toList(),
      footer: Footer.fromJson(json['footer']),
    );
  }
}

class Personal {
  final String name;
  final String firstName;
  final String lastName;
  final String title;
  final String subtitle;
  final String bio;
  final String aboutMe;
  final String location;
  final String phone;
  final String email;
  final String profileImage;
  final String resumeUrl;
  final bool isOpenToWork;

  Personal({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.subtitle,
    required this.bio,
    required this.aboutMe,
    required this.location,
    required this.phone,
    required this.email,
    required this.profileImage,
    required this.resumeUrl,
    required this.isOpenToWork,
  });

  factory Personal.fromJson(Map<String, dynamic> json) {
    return Personal(
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      title: json['title'],
      subtitle: json['subtitle'],
      bio: json['bio'],
      aboutMe: json['aboutMe'],
      location: json['location'],
      phone: json['phone'],
      email: json['email'],
      profileImage: json['profileImage'],
      resumeUrl: json['resumeUrl'],
      isOpenToWork: json['isOpenToWork'],
    );
  }
}

class Contact {
  final String email;
  final String phone;
  final String location;

  Contact({required this.email, required this.phone, required this.location});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
    );
  }
}

class SocialLink {
  final String platform;
  final String icon;
  final String url;

  SocialLink({required this.platform, required this.icon, required this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'],
      icon: json['icon'],
      url: json['url'],
    );
  }
}

class NavigationItem {
  final String label;
  final String key;
  final String icon;

  NavigationItem({required this.label, required this.key, required this.icon});

  factory NavigationItem.fromJson(Map<String, dynamic> json) {
    return NavigationItem(
      label: json['label'],
      key: json['key'],
      icon: json['icon'],
    );
  }
}

class Stats {
  final StatItem experience;
  final StatItem projects;
  final StatItem features;

  Stats({
    required this.experience,
    required this.projects,
    required this.features,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      experience: StatItem.fromJson(json['experience']),
      projects: StatItem.fromJson(json['projects']),
      features: StatItem.fromJson(json['features']),
    );
  }
}

class StatItem {
  final int value;
  final String label;
  final String suffix;

  StatItem({required this.value, required this.label, required this.suffix});

  factory StatItem.fromJson(Map<String, dynamic> json) {
    return StatItem(
      value: json['value'],
      label: json['label'],
      suffix: json['suffix'],
    );
  }
}

class Skill {
  final String name;
  final String icon;
  final String category;
  final String level;

  Skill({
    required this.name,
    required this.icon,
    required this.category,
    required this.level,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'],
      icon: json['icon'],
      category: json['category'],
      level: json['level'],
    );
  }
}

class Experience {
  final int id;
  final String title;
  final String company;
  final String? companyLogo;
  final String startDate;
  final String? endDate;
  final String duration;
  final String location;
  final String type;
  final String description;
  final List<String> responsibilities;
  final List<String> technologies;
  final List<String> achievements;

  Experience({
    required this.id,
    required this.title,
    required this.company,
    this.companyLogo,
    required this.startDate,
    this.endDate,
    required this.duration,
    required this.location,
    required this.type,
    required this.description,
    required this.responsibilities,
    required this.technologies,
    required this.achievements,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      companyLogo: json['companyLogo'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      duration: json['duration'],
      location: json['location'],
      type: json['type'],
      description: json['description'],
      responsibilities: List<String>.from(json['responsibilities']),
      technologies: List<String>.from(json['technologies']),
      achievements: List<String>.from(json['achievements']),
    );
  }
}

class Project {
  final int id;
  final String title;
  final String description;
  final String image;
  final List<String> technologies;
  final List<String> features;
  final String status;
  final List<String> platforms;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
    required this.features,
    required this.status,
    required this.platforms,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      technologies: List<String>.from(json['technologies']),
      features: List<String>.from(json['features']),
      status: json['status'],
      platforms: List<String>.from(json['platforms']),
      githubUrl: json['githubUrl'],
      playStoreUrl: json['playStoreUrl'],
      appStoreUrl: json['appStoreUrl'],
    );
  }
}

class Education {
  final int id;
  final String degree;
  final String field;
  final String institution;
  final String? institutionLogo;
  final String startDate;
  final String endDate;
  final String grade;
  final String location;

  Education({
    required this.id,
    required this.degree,
    required this.field,
    required this.institution,
    this.institutionLogo,
    required this.startDate,
    required this.endDate,
    required this.grade,
    required this.location,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'],
      degree: json['degree'],
      field: json['field'],
      institution: json['institution'],
      institutionLogo: json['institutionLogo'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      grade: json['grade'],
      location: json['location'],
    );
  }
}

class Community {
  final String name;
  final String logo;
  final String role;
  final String description;
  final String url;

  Community({
    required this.name,
    required this.logo,
    required this.role,
    required this.description,
    required this.url,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      name: json['name'],
      logo: json['logo'],
      role: json['role'],
      description: json['description'],
      url: json['url'],
    );
  }
}

class Certification {
  final String name;
  final String issuer;
  final String date;
  final String? credentialUrl;

  Certification({
    required this.name,
    required this.issuer,
    required this.date,
    this.credentialUrl,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json['name'],
      issuer: json['issuer'],
      date: json['date'],
      credentialUrl: json['credentialUrl'],
    );
  }
}

class Footer {
  final String copyright;
  final String builtWith;

  Footer({required this.copyright, required this.builtWith});

  factory Footer.fromJson(Map<String, dynamic> json) {
    return Footer(copyright: json['copyright'], builtWith: json['builtWith']);
  }
}
