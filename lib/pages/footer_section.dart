import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/utils/common_utils.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';

class PortfolioFooter extends StatefulWidget {
  const PortfolioFooter({super.key});

  @override
  State<PortfolioFooter> createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _glowController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _glowAnimation;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _glowController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_emailController.text.trim().isNotEmpty &&
        _notesController.text.trim().isNotEmpty) {
      final subject = Uri.encodeComponent(
        'Portfolio Contact - ${_emailController.text}',
      );
      final body = Uri.encodeComponent(
        'From: ${_emailController.text}\n\nMessage:\n${_notesController.text.trim()}',
      );
      CommonUtils.launchUrlFunc(
        'mailto:kumaransk1608@gmail.com?subject=$subject&body=$body',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.send_rounded, color: Colors.white),
              SizedBox(width: 8),
              Text('Opening email client...'),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      _emailController.clear();
      _notesController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in both email and message fields'),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
              Color(0xFF533483),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Column(
          children: [
            // Animated top border
            Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xFF00d4ff),
                    Color(0xFF9d4edd),
                    Color(0xFFff006e),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                constraints: BoxConstraints(maxWidth: 1300),
                child: Column(
                  children: [
                    // Open to work indicator
                    _buildOpenToWorkIndicator(),

                    SizedBox(height: 25),

                    // Main content area - Contact details left, Quick message right
                    _buildMainContent(),

                    SizedBox(height: 25),

                    _buildFindMeSection(),

                    SizedBox(height: 30),

                    // Divider
                    _buildGlowDivider(),

                    SizedBox(height: 20),

                    // Copyright
                    _buildCopyright(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenToWorkIndicator() {
    return Center(
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.green.withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(_glowAnimation.value * 0.6),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(_glowAnimation.value),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Open to Work',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        if (isMobile) {
          return Column(
            children: [
              _buildContactSection(),
              SizedBox(height: 20),
              _buildServicesAndResumeSection(),
              SizedBox(height: 30),
              _buildRightColumn(),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildContactSection()),
              SizedBox(width: 40),
              Expanded(flex: 3, child: _buildRightColumn()),
              SizedBox(width: 40),
              Expanded(flex: 2, child: _buildServicesAndResumeSection()),
            ],
          );
        }
      },
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF00d4ff), Color(0xFF9d4edd)],
            ).createShader(bounds),
            child: Text(
              'Contact Details',
              style: HeadingH6(color: Shades.s0).semiBold,
            ),
          ),

          SizedBox(height: 20),

          _buildContactItem(
            Icons.email_rounded,
            'kumaransk1608@gmail.com',
            () => CommonUtils.launchUrlFunc('mailto:kumaransk1608@gmail.com'),
          ),

          SizedBox(height: 12),

          _buildContactItem(
            Icons.phone_android_rounded,
            '+91 8300833451',
            () => CommonUtils.launchUrlFunc('tel:+918300833451'),
          ),

          SizedBox(height: 12),

          _buildContactItem(
            Icons.location_on_rounded,
            'Chennai, Tamil Nadu, India',
            null,
          ),

          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => CommonUtils.downloadResume(context),
                  label: Text('Download CV'),
                  icon: Icon(Icons.download_rounded),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00d4ff),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    textStyle: Paragraph02(color: Shades.s0).semiBold,
                    fixedSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00d4ff), Color(0xFF9d4edd)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(text, style: Paragraph03(color: Shades.s0).regular),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightColumn() {
    return _buildContactForm();
  }

  Widget _buildContactForm() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF00d4ff).withOpacity(0.1),
            Color(0xFF9d4edd).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.chat_bubble_outline_rounded,
                color: Color(0xFF00d4ff),
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Quick Message',
                style: HeadingH6(color: Shades.s0).semiBold,
              ),
            ],
          ),

          SizedBox(height: 20),

          // Email field
          _buildEmailField(),

          SizedBox(height: 16),

          // Message field
          _buildMessageField(),

          SizedBox(height: 16),

          // Send button
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Your email',
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(Icons.email_outlined, color: Colors.white54, size: 18),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF00d4ff), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildMessageField() {
    return TextField(
      controller: _notesController,
      maxLines: 4,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Your message...',
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF00d4ff), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildSendButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,

      child: ElevatedButton.icon(
        iconAlignment: IconAlignment.end,

        onPressed: _sendMessage,
        icon: Icon(Icons.send_rounded, size: 18),

        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Send Message',
            style: Paragraph02(color: Shades.s0).semiBold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00d4ff),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
        ),
      ),
    );
  }

  Widget _buildFindMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Find Me On', style: HeadingH6(color: Shades.s0).semiBold),
        SizedBox(height: 16),
        _buildSocialLinksRow(),
      ],
    );
  }

  Widget _buildSocialLinksRow() {
    final socialData = [
      {
        'icon': AppIcons.icons8LinkedIn,
        'url': 'https://www.linkedin.com/in/kumarankarunakaran/',
        'name': 'LinkedIn',
      },
      {
        'icon': AppIcons.icons8Medium,
        'url': 'https://medium.com/@skkumaran',
        'name': 'Medium',
      },
      {
        'icon': AppIcons.icons8InstagramLogo,
        'url': 'https://www.linkedin.com/in/kumarankarunakaran/',
        'name': 'Instagram',
      },
      {
        'icon': AppIcons.icons8GithubCopy,
        'url': 'https://github.com/kumaran-flutter',
        'name': 'GitHub',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialData.map((social) {
        return _buildSocialButton(
          social['icon'] as String,
          social['url'] as String,
          social['name'] as String,
        );
      }).toList(),
    );
  }

  Widget _buildSocialButton(String icon, String url, String name) {
    return Tooltip(
      message: name,
      child: InkWell(
        onTap: () => CommonUtils.launchUrlFunc(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(8),
          child: CommonUtils.getSvgIcon(icon, size: 46),
        ),
      ),
    );
  }

  Widget _buildServicesAndResumeSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        if (isMobile) {
          return Column(children: [_buildServicesSection()]);
        } else {
          return Row(
            children: [Expanded(flex: 2, child: _buildServicesSection())],
          );
        }
      },
    );
  }

  Widget _buildServicesSection() {
    final services = [
      {
        'icon': Icons.phone_android_rounded,
        'title': 'Mobile App Development',
        'desc': 'Flutter & React Native',
      },
      {
        'icon': Icons.web_rounded,
        'title': 'Web Development',
        'desc': 'Responsive & Modern',
      },
      {
        'icon': Icons.design_services_rounded,
        'title': 'UI/UX Design',
        'desc': 'User-Centered Design',
      },
      {
        'icon': Icons.cloud_rounded,
        'title': 'Backend Services',
        'desc': 'Firebase & Node.js',
      },
    ];

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withAlpha(20), Colors.white.withAlpha(10)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(20), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF00d4ff), Color(0xFF9d4edd)],
            ).createShader(bounds),
            child: Text(
              'Services',
              style: HeadingH5(color: Shades.s0).semiBold,
            ),
          ),

          SizedBox(height: 20),

          ...services.map(
            (service) => _buildServiceItem(
              service['icon'] as IconData,
              service['title'] as String,
              service['desc'] as String,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00d4ff), Color(0xFF9d4edd)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Shades.s0, size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Paragraph02(color: Shades.s0).semiBold),
                Text(description, style: Caption(color: Neutral.n400).regular),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildResumeButton() {
  //   return Container(
  //     padding: EdgeInsets.all(24),
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [
  //           Color(0xFF9d4edd).withOpacity(0.1),
  //           Color(0xFF00d4ff).withOpacity(0.1),
  //         ],
  //       ),
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
  //     ),
  //     child: Column(
  //       children: [
  //         Icon(Icons.description_rounded, color: Color(0xFF00d4ff), size: 48),
  //         SizedBox(height: 16),
  //         Text(
  //           'Download Resume',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 8),
  //         Text(
  //           'Get my latest CV',
  //           style: TextStyle(color: Colors.white70, fontSize: 14),
  //         ),
  //         SizedBox(height: 20),
  //         SizedBox(
  //           width: double.infinity,
  //           child: ElevatedButton.icon(
  //             onPressed: _downloadResume,
  //             icon: Icon(Icons.download_rounded, size: 18),
  //             label: Text(
  //               'Download CV',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  //             ),
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Color(0xFF9d4edd),
  //               foregroundColor: Colors.white,
  //               padding: EdgeInsets.symmetric(vertical: 14),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               elevation: 6,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCoffeeButton() {
  //   return Container(
  //     constraints: BoxConstraints(maxWidth: 200),
  //     child: ElevatedButton.icon(
  //       onPressed: () => _launchUrl('https://buymeacoffee.com/kumarank'),
  //       icon: Text('☕', style: TextStyle(fontSize: 16)),
  //       label: Text(
  //         'Buy me a coffee',
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Color(0xFFff006e),
  //         foregroundColor: Colors.white,
  //         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         elevation: 6,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildGlowDivider() {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Color(0xFF00d4ff).withAlpha(128),
            Color(0xFF9d4edd).withAlpha(128),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildCopyright() {
    return Column(
      children: [
        Text(
          '© 2025 Kumaran K. All rights reserved.',
          style: Caption(color: Neutral.n400).regular,
        ),
        SizedBox(height: 4),
        Text(
          'Proudly built in Flutter',
          style: Caption(color: Neutral.n400).regular,
        ),
      ],
    );
  }
}
