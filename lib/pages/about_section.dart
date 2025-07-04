import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';
import 'package:lottie/lottie.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({
    super.key,
    required this.isSmallScreen,
    required double displayExperience,
    required double displayProjects,
    required double displayBugs,
  }) : _displayExperience = displayExperience,
       _displayProjects = displayProjects,
       _displayBugs = displayBugs;
  final bool isSmallScreen;
  final double _displayExperience;
  final double _displayProjects;
  final double _displayBugs;

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isWide = screenWidth >= 600; // Breakpoint for switching layout

    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 1500),
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!widget.isSmallScreen)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Lottie.asset(
                        'assets/lottie.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                Expanded(child: _buildTextContent()),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Lottie.asset(
                    'assets/lottie.json',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextContent(),
              ],
            ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: 'About ',
            style: HeadingH1(color: Neutral.n700).semiBold,
            children: [
              TextSpan(
                text: 'Me',
                style: HeadingH1(color: Primary.primary500).semiBold,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          """Hi, I'm Kumaran Karunakaran — a Mobile App Developer who enjoys building real-world solutions with Flutter, Firebase, and a strong dose of clean code. With nearly 3 years of experience, I've worked across logistics and WMS domains, turning complex workflows into simple, user-friendly apps published on both Play Store and App Store.

Outside of work, I help run Namma Flutter Chennai, a growing community of developers who love Flutter as much as I do (well, almost). I enjoy architecting apps, debugging mysterious issues, and occasionally pushing perfect commits on the first try (rare but satisfying). I'm always up for collaborating on meaningful apps or sharing what I know with the dev community.""",
          style: Paragraph02(color: Neutral.n700).regular,
        ),
        const SizedBox(height: 20),
        _buildCountersSection(MediaQuery.of(context).size.width),
      ],
    );
  }

  List<Widget> _buildCounters() {
    return [
      _buildCounter(
        value: widget._displayExperience,
        label: 'Experience',
        duration: Duration(seconds: 2),
      ),
      _buildCounter(
        value: widget._displayProjects,
        label: 'Projects',
        duration: Duration(seconds: 3),
      ),
      _buildCounter(
        value: widget._displayBugs,
        label: 'Feature`s Developed',
        duration: Duration(seconds: 4),
      ),
    ];
  }

  Widget _buildCounter({
    required double value,
    required String label,
    required Duration duration,
  }) {
    // Use a Container instead of Expanded for more flexibility
    // This allows it to be used in both Row and Wrap layouts
    return SizedBox(
      width: 150, // Fixed width to ensure consistency across layouts
      child: Column(
        crossAxisAlignment: widget.isSmallScreen
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          AnimatedFlipCounter(
            thousandSeparator: ',',
            value: value,
            duration: duration,
            curve: Curves.easeOut,
            textStyle: HeadingH1(color: Primary.primary500).extraBold,
            suffix: '+',
          ),
          Text(
            label,
            style: Paragraph02(color: Neutral.n700).regular,
            overflow: TextOverflow.clip,
            textAlign: widget.isSmallScreen
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildCountersSection(double screenWidth) {
    final counters = _buildCounters();

    // Dynamic counter layout based on screen size
    if (widget.isSmallScreen) {
      // Stack vertically on small screens
      return Column(
        children: counters
            .map(
              (counter) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: counter,
              ),
            )
            .toList(),
      );
    } else if (screenWidth < 1200) {
      // Use 2x2 grid on medium screens if needed
      return _buildCountersGrid(counters);
    } else {
      // Use row layout on large screens
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: counters,
      );
    }
  }

  Widget _buildCountersGrid(List<Widget> counters) {
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceEvenly,
      children: counters,
    );
  }
}
