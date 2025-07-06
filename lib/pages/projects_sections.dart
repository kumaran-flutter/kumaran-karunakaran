import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/styles.dart';

class ProjectsSections extends StatefulWidget {
  const ProjectsSections({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<ProjectsSections> createState() => _ProjectsSectionsState();
}

class _ProjectsSectionsState extends State<ProjectsSections> {
  List projects = [
    {
      'title': 'planXcel',
      'description': [
        'A task management app that connects seamlessly with Google Sheets for live data sync.',
        'Ideal for teams needing lightweight collaboration with Google Workspace.',
        'Allows users to manage tasks, track progress, and collaborate in real-time.',
        'Features include task creation, assignment, and status updates.',
        'Utilizes Google Sheets API for live data updates and Firebase Auth for secure user authentication.',
        'Users can log in with their Google accounts, ensuring secure access.',
      ],
      "skills": [
        "Flutter",
        "Dart",
        "Google Apps Script",
        "Google Sheets API",
        "Firebase Auth",
        "OAuth",
      ],
      "url": "https://planxcel-489c0.web.app/index.html",
      'image': 'assets/project_one.png',
      "showButton": true,
    },
    {
      'title': 'Eventra',
      'description': [
        'An event check-in app that tracks attendance using QR codes and real-time database updates.',
        'A platform for organizing and managing events seamlessly.',
        'Integrates with Google Calendar for real-time scheduling.',
        'Offers features for ticketing, attendee management, and analytics.',
        'Attendees scan QR codes to mark attendance during meetups.',
        'Stored event and user data using Firestore for instant updates.',
      ],
      "skills": ["Flutter", "Dart", "Firebase Firestore", "QR Code Scanning"],
      'image': 'assets/project_two.png',
      "showButton": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 1500),
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 16.0 : 32.0,
        vertical: widget.isMobile ? 24.0 : 48.0,
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          _buildSectionHeader(),
          SizedBox(height: widget.isMobile ? 32 : 48),

          // Projects Layout
          _buildProjectsLayout(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: widget.isMobile
              ? HeadingH4(color: Neutral.n800).semiBold
              : HeadingH3(color: Neutral.n800).semiBold,
        ),
        const SizedBox(height: 12),
        Container(
          height: 3,
          width: widget.isMobile ? 40 : 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Primary.primary400, Primary.primary600],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Here are some of the projects I have worked on, showcasing my skills in Flutter development and UI/UX design.',
          style: Paragraph02(color: Neutral.n600).regular,
        ),
      ],
    );
  }

  Widget _buildProjectsLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = widget.isMobile ? constraints.maxWidth : 400;
        // Always use horizontal scroll for projects
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: projects
                .map(
                  (project) => Container(
                    width: cardWidth,
                    margin: const EdgeInsets.only(right: 24),
                    child: _ProjectCard(project: project),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;
  bool _showAllDescriptions = false;

  @override
  Widget build(BuildContext context) {
    final isFeatured = widget.project['showButton'] == true;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        margin: const EdgeInsets.all(12),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0.0, -4.0)..scale(1.015))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: _isHovered ? Primary.primary200 : Neutral.n100,
            width: 1.1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: icon, title, badge
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 16, top: 24, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Primary.primary50, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Primary.primary200, width: 1.1),
                    ),
                    child: Center(
                      child: Icon(
                        widget.project['title'] == 'planXcel'
                            ? Icons.task_alt_rounded
                            : Icons.qr_code_scanner_rounded,
                        size: 18,
                        color: Primary.primary600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.project['title'],
                      style: HeadingH5(color: Primary.primary800).semiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isFeatured)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Primary.primary100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Featured',
                        style: TextStyle(
                          color: Primary.primary600,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildProjectImage(),
            _buildProjectContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Primary.primary50, Colors.white],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildProjectContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description Points with Show More
          _buildDescriptionSection(),

          const SizedBox(height: 20),

          // Skills/Technologies
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (widget.project['skills'] as List)
                .map((skill) => _buildSkillChip(skill))
                .toList(),
          ),
          const SizedBox(height: 24),

          // Action Button
          if (widget.project['showButton'] ?? true)
            _buildActionButton(
              onPressed: () {
                launchUrl(Uri.parse(widget.project['url']));
              },
            )
          else
            SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    List<String> descriptions = List<String>.from(
      widget.project['description'],
    );
    int halfLength = (descriptions.length / 2).ceil();
    List<String> visibleDescriptions = _showAllDescriptions
        ? descriptions
        : descriptions.take(1).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description Points
        ...visibleDescriptions.map<Widget>(
          (description) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6, right: 8),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Primary.primary600,
                    shape: BoxShape.circle,
                  ),
                ),
                // Fix: Replaced Expanded with Flexible to work properly within the Row
                Flexible(
                  child: Text(
                    description,
                    style: Paragraph02(color: Neutral.n700).regular,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Show More/Less Button
        if (descriptions.length > halfLength)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _showAllDescriptions = !_showAllDescriptions;
                });
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: Icon(
                _showAllDescriptions
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                size: 18,
                color: Primary.primary600,
              ),
              label: Text(
                _showAllDescriptions ? 'Show Less' : 'Show More',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Primary.primary600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _isHovered ? Primary.primary100 : Neutral.n50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isHovered ? Primary.primary300 : Neutral.n200,
          width: 1,
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _isHovered ? Primary.primary700 : Neutral.n600,
        ),
      ),
    );
  }

  Widget _buildActionButton({void Function()? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: _isHovered ? Primary.primary600 : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: _isHovered ? Primary.primary600 : Primary.primary300,
              width: 1,
            ),
          ),
          fixedSize: const Size(150, 48),
        ),
        iconAlignment: IconAlignment.end,
        icon: Icon(
          Icons.arrow_forward_rounded,
          size: 18,
          color: _isHovered ? Colors.white : Primary.primary600,
        ),
        label: Text(
          'View Project',
          style: Paragraph02(
            color: _isHovered ? Colors.white : Primary.primary600,
          ).semiBold,
        ),
      ),
    );
  }
}
