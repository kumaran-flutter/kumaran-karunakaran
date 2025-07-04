import 'package:flutter/material.dart';

import 'package:kumaran_k_portfolio/styles/styles.dart';
import '../components/box_shadow.dart';
import '../components/components.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey footerKey = GlobalKey(); // Add this key for footer

  final List<String> _navItems = [
    'Home',
    'Projects',
    'Skills',
    'Education',
    'Achievements',
  ];

  int _selectedIndex = 0;

  double _displayExperience = 1.5;
  double _displayProjects = 3.0;
  double _displayBugs = 30.0;

  final int _targetExperience = 2;
  final int _targetProjects = 5;
  final int _targetBugs = 50;
  final List<Map<String, String>> socialLinks = [
    {
      'icon': AppIcons.linkedin,
      'url': 'https://www.linkedin.com/in/kumarankarunakaran/',
    },
    {
      'icon': AppIcons.instagramSvgrepoCom,
      'url': 'https://www.instagram.com/kumaran_karunakaran_/',
    },
    {
      'icon': AppIcons.mailSendSvgrepoCom,
      'url': 'mailto:kumaransk1608@gmail.com',
    },
    {'icon': AppIcons.mediumSvgrepoCom, 'url': 'https://medium.com/@skkumaran'},
    {
      'icon': AppIcons.socialGithubSvgrepoCom,
      'url': 'https://github.com/kumaran-flutter',
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _displayExperience = _targetExperience.toDouble();
        _displayProjects = _targetProjects.toDouble();
        _displayBugs = _targetBugs.toDouble();
      });
    });
  }

  // Helper method to determine breakpoints
  bool get isSmallScreen => MediaQuery.of(context).size.width < 600;
  bool get isMediumScreen =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;
  bool get isLargeScreen => MediaQuery.of(context).size.width >= 900;

  // Method to scroll to footer
  void scrollToFooter() {
    final context = footerKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Neutral.n50,
      endDrawer: isSmallScreen ? _buildDrawer() : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeader(),

          Expanded(
            child: SingleChildScrollView(child: _buildMainContent(screenWidth)),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double screenWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 16 : 43,
            horizontal: _getHorizontalPadding(screenWidth),
          ),
          child: Column(
            children: [
              _buildProfileSection(screenWidth),
              SizedBox(height: isSmallScreen ? 24 : 32),
              CarouselComponent(),
              AboutSection(
                isSmallScreen: isSmallScreen,
                displayExperience: _displayExperience,
                displayProjects: _displayProjects,
                displayBugs: _displayBugs,
              ),
            ],
          ),
        ),
        SkillsSection(isMobile: isSmallScreen),
        SizedBox(height: isSmallScreen ? 24 : 32),
        TimelineExperienceSection(isMobile: isSmallScreen),
        SizedBox(height: isSmallScreen ? 24 : 32),
        ProjectsSections(isMobile: isSmallScreen),
        PortfolioFooter(key: footerKey),
      ],
    );
  }

  double _getHorizontalPadding(double screenWidth) {
    if (isSmallScreen) return 16;
    if (isMediumScreen) return screenWidth * 0.08;
    return screenWidth * 0.1;
  }

  Widget _buildProfileSection(double screenWidth) {
    // Calculate minimum width needed for row layout
    final double horizontalPadding = _getHorizontalPadding(screenWidth) * 2;
    final double availableWidth = screenWidth - horizontalPadding;
    final bool shouldUseColumnLayout = availableWidth < 750;

    if (shouldUseColumnLayout) {
      return Column(
        children: [
          _buildAboutCard(),
          SizedBox(height: 16),
          Center(child: _buildImageCard()),
        ],
      );
    } else {
      // Use IntrinsicHeight for equal height cards
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(child: _buildAboutCard())),
            SizedBox(width: 32),
            _buildImageCard(),
          ],
        ),
      );
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: const Text(
                    'KK',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Kumaran K',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mobile application developer',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ..._navItems.asMap().entries.map((entry) {
            return ListTile(
              leading: Icon(
                _getIconForNavItem(entry.value),
                color: _selectedIndex == entry.key
                    ? Colors.blue
                    : Colors.black54,
              ),
              title: Text(
                entry.value,
                style: TextStyle(
                  color: _selectedIndex == entry.key
                      ? Colors.blue
                      : Colors.black87,
                  fontWeight: _selectedIndex == entry.key
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              selected: _selectedIndex == entry.key,
              onTap: () {
                setState(() => _selectedIndex = entry.key);
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Neutral.n25,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo and name section
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  backgroundImage: AssetImage('assets/logo.jpeg'),
                ),
              ),
              if (!isSmallScreen || MediaQuery.of(context).size.width > 480)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kumaran K',
                      style: Paragraph02(color: Neutral.n900).regular,
                    ),
                    Text(
                      'Software developer',
                      style: Paragraph03(color: Neutral.n600).regular,
                    ),
                  ],
                ),
            ],
          ),
          if (isSmallScreen)
            const Spacer(), // Push navigation to the right on small screens
          // Navigation section
          if (isSmallScreen)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            )
          else
            _buildDesktopNavigation(),
        ],
      ),
    );
  }

  Widget _buildDesktopNavigation() {
    final screenWidth = MediaQuery.of(context).size.width;

    // Show compact navigation on smaller desktop screens
    if (screenWidth < 1024) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PopupMenuButton<int>(
            icon: Icon(Icons.menu, color: Colors.black87),
            onSelected: (index) => setState(() => _selectedIndex = index),
            itemBuilder: (context) => _navItems.asMap().entries.map((entry) {
              return PopupMenuItem<int>(
                value: entry.key,
                child: Text(entry.value),
              );
            }).toList(),
          ),
          const SizedBox(width: 8),
          _buildActionButtons(compact: true),
        ],
      );
    }

    // Full navigation on large screens
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ..._navItems.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: () => setState(() => _selectedIndex = entry.key),
              child: Text(
                entry.value,
                style: Paragraph03(color: Neutral.n700).regular,
              ),
            ),
          );
        }),
        const SizedBox(width: 16),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildActionButtons({bool compact = false}) {
    if (compact) {
      return ButtonComponents.filledButton(
        onPressed: scrollToFooter,
        label: 'Contact',
      );
    }

    return Row(
      children: [
        ButtonComponents.elevatedButton(
          onPressed: () => CommonUtils.downloadResume(context),
          label: 'Resume',
        ),
        const SizedBox(width: 8),
        ButtonComponents.filledButton(
          onPressed: scrollToFooter,
          label: 'Let’s Talk',
        ),
      ],
    );
  }

  Widget _buildAboutCard() {
    return BoxShadowComponent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hi, I am', style: HeadingH2(color: Neutral.n900).semiBold),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'Kumaran ',
              style: HeadingH2(color: Neutral.n900).semiBold,
              children: [
                TextSpan(
                  text: 'Karunakaran',
                  style: HeadingH2(color: Primary.primary500).semiBold,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Mobile application developer',
            style: HeadingH5(color: Neutral.n800).semiBold,
          ),
          SizedBox(height: 16),
          Text(
            "Hey, I'm, welcome to my space. I craft high-performance, user-friendly mobile apps using Flutter and Firebase, blending clean architecture with real-world impact.",
            style: Paragraph02(color: Neutral.n800).regular,
          ),
          SizedBox(height: 24),
          _buildSocialLinks(),
          SizedBox(height: 24),
          _buildAboutCardButtons(),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: socialLinks
          .map(
            (link) => InkWell(
              onTap: () => CommonUtils.launchUrlFunc(link['url']!),
              child: CommonUtils.getSvgIcon(link['icon']!, size: 24),
            ),
          )
          .toList(),
    );
  }

  Widget _buildAboutCardButtons() {
    if (isSmallScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ButtonComponents.filledButton(
            onPressed: () => CommonUtils.downloadResume(context),
            label: 'Resume →',
          ),
          SizedBox(height: 8),
          ButtonComponents.elevatedButton(
            onPressed: scrollToFooter,
            label: 'Let’s Talk',
          ),
        ],
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ButtonComponents.filledButton(
          size: Size(140, 40),
          onPressed: () => CommonUtils.downloadResume(context),
          label: 'Resume →',
        ),
        ButtonComponents.elevatedButton(
          size: Size(140, 40),
          onPressed: scrollToFooter,
          label: 'Let’s Talk',
        ),
      ],
    );
  }

  Widget _buildImageCard() {
    // Static image size - always 300x300
    const double staticImageSize = 300.0;

    return SizedBox(
      width: staticImageSize + 32, // Fixed width: image + padding
      child: BoxShadowComponent(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/logo.jpeg',
                fit: BoxFit.cover,
                height: staticImageSize,
                width: staticImageSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForNavItem(String navItem) {
    switch (navItem) {
      case 'Home':
        return Icons.home;
      case 'Projects':
        return Icons.work;
      case 'Skills':
        return Icons.code;
      case 'Education':
        return Icons.school;
      case 'Achievements':
        return Icons.emoji_events;
      default:
        return Icons.circle;
    }
  }
}
