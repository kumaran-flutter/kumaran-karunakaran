import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';

import '../components/components.dart';
import '../models/models.dart';
import 'experience_detail_page.dart';

class TimelineExperienceSection extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;

  const TimelineExperienceSection({
    super.key,
    required this.isMobile,
    this.isTablet = false,
  });

  @override
  State<TimelineExperienceSection> createState() =>
      _TimelineExperienceSectionState();
}

class _TimelineExperienceSectionState extends State<TimelineExperienceSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  final List<ExperienceData> experiences = [
    ExperienceData(
      timeLineIcon: AppIcons.icons8Ios,
      companyName: "Avow Solutions Inc",
      position: "Mobile Application Developer",
      duration: "2023 - Present",
      description:
          "Led development of cross-platform mobile applications using Flutter, implemented clean architecture patterns.",
      keyFeatures: [
        "Built 3 production apps with 100K+ downloads",
        "Led code reviews and established best practices",
        "Architected and delivered CargoEZ, a logistics CRM mobile app, resulting in a 40% increase in operational efficiency across client operations",
        "Streamlined navigation by migrating to GoRouter and applying deep linking, improving user flow and reducing complexity by 35%",
        "Designed and deployed responsive UI layouts for both tablets and mobile using a unified codebase, reducing maintenance workload by 45%",
        "Created and integrated 30+ reusable widgets with external packages, cutting across multiple internal projects",
        "Collaborated with designers and users to refine UI/UX, contributing to a 20% drop in user abandonment on key screens",
        "Built and consumed RESTful APIs using the http package, improving backend responsiveness and lowering error rates by 25%",
        "Configured Firebase Cloud Messaging and deployed Firebase Functions to enable real-time notifications, reducing delivery lag by 40%",
        "Connected Firebase Crashlytics with Slack for both Android and iOS, enabling real-time crash alerts and reducing resolution time by 60%",
        "Led OAuth 2.0 implementation, ensuring secure sign-ins and full compliance with Google and Microsoft standards",
        "Worked cross-functionally in Agile sprints with design, QA, and backend teams to deliver new features on time",
        "Released production-ready apps to the Google Play Store and Apple App Store, ensuring full platform compliance",
        "Incorporated Pendo Analytics to help product teams monitor user behavior and iterate on features with real-time insights",
        "Developed a Gmail Add-on using Google Apps Script, enabling logistics teams to manage leads directly from their inboxes",
        "Engineered a Microsoft Outlook Add-in using HTML, CSS, and JavaScript via Microsoft Partner Center, expanding CRM functionality",
        "Applied unit and widget testing strategies to improve release stability and reduce post-deployment bugs by 70%",
      ],
      technologies: [
        "Flutter",
        "Dart",
        "Firebase",
        "REST APIs",
        "Provider",
        "GoRouter",
        "OAuth 2.0",
        "Pendo Analytics",
        "Google Apps Script",
        "Microsoft Partner Center",
        "Unit Testing",
        "Widget Testing",
        "Clean Architecture",
        "Responsive Design",
        "Agile Methodology",
        "Cross-Platform Development",
      ],
      companyLogo: AppIcons.avow,
      isLeft: true,
      showButton: true,
      keyProjects: [
        KeyProject(
          appName: "CargoEZ",
          imageUrl: "assets/image.png",
          projectUrl: "https://www.vikramuiux.com/works/wms",

          descriptions: [
            "A comprehensive personal finance management app",
            "Features budgeting, expense tracking, and financial goal setting",
            "Built with Flutter for cross-platform support",
          ],
        ),
        KeyProject(
          appName: "CargoEZ Portal",
          imageUrl: "assets/image.png",
          projectUrl:
              "https://play.google.com/store/apps/details?id=com.avow.cargoez&hl=en_IN",

          descriptions: [
            "Enables customer approvals, milestone tracking, file uploads, and real-time status updates.",
            "Built with Flutter for cross-platform support",
            "Integrates with CargoEZ for seamless data synchronization",
          ],
        ),
        KeyProject(
          appName: "CargoEZ Tower",
          imageUrl: "assets/image-1.png",
          projectUrl:
              "https://play.google.com/store/apps/details?id=com.avow.cez_tower&hl=en_IN",

          descriptions: [
            "An Android TV dashboard app designed to motivate sales teams and display performance insights.",
            "Ideal for office TV displays and sales war rooms.",
            "Supports any Android TV device",
          ],
        ),
        KeyProject(
          appName: "CargoEZ for email",
          imageUrl: "assets/image-2.png",
          projectUrl:
              "https://workspace.google.com/marketplace/app/cargoez_for_gmail/542931744150",

          descriptions: [
            "A productivity-focused Gmail Add-on that allows users to create leads and contacts directly from emails.",
            "Enables users to approve tasks, update records, and view lead info all from the Gmail sidebar.",
            "Available on Google Workspace Marketplace",
          ],
        ),
      ],
    ),

    ExperienceData(
      timeLineIcon: AppIcons.icons8Google,
      companyName:
          "Namma Flutter Chennai | Official Google Developer Meetup Group",
      position: "Lead Organizer & Developer",
      duration: "2023 – Present",
      description:
          "Conducted 12+ technical workshops and hosted 30+ speakers for the Namma Flutter Chennai community, an official Google Developer Meetup group.",
      keyFeatures: [
        "Community-driven events",
        "Focus on Flutter and Dart technologies",
        "Collaboration with Google Developer Groups",
        "Hands-on workshops and technical sessions",
        "Networking opportunities for developers",
        "Promoting open-source contributions",
        "Encouraging knowledge sharing and skill development",
        "Fostering a supportive environment for developers",
        "Building a strong local developer community",
        "Engaging with industry experts and thought leaders",
        "Creating a platform for learning and growth",
      ],
      technologies: ["Flutter", "Dart", "Firebase", "Google Developer Groups"],
      companyLogo: AppIcons.nammaflutterLogo,
      isLeft: false,
      showButton: true,

      importantLinks: [
        // "https://workspace.google.com/products/meet/",
        // "https://www.linkedin.com/posts/nammaflutter_nammaflutter-flutter-chennai-activity-7344437818670125056-fjDT?utm_source=share&utm_medium=member_desktop&rcm=ACoAADE-VMIBnRHudF9rrimYWDB4zDScUq_S4VM",
        // "https://www.linkedin.com/posts/kumarankarunakaran_lets-get-deep-linking-in-flutter-activity-7344399763414372352-d2bg?utm_source=share&utm_medium=member_desktop&rcm=ACoAADE-VMIBnRHudF9rrimYWDB4zDScUq_S4VM",
        // "https://www.linkedin.com/posts/kumarankarunakaran_keepfluttering-fluttercommunity-nammaflutter-activity-7342900845241319425-9Ov3?utm_source=share&utm_medium=member_desktop&rcm=ACoAADE-VMIBnRHudF9rrimYWDB4zDScUq_S4VM",
      ],
      photoPaths: [
        "https://media.licdn.com/dms/image/v2/D5622AQE-9k47Ry6yxA/feedshare-shrink_1280/B56ZeyvQU0H8Ak-/0/1751050427400?e=1754524800&v=beta&t=BP1bJ_ING1UHns0U7FDFuco001T4pBInBYgNKTZ3eQA",
        "https://media.licdn.com/dms/image/v2/D5622AQE_WU6TjPJyYQ/feedshare-shrink_1280/B56ZelY0ChH8Ak-/0/1750826436178?e=1754524800&v=beta&t=QmxUY32m0K3kgcQF6K7aEsbx3kJ_dP3tMGMg6KKHXmQ",
        "https://media.licdn.com/dms/image/v2/D5622AQFFMKVZ7JHffA/feedshare-shrink_2048_1536/B56ZelY0DBGQAs-/0/1750826437043?e=1754524800&v=beta&t=J4RnB3fr1Hpe5m3qtQ-st9BPJK9VoeVHpoO7XqKxdvE",
        "https://media.licdn.com/dms/image/v2/D5622AQFIYQ55oOu75Q/feedshare-shrink_2048_1536/B56ZZ1ze_vHUAo-/0/1745733155092?e=1754524800&v=beta&t=-4fnL3FgDxNEPEdoTwchlDEhnCmNjjQ9gyVW3TyjOKA",
        "https://media.licdn.com/dms/image/v2/D5622AQF0HawcGdw3-A/feedshare-shrink_2048_1536/B56ZZ1zfDQHsAo-/0/1745733158909?e=1754524800&v=beta&t=Y07gnME5VjO5XKeoWdz4J5qvxPrDIsyACRJaztop9M4",
        "https://media.licdn.com/dms/image/v2/D5622AQGkmUTbg8TI1g/feedshare-shrink_2048_1536/B56ZZ1zfMyHUAo-/0/1745733160750?e=1754524800&v=beta&t=8n91CTWrAcp9blpQA5Sb4_rMNTZ5FSrcSw31oh7_aj0",
        "https://media.licdn.com/dms/image/v2/D5622AQFFS4HpuT3F9g/feedshare-shrink_1280/feedshare-shrink_1280/0/1727635498846?e=1753920000&v=beta&t=uFDLBNoXm4r151uMnILvuFHtobRuBKtPcprf7flEBnc",
        "https://media.licdn.com/dms/image/v2/D5622AQF_KCxICRqgzQ/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1727635502847?e=1753920000&v=beta&t=wu6zgqQBl6x29AyGeFjlO9zolbuI2C6uB-8n76y6Ifw",
        "https://media.licdn.com/dms/image/v2/D5622AQHIP6UpRFW8rA/feedshare-shrink_2048_1536/B56ZZ9eexvGUAo-/0/1745861957626?e=1754524800&v=beta&t=3Z6ebX7kv3KUZvA52S1RnuILbQ0o3peTGljBb7DMFa8",
        "https://media.licdn.com/dms/image/v2/D5622AQGbWlITzugQ3Q/feedshare-shrink_2048_1536/B56ZZ1sJ5rGkAo-/0/1745731253183?e=1754524800&v=beta&t=jMKL4Mh9ZgYc6lCDzl6rUDCkte4swqEwTAE3Mc5cXNc",
        "https://media.licdn.com/dms/image/v2/D5622AQFKxG9h82ZKQw/feedshare-shrink_1280/feedshare-shrink_1280/0/1722227596195?e=1754524800&v=beta&t=MH--hTHmLUUwhzBTZ9_KfBPiLylEA1NDkce32jbfBJw",
        "https://media.licdn.com/dms/image/v2/D4D22AQGYwJcv6BjtIQ/feedshare-shrink_2048_1536/B4DZZ8tq_5GwAo-/0/1745849296957?e=1753920000&v=beta&t=yKVOAEmVwwazTvkc5R1Kho87KuY-6_xfppq3lQ0eNfA",
      ],
    ),
    ExperienceData(
      timeLineIcon: AppIcons.icons8Android,
      companyName: "Avow Solutions Inc",
      position: "Flutter Developer - Intern",
      duration: "Dec 2022 – Jul 2023",
      description:
          "Assisted in developing and maintaining mobile applications, gained hands-on experience with Flutter and Dart.",
      keyFeatures: [
        "Learned the basics of Flutter development, including building UI screens and navigating the widget tree.",
        "Assisted in connecting the app to Firebase for login and storing simple data.",
        "Helped fix minor UI bugs and tested app flows under senior developer guidance.",
      ],
      technologies: ["Flutter", "Provider", "Dart", "Firebase"],
      companyLogo: AppIcons.avow,
      isLeft: true,
      showButton: false,
    ),
    ExperienceData(
      timeLineIcon: AppIcons.icons8Bookmark,
      companyName: "Sri Krishana College of Engineering and Technology",
      position: "BE in Mechanical Engineering",
      duration: "2019 – 2023",
      description: "",
      keyFeatures: ["Graduated with First Class Honors", "GPA: 8.5/10"],
      technologies: [],
      companyLogo: AppIcons.skcetLogo,
      isLeft: false,
      showButton: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      experiences.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 800 + (index * 200)),
        vsync: this,
      ),
    );

    _fadeAnimations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );
    }).toList();

    _slideAnimations = _controllers.asMap().entries.map((entry) {
      final index = entry.key;
      final controller = entry.value;
      final isLeft = experiences[index].isLeft;

      return Tween<Offset>(
        begin: Offset(widget.isMobile ? 0.0 : (isLeft ? -0.3 : 0.3), 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    }).toList();
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      for (int i = 0; i < _controllers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 300), () {
          if (mounted) _controllers[i].forward();
        });
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF64B5F6).withOpacity(0.08),
            const Color(0xFF2196F3).withOpacity(0.05),
            const Color(0xFFE3F2FD).withOpacity(0.1),
          ],
        ),
      ),
      child: CustomPaint(
        painter: DottedBackgroundPainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 16 : 32,
            vertical: widget.isMobile ? 24 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(),
              SizedBox(height: widget.isMobile ? 24 : 40),
              if (widget.isMobile)
                _buildMobileTimeline()
              else if (isTablet)
                _buildTabletTimeline()
              else
                _buildDesktopTimeline(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Professional Experience',
          style: widget.isMobile
              ? HeadingH6(color: Neutral.n800).semiBold
              : HeadingH4(color: Neutral.n800).semiBold,
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          width: widget.isMobile ? 50 : 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (!widget.isMobile) ...[
          const SizedBox(height: 12),
          Text(
            'My journey through various roles and companies',
            style: widget.isMobile
                ? Paragraph03(color: Neutral.n800).regular
                : Paragraph02(color: Neutral.n800).regular,
          ),
        ],
      ],
    );
  }

  Widget _buildMobileTimeline() {
    return Stack(
      children: [
        // Single timeline line on the left
        Positioned(
          left: 24,
          top: 0,
          bottom: 0,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
        // Timeline items aligned to the right
        Column(
          children: List.generate(experiences.length, (index) {
            return AnimatedBuilder(
              animation: _controllers[index],
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: _buildMobileTimelineItem(experiences[index], index),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildTabletTimeline() {
    return Stack(
      children: [
        // Single timeline line on the left (tablet uses left alignment)
        Positioned(
          left: 24,
          top: 0,
          bottom: 0,
          child: Container(
            width: 3,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
              ),
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ),
        // Timeline items
        Column(
          children: List.generate(experiences.length, (index) {
            return AnimatedBuilder(
              animation: _controllers[index],
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: _buildTabletTimelineItem(experiences[index], index),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildDesktopTimeline() {
    final availableWidth =
        MediaQuery.of(context).size.width -
        (widget.isMobile
            ? 64
            : (MediaQuery.of(context).size.width > 1200 ? 192 : 128));

    return Stack(
      children: [
        // Central timeline line
        Positioned(
          left: availableWidth * 0.5 - 2,
          top: 0,
          bottom: 0,
          child: Container(
            width: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        // Timeline items
        Column(
          children: List.generate(experiences.length, (index) {
            return AnimatedBuilder(
              animation: _controllers[index],
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: _buildDesktopTimelineItem(experiences[index], index),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMobileTimelineItem(ExperienceData experience, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Stack(
        children: [
          // Timeline dot
          Positioned(
            left: 13,
            top: 20,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CommonUtils.getSvgIcon(experience.timeLineIcon, size: 24),
            ),
          ),
          // Content card aligned to the right
          Container(
            margin: const EdgeInsets.only(left: 50),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: CommonUtils.getSvgIcon(experience.companyLogo),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience.companyName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            experience.position,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2196F3),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            experience.duration,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          if (experience.showButton)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: ElevatedButton(
                                onPressed: () =>
                                    _navigateToDetailPage(experience),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2196F3),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  fixedSize: const Size(100, 28),
                                ),
                                child: Text(
                                  'Show More',
                                  style: Caption(color: Shades.s0).semiBold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletTimelineItem(ExperienceData experience, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      child: Stack(
        children: [
          // Timeline dot
          Positioned(
            left: 16,
            top: 20,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.work, color: Colors.white, size: 11),
            ),
          ),
          // Content card aligned to the right
          Container(
            margin: const EdgeInsets.only(left: 55),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey[200]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CommonUtils.getSvgIcon(experience.companyLogo),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience.companyName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            experience.position,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF2196F3),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  experience.duration,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  experience.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () => _navigateToDetailPage(experience),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTimelineItem(ExperienceData experience, int index) {
    final isLeft = experience.isLeft;
    final availableWidth =
        MediaQuery.of(context).size.width -
        (widget.isMobile
            ? 64
            : (MediaQuery.of(context).size.width > 1200 ? 192 : 128));
    final cardWidth =
        (availableWidth - 80) / 2; // 80px for timeline and spacing

    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      constraints: BoxConstraints.expand(height: 300),
      child: Stack(
        children: [
          // Timeline dot
          Positioned(
            left: availableWidth * 0.5 - 26,
            top: 20,
            child: Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF64B5F6), Color(0xFF2196F3)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: CommonUtils.getSvgIcon(experience.timeLineIcon, size: 40),
            ),
          ),

          // Content card
          Positioned(
            left: isLeft ? 0 : availableWidth * 0.5 + 40,
            width: cardWidth,
            top: 0,
            child: _buildExperienceCard(experience),
          ),
        ],
      ),
    );
  }

  // Experience card widget
  Widget _buildExperienceCard(ExperienceData experience) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: CommonUtils.getSvgIcon(experience.companyLogo, size: 28),
            ),
            title: Text(
              experience.companyName,
              style: Paragraph02(color: Neutral.n800).semiBold,
            ),
            trailing: Text(
              experience.duration,
              style: Paragraph03(color: Neutral.n800).regular,
            ),
            subtitle: experience.position.isEmpty
                ? null
                : Text(
                    experience.position,
                    style: Paragraph02(color: Primary.primary500).semiBold,
                  ),
          ),
          if (experience.description.trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                experience.description,
                style: Paragraph03(color: Neutral.n700).regular,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          if (experience.showButton)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ButtonComponents.filledButton(
                onPressed: () => _navigateToDetailPage(experience),
                label: 'Show More',
                size: const Size(160, 40),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                experience.keyFeatures.isNotEmpty
                    ? experience.keyFeatures.join(', ')
                    : '',
                style: Paragraph03(color: Neutral.n600).regular,
              ),
            ),
        ],
      ),
    );
  }

  void _navigateToDetailPage(ExperienceData experience) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExperienceDetailPage(experience: experience),
      ),
    );
  }
}
