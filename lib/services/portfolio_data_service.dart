import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/portfolio_data.dart';

class PortfolioDataService {
  static PortfolioData? _cachedData;

  static Future<PortfolioData> loadPortfolioData() async {
    if (_cachedData != null) {
      return _cachedData!;
    }

    try {
      print('Attempting to load portfolio data...');
      final String jsonString = await rootBundle.loadString(
        'assets/data/portfolio_data.json',
      );
      print('JSON loaded successfully, length: ${jsonString.length}');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      print('JSON parsed successfully');
      _cachedData = PortfolioData.fromJson(jsonData);
      print('Portfolio data created successfully');
      return _cachedData!;
    } catch (e) {
      print('Error loading portfolio data: $e');
      // Return fallback data instead of throwing exception
      return _getFallbackData();
    }
  }

  static PortfolioData _getFallbackData() {
    print('Using fallback portfolio data');
    return PortfolioData(
      personal: Personal(
        name: "Kumaran K",
        firstName: "Kumaran",
        lastName: "Karunakaran",
        title: "Mobile Application Developer",
        subtitle: "Mobile application developer",
        bio:
            "Hey, I'm, welcome to my space. I craft high-performance, user-friendly mobile apps using Flutter and Firebase, blending clean architecture with real-world impact.",
        aboutMe:
            "Hi, I'm Kumaran Karunakaran — a Mobile App Developer who enjoys building real-world solutions with Flutter, Firebase, and a strong dose of clean code.",
        location: "Chennai, Tamil Nadu, India",
        phone: "+91 8300833451",
        email: "kumaransk1608@gmail.com",
        profileImage: "assets/logo.jpeg",
        resumeUrl:
            "https://drive.google.com/file/d/1PRQAnSMygnc5u-eC9Hu4kyeh5KbgZ9FY/view?usp=sharing",
        isOpenToWork: true,
      ),
      contact: Contact(
        email: "kumaransk1608@gmail.com",
        phone: "+91 8300833451",
        location: "Chennai, Tamil Nadu, India",
      ),
      socialLinks: [
        SocialLink(
          platform: "LinkedIn",
          icon: "assets/linkedin.svg",
          url: "https://www.linkedin.com/in/kumarankarunakaran/",
        ),
        SocialLink(
          platform: "Instagram",
          icon: "assets/instagram-svgrepo-com.svg",
          url: "https://www.instagram.com/kumaran_karunakaran_/",
        ),
        SocialLink(
          platform: "Email",
          icon: "assets/mail-send-svgrepo-com.svg",
          url: "mailto:kumaransk1608@gmail.com",
        ),
        SocialLink(
          platform: "Medium",
          icon: "assets/medium-svgrepo-com.svg",
          url: "https://medium.com/@skkumaran",
        ),
        SocialLink(
          platform: "GitHub",
          icon: "assets/social-github-svgrepo-com.svg",
          url: "https://github.com/kumaran-flutter",
        ),
      ],
      navigation: [
        NavigationItem(label: "Home", key: "home", icon: "home_outlined"),
        NavigationItem(
          label: "About",
          key: "about",
          icon: "person_outline_rounded",
        ),
        NavigationItem(label: "Skills", key: "skills", icon: "code_outlined"),
        NavigationItem(
          label: "Experience",
          key: "experience",
          icon: "timeline_outlined",
        ),
        NavigationItem(
          label: "Projects",
          key: "projects",
          icon: "work_outline_rounded",
        ),
      ],
      stats: Stats(
        experience: StatItem(value: 2, label: "Experience", suffix: "+"),
        projects: StatItem(value: 5, label: "Projects", suffix: "+"),
        features: StatItem(
          value: 50,
          label: "Feature's Developed",
          suffix: "+",
        ),
      ),
      skills: [],
      experiences: [],
      projects: [],
      education: [],
      communities: [],
      certifications: [],
      footer: Footer(
        copyright: "© 2025 Kumaran Karunakaran. All rights reserved.",
        builtWith: "Built with Flutter & Firebase",
      ),
    );
  }

  static void clearCache() {
    _cachedData = null;
  }
}
