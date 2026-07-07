import 'package:flutter/material.dart';

import '../widgets/timeline_bubble.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _timelineData = [
    {
      'title': 'Personal Background',
      'body':
          'Hello! I am Kaoutar Ben Hettouch, a mobile application developer with a strong passion for mobile technologies. I graduated in 2026 with a Specialized Technician degree in Digital Development (Mobile Applications) from the Cité des Métiers et des Compétences (CMC), Agadir.'
    },
    {
      'title': 'Technical Foundation',
      'body':
          'I have built a solid foundation in Android development using Kotlin as well as cross-platform development with Flutter. Throughout my training, I completed several practical projects that strengthened my analytical thinking, attention to detail, and ability to work independently.'
    },
    {
      'title': 'Professional Profile',
      'body':
          'I am a motivated and dedicated developer who is eager to strengthen my technical skills through real-world projects. I am curious, adaptable, and enjoy working in collaborative environments. I quickly adapt to new challenges and am ready to contribute effectively to software development teams.'
    },
    {
      'title': 'Education & Training',
      'body':
          '• 2026: Specialized Technician Degree in Digital Development (Mobile Applications), Cité des Métiers et des Compétences (CMC), Agadir.\n• 2024: Physics Baccalaureate with Honors.'
    },
    {
      'title': 'Interests & Hobbies',
      'body':
          'In my free time, I enjoy activities that help me relax and stay inspired, such as reading novels—especially fantasy literature—and watching movies.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = constraints.maxWidth < 850;
      final double hPad = isMobile ? 24 : (constraints.maxWidth < 1200 ? 60 : 100);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
        child: Column(
          children: [
            buildSectionHeader("Who Am I?"),
            Stack(
              alignment: Alignment.center,
              children: [
                // Centered glowing vertical line
                Positioned(
                  left: isMobile ? 24 : null,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 4,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x0000FFCC),
                          Color(0xFF00FFCC),
                          Color(0xFF00FFCC),
                          Color(0x0000FFCC)
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00FFCC).withValues(alpha: 0.5),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ),

                // Timeline cards
                Column(
                  children: List.generate(_timelineData.length, (index) {
                    final item = _timelineData[index];
                    final isLeft = index % 2 == 0;

                    if (isMobile) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 45, bottom: 30),
                        child: TimelineBubble(
                          title: item['title']!,
                          body: item['body']!,
                          isLeft: false,
                          showDotOnLeft: true,
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: isLeft
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: TimelineBubble(
                                      title: item['title']!,
                                      body: item['body']!,
                                      isLeft: true,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF030014),
                                border: Border.all(
                                    color: const Color(0xFF00FFCC), width: 4),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xFF00FFCC), blurRadius: 8),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: !isLeft
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: TimelineBubble(
                                      title: item['title']!,
                                      body: item['body']!,
                                      isLeft: false,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
