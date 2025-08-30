import 'package:flutter/material.dart';

import 'package:kumaran_k_portfolio/styles/styles.dart';
import '../components/box_shadow.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../services/portfolio_data_service.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey homeKey = GlobalKey(); // Key for home section
  final GlobalKey aboutKey = GlobalKey(); // Key for about section
  final GlobalKey skillsKey = GlobalKey(); // Key for skills section
  final GlobalKey experienceKey = GlobalKey(); // Key for experience section
  final GlobalKey projectsKey = GlobalKey(); // Key for projects section
  final GlobalKey footerKey = GlobalKey(); // Key for footer/contact section

  final ScrollController _scrollController = ScrollController();
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;
  bool _isScrollListenerAttached = false;

  PortfolioData? portfolioData;
  bool isLoading = true;

  int _selectedIndex = 0;

  double _displayExperience = 1.5;
  double _displayProjects = 3.0;
  double _displayBugs = 30.0;

  @override
  void initState() {
    super.initState();
    
    _loadPortfolioData();
    
    // Initialize glow animation controller
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Attach scroll listener after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isScrollListenerAttached) {
        _scrollController.addListener(_onScroll);
        _isScrollListenerAttached = true;
      }
    });
  }

  Future<void> _loadPortfolioData() async {
    try {
      final data = await PortfolioDataService.loadPortfolioData();
      setState(() {
        portfolioData = data;
        isLoading = false;
        // Set animation targets from JSON data
        _displayExperience = data.stats.experience.value.toDouble();
        _displayProjects = data.stats.projects.value.toDouble();
        _displayBugs = data.stats.features.value.toDouble();
      });
    } catch (e) {
      print('Error loading portfolio data: $e');
      // Even if there's an error, we should have fallback data
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    if (_isScrollListenerAttached) {
      _scrollController.removeListener(_onScroll);
    }
    _scrollController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Get the offset of each section
    final sectionKeys = [
      homeKey,
      aboutKey,
      skillsKey,
      experienceKey,
      projectsKey,
      footerKey,
    ];
    final contextList = sectionKeys.map((k) => k.currentContext).toList();
    final positions = contextList.map((ctx) {
      if (ctx == null) return null;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) return null;
      // Get the offset from the top of the scrollable
      final offset = box.localToGlobal(
        Offset.zero,
        ancestor: context.findRenderObject(),
      );
      return offset.dy;
    }).toList();

    // Find the section whose offset is closest to (but not greater than) 0
    int newIndex = 0;
    double minDiff = double.infinity;
    for (int i = 0; i < positions.length - 1; i++) {
      final pos = positions[i];
      if (pos == null) continue;
      final diff = pos.abs();
      if (pos <= 80 && diff < minDiff) {
        // 80 is header height
        minDiff = diff;
        newIndex = i;
      }
    }
    if (newIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
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
    if (isLoading || portfolioData == null) {
      return Scaffold(
        backgroundColor: Neutral.n50,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Primary.primary500),
          ),
        ),
      );
    }

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
            child: SingleChildScrollView(
              controller: _scrollController,
              child: _buildMainContent(screenWidth),
            ),
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
                      portfolioData!.personal.title,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: portfolioData!.personal.isOpenToWork 
                    ? _buildOpenToWorkIndicator() 
                    : SizedBox.shrink(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    ...portfolioData!.navigation.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _buildDrawerItem(
                          icon: _getIconForNavItem(entry.value.icon),
                          title: entry.value.label,
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
                onPressed: () => CommonUtils.downloadResume(context, portfolioData!.personal.resumeUrl),
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
                    Row(
                      children: [
                        Text(
                          portfolioData!.personal.name,
                          style: Paragraph02(color: Primary.primary700).semiBold,
                        ),
                        SizedBox(width: 12),
                        if (portfolioData!.personal.isOpenToWork)
                          _buildOpenToWorkIndicator(),
                      ],
                    ),
                    Text(
                      portfolioData!.personal.title,
                      style: Paragraph03(color: Neutral.n600).regular,
                    ),
                  ],
                ),
            ],
          ),
          if (isSmallScreen)
            Row(
              children: [
                if (portfolioData!.personal.isOpenToWork)
                  _buildOpenToWorkIndicator(),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.menu, color: Primary.primary700, size: 28),
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                ),
              ],
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
              itemBuilder: (context) => portfolioData!.navigation.asMap().entries.map((entry) {
                return PopupMenuItem<int>(
                  value: entry.key,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getIconForNavItem(entry.value.icon),
                          color: _selectedIndex == entry.key
                              ? Primary.primary600
                              : Neutral.n700,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            entry.value.label,
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
                  children: portfolioData!.navigation.asMap().entries.map((entry) {
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
                                  _getIconForNavItem(entry.value.icon),
                                  color: Primary.primary600,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                              ],
                              Text(
                                entry.value.label,
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
          onPressed: () => CommonUtils.downloadResume(context, portfolioData!.personal.resumeUrl),
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
      children: portfolioData!.socialLinks
          .map(
            (link) => InkWell(
              onTap: () => CommonUtils.launchUrlFunc(link.url),
              child: CommonUtils.getSvgIcon(link.icon, size: 24),
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
            onPressed: () => CommonUtils.downloadResume(context, portfolioData!.personal.resumeUrl),
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
          onPressed: () => CommonUtils.downloadResume(context, portfolioData!.personal.resumeUrl),
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

  IconData _getIconForNavItem(String iconName) {
    switch (iconName) {
      case 'home_outlined':
        return Icons.home_outlined;
      case 'person_outline_rounded':
        return Icons.person_outline_rounded;
      case 'work_outline_rounded':
        return Icons.work_outline_rounded;
      case 'code_outlined':
        return Icons.code_outlined;
      case 'timeline_outlined':
        return Icons.timeline_outlined;
      default:
        return Icons.circle_outlined;
    }
  }

  Widget _buildOpenToWorkIndicator() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.green.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(_glowAnimation.value * 0.4),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(_glowAnimation.value),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 6),
              Text(
                'Open to Work',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
