import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/utils/common_utils.dart';

import '../styles/styles.dart';

class SkillsSection extends StatefulWidget {
  final bool isMobile;

  const SkillsSection({super.key, required this.isMobile});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> skillCategories = [
    {
      'title': 'Frameworks & Languages',
      'icon': Icons.web,
      'skills': [
        {'name': 'Flutter', 'level': 0.95, 'icon': AppIcons.icons8Flutter},
        {'name': 'Dart', 'level': 0.90, 'icon': AppIcons.icons8Dart},
        {'name': 'Node.js', 'level': 0.85, 'icon': AppIcons.icons8Nodejs},
        {'name': 'Express.js', 'level': 0.80, 'icon': AppIcons.icons8ExpressJs},
        {
          'name': 'JavaScript',
          'level': 0.85,
          'icon': AppIcons.icons8Javascript,
        },
      ],
    },
    {
      'title': 'State Management & Architecture',
      'icon': Icons.settings,
      'skills': [
        {'name': 'Provider', 'level': 0.85, 'icon': AppIcons.icons8Dart},
        {'name': 'BLoC', 'level': 0.80, 'icon': AppIcons.icons8Dart},
        {'name': 'Cubit', 'level': 0.75, 'icon': AppIcons.icons8Dart},
        {'name': 'MVVM', 'level': 0.70, 'icon': AppIcons.icons8Folder},
        {
          'name': 'Clean Architecture',
          'level': 0.75,
          'icon': AppIcons.architectureSvgrepoCom,
        },
      ],
    },
    {
      'title': 'Database & Storage',
      'icon': Icons.storage,
      'skills': [
        {'name': 'Firebase', 'level': 0.90, 'icon': AppIcons.icons8Firebase},
        {'name': 'Firestore', 'level': 0.85, 'icon': AppIcons.icons8Firebase},
        {
          'name': 'REST APIs',
          'level': 0.88,
          'icon': AppIcons.apiInterfaceSvgrepoCom,
        },
        {'name': 'Hive', 'level': 0.80, 'icon': AppIcons.icons8Dart},
        {
          'name': 'Shared Preferences',
          'level': 0.75,
          'icon': AppIcons.icons8Dart,
        },
      ],
    },

    {
      'title': 'Tools & Workflow',
      'icon': Icons.build,
      'skills': [
        {'name': 'Git', 'level': 0.90, 'icon': AppIcons.icons8Git},
        {
          'name': 'GitHub',
          'level': 0.90,
          'icon': AppIcons.socialGithubSvgrepoCom,
        },
        {
          'name': 'Postman',
          'level': 0.85,
          'icon': AppIcons.postmanIconSvgrepoCom,
        },
        {'name': 'Unit Testing', 'level': 0.75, 'icon': AppIcons.icons8Dart},
      ],
    },
    {
      'title': 'Publishing & Integration',
      'icon': Icons.publish,
      'skills': [
        {'name': 'Play Store', 'level': 0.90, 'icon': AppIcons.icons8PlayStore},

        {
          'name': 'Firebase Crashlytics',
          'level': 0.75,
          'icon': AppIcons.icons8Firebase,
        },
        {'name': 'App Store', 'level': 0.85, 'icon': AppIcons.icons8AppStore},
        {'name': 'OAuth 2.0', 'level': 0.80, 'icon': AppIcons.icons8Google},
        {'name': 'Analytics', 'level': 0.75, 'icon': AppIcons.icons8Firebase},
        {'name': 'Figma', 'level': 0.70, 'icon': AppIcons.icons8Figma},
        {'name': 'Gmail add-ons', 'level': 0.70, 'icon': AppIcons.icons8Gmail},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9, initialPage: 0);

    _controllers = List.generate(
      skillCategories.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 1500 + (index * 200)),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );
    }).toList();

    Future.delayed(const Duration(milliseconds: 300), () {
      for (int i = 0; i < _controllers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 150), () {
          if (mounted) _controllers[i].forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 16 : (screenWidth > 1200 ? 64 : 32),
      ),
      decoration: BoxDecoration(
        color: Primary.primary50.withAlpha((0.1 * 255).toInt()),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.isMobile ? 16 : 32,
          vertical: widget.isMobile ? 24 : 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSectionHeader(),
            SizedBox(height: widget.isMobile ? 20 : 32),
            widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Expertise',
          style: widget.isMobile
              ? HeadingH4(color: Neutral.n800).semiBold
              : HeadingH3(color: Neutral.n800).semiBold,
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          width: widget.isMobile ? 50 : 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Primary.primary400, Primary.primary600],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (!widget.isMobile) ...[
          const SizedBox(height: 12),
          Text(
            'Technical skills and proficiency levels across different domains',
            style: Paragraph02(color: Neutral.n700).regular,
          ),
        ],
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        SizedBox(
          height: _calculateMobileCardHeight(),
          child: PageView.builder(
            controller: _pageController,
            itemCount: skillCategories.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.95 + (0.05 * _animations[index].value),
                      child: Opacity(
                        opacity: _animations[index].value,
                        child: _buildCompactSkillCard(
                          skillCategories[index],
                          index,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    final screenWidth = MediaQuery.of(context).size.width;
    final double cardMinWidth = 260;
    final double spacing = 16;
    final int columns = (screenWidth / (cardMinWidth + spacing)).floor();
    final double itemWidth =
        (screenWidth - (spacing * (columns + 1))) / columns;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(skillCategories.length, (index) {
        final category = skillCategories[index];
        final skills = category['skills'] as List;

        return Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Shades.s0,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Category Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Primary.primary100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(category['icon'], color: Primary.primary500),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    category['title'],
                    style: HeadingH5(color: Neutral.n800).semiBold,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Skill List
              Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(skills.length, (skillIndex) {
                  final skill = skills[skillIndex];
                  return Container(
                    width: itemWidth,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Neutral.n25,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Neutral.n100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CommonUtils.getSvgIcon(skill['icon'], size: 28),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                skill['name'],
                                style: Paragraph02(
                                  color: Neutral.n700,
                                ).semiBold,
                              ),
                            ),
                            Text(
                              '${(skill['level'] * 100).toInt()}%',
                              style: Paragraph03(color: Neutral.n500).regular,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: skill['level'],
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(8),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Primary.primary400,
                          ),
                          backgroundColor: Neutral.n100,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCompactSkillCard(Map<String, dynamic> category, int index) {
    final skills = category['skills'] as List;
    final displaySkills = skills.toList(); // Show only first 4 skills

    return Container(
      decoration: BoxDecoration(
        color: Shades.s0,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Primary.primary100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Primary.primary300.withAlpha((0.15 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCardHeader(category),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: displaySkills.length,
              itemBuilder: (context, skillIndex) {
                final skill = displaySkills[skillIndex];
                return _buildCompactSkillItem(
                  skill['icon'],
                  skill['name'],
                  skill['level'],
                  _animations[index].value,
                  skillIndex,
                );
              },
            ),
          ),
          // if (skills.length > 4)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 8),
          //     child: Text(
          //       '+${skills.length - 4} more skills',
          //       style: Paragraph03(color: Primary.primary500).semiBold,
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget _buildCardHeader(Map<String, dynamic> category) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Primary.primary100, Primary.primary50],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            category['icon'],
            color: Primary.primary600,
            size: widget.isMobile ? 12 : 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            category['title'],
            style: widget.isMobile
                ? HeadingH6Small(color: Neutral.n800).semiBold
                : HeadingH5(color: Neutral.n800).semiBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // Widget _buildSkillsList(List skills, int categoryIndex) {
  //   return ListView.builder(
  //     padding: EdgeInsets.zero,
  //     itemCount: skills.length,
  //     itemBuilder: (index, skillIndex) {
  //       final skill = skills[skillIndex];
  //       return _buildSkillItem(
  //         skill['name'],
  //         skill['level'],
  //         _animations[categoryIndex].value,
  //         skillIndex,
  //       );
  //     },
  //   );
  // }

  Widget _buildCompactSkillItem(
    String icon,
    String name,
    double level,
    double animationValue,
    int index,
  ) {
    final delay = index * 0.1;
    final adjustedValue = (animationValue - delay).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CommonUtils.getSvgIcon(icon, size: 18),
          const SizedBox(width: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Paragraph03(color: Neutral.n700).semiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Neutral.n100,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: level * adjustedValue,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Primary.primary400, Primary.primary600],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Container(
            constraints: const BoxConstraints(minWidth: 28),
            child: Text(
              '${(level * 100).toInt()}%',
              style: TextStyle(
                color: Primary.primary500.withAlpha(
                  (adjustedValue * 255).toInt(),
                ),
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        skillCategories.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: _currentPage == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Primary.primary500
                : Primary.primary200,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  double _calculateMobileCardHeight() {
    return 350;
  }
}
