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
  final GlobalKey homeKey = GlobalKey(); // Key for home section
  final GlobalKey aboutKey = GlobalKey(); // Key for about section
  final GlobalKey skillsKey = GlobalKey(); // Key for skills section
  final GlobalKey experienceKey = GlobalKey(); // Key for experience section
  final GlobalKey projectsKey = GlobalKey(); // Key for projects section
  final GlobalKey footerKey = GlobalKey(); // Key for footer/contact section

  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Projects',
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

  // Method to scroll to a specific section
  void _scrollToSection(int index) {
    GlobalKey? targetKey;

    switch (index) {
      case 0: // Home
        targetKey = homeKey;
        break;
      case 1: // About
        targetKey = aboutKey;
        break;
      case 2: // Skills
        targetKey = skillsKey;
        break;
      case 3: // Experience
        targetKey = experienceKey;
        break;
      case 4: // Projects
        targetKey = projectsKey;
        break;
      case 5: // Contact
        targetKey = footerKey;
        break;
    }

    if (targetKey != null) {
      final context = targetKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          alignment: 0.0,
        );
      }
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
        // Home Section
        Container(key: homeKey),
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
              // About Section
              Container(key: aboutKey),
              AboutSection(
                isSmallScreen: isSmallScreen,
                displayExperience: _displayExperience,
                displayProjects: _displayProjects,
                displayBugs: _displayBugs,
              ),
            ],
          ),
        ),
        // Skills Section
        Container(key: skillsKey),
        SkillsSection(isMobile: isSmallScreen),
        SizedBox(height: isSmallScreen ? 24 : 32),
        // Experience Section
        Container(key: experienceKey),
        TimelineExperienceSection(isMobile: isSmallScreen),
        SizedBox(height: isSmallScreen ? 24 : 32),
        // Projects Section
        Container(key: projectsKey),
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.95),
              Neutral.n50.withOpacity(0.97),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(-2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Primary.primary500, Primary.primary700],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        backgroundImage: AssetImage('assets/logo.jpeg'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Mobile Application Developer',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.95),
                        fontSize: 15,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    ..._navItems.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _buildDrawerItem(
                          icon: _getIconForNavItem(entry.value),
                          title: entry.value,
                          isSelected: _selectedIndex == entry.key,
                          onTap: () {
                            setState(() => _selectedIndex = entry.key);
                            Navigator.pop(context);
                            _scrollToSection(entry.key);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Divider(color: Neutral.n200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ButtonComponents.filledButton(
                onPressed: () => CommonUtils.downloadResume(context),
                label: 'Download Resume',
                icon: Icons.download_outlined,
                size: Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: isSelected ? 4 : 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isSelected ? Primary.primary50 : Colors.white.withOpacity(0.7),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Primary.primary400 : Colors.transparent,
              width: 1.5,
            ),
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Primary.primary50,
                      Primary.primary50.withOpacity(0.7),
                    ],
                  )
                : null,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected ? Primary.primary100 : Neutral.n50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Primary.primary600 : Neutral.n700,
                  size: 20, // Slightly smaller icon
                ),
              ),
              SizedBox(width: 12), // Slightly reduced padding
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Primary.primary600 : Neutral.n900,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 15, // Slightly smaller font
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isSelected) SizedBox(width: 4),
              if (isSelected)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14, // Smaller arrow icon
                  color: Primary.primary500,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Neutral.n25,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo and name section
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/logo.jpeg'),
                  ),
                ),
              ),
              if (!isSmallScreen || MediaQuery.of(context).size.width > 480)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kumaran K',
                      style: Paragraph02(color: Primary.primary700).semiBold,
                    ),
                    Text(
                      'Mobile Application Developer',
                      style: Paragraph03(color: Neutral.n600).regular,
                    ),
                  ],
                ),
            ],
          ),
          if (isSmallScreen)
            IconButton(
              icon: Icon(Icons.menu, color: Primary.primary700, size: 28),
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
          Container(
            decoration: BoxDecoration(
              color: Neutral.n50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: PopupMenuButton<int>(
              icon: Icon(Icons.menu, color: Primary.primary700),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onSelected: (index) {
                setState(() => _selectedIndex = index);
                _scrollToSection(index);
              },
              itemBuilder: (context) => _navItems.asMap().entries.map((entry) {
                return PopupMenuItem<int>(
                  value: entry.key,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getIconForNavItem(entry.value),
                          color: _selectedIndex == entry.key
                              ? Primary.primary600
                              : Neutral.n700,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              color: _selectedIndex == entry.key
                                  ? Primary.primary600
                                  : Neutral.n900,
                              fontWeight: _selectedIndex == entry.key
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 12),
          _buildActionButtons(compact: true),
        ],
      );
    }

    // We'll use a flexible layout to adjust to available space

    // Full navigation on large screens with improved UI
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: Neutral.n50,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _navItems.asMap().entries.map((entry) {
                    bool isSelected = _selectedIndex == entry.key;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Primary.primary50
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? Primary.primary300
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: isSelected ? 12 : 10,
                              vertical: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            setState(() => _selectedIndex = entry.key);
                            _scrollToSection(entry.key);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isSelected) ...[
                                Icon(
                                  _getIconForNavItem(entry.value),
                                  color: Primary.primary600,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                              ],
                              Text(
                                entry.value,
                                style: isSelected
                                    ? Paragraph03(
                                        color: Primary.primary600,
                                      ).semiBold
                                    : Paragraph03(color: Neutral.n700).regular,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons({bool compact = false}) {
    if (compact) {
      return ButtonComponents.filledButton(
        onPressed: () {
          setState(() => _selectedIndex = 5); // Set Contact as selected
          _scrollToSection(5); // Scroll to contact section
        },
        label: 'Let\'s Talk',
        icon: Icons.chat_bubble_outline_rounded,
        size: Size(120, 40),
      );
    }

    return Row(
      children: [
        ButtonComponents.elevatedButton(
          onPressed: () => CommonUtils.downloadResume(context),
          label: 'Resume',
          icon: Icons.download_outlined,
          size: Size(120, 44),
        ),
        const SizedBox(width: 8),
        ButtonComponents.filledButton(
          onPressed: () {
            setState(() => _selectedIndex = 5); // Set Contact as selected
            _scrollToSection(5); // Scroll to contact section
          },
          label: 'Let\'s Talk',
          icon: Icons.chat_bubble_outline_rounded,
          size: Size(140, 44),
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
            label: 'Resume',
            icon: Icons.download_outlined,
          ),
          SizedBox(height: 8),
          ButtonComponents.elevatedButton(
            onPressed: () {
              setState(() => _selectedIndex = 5); // Set Contact as selected
              _scrollToSection(5); // Scroll to contact section
            },
            label: 'Contact Me',
            icon: Icons.mail_outline_rounded,
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
          label: 'Resume',
          icon: Icons.download_outlined,
        ),
        ButtonComponents.elevatedButton(
          size: Size(140, 40),
          onPressed: () {
            setState(() => _selectedIndex = 5); // Set Contact as selected
            _scrollToSection(5); // Scroll to contact section
          },
          label: 'Contact Me',
          icon: Icons.mail_outline_rounded,
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
        return Icons.home_outlined;
      case 'About':
        return Icons.person_outline_rounded;
      case 'Projects':
        return Icons.work_outline_rounded;
      case 'Skills':
        return Icons.code_outlined;
      case 'Experience':
        return Icons.timeline_outlined;
      default:
        return Icons.circle_outlined;
    }
  }
}
