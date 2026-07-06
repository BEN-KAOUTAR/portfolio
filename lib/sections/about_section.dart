import 'package:flutter/material.dart';

import '../widgets/timeline_bubble.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _timelineData = [
    {
      'title': 'Personal Background',
      'body':
          'Hello! I am Kaoutar Ben Hettouch, a passionate digital developer and I am 20 years old. I study at CMC Agadir, where I pursue my education in digital development, specializing in Mobile Application design.'
    },
    {
      'title': 'Interests & Hobbies',
      'body':
          'In my free time, I engage in a variety of hobbies that recharge my energy, such as reading novels, especially fantasy novels, which I am passionate about, in addition to watching movies.'
    },
    {
      'title': 'Future Aims',
      'body':
          'I am excited about the future of web and mobile development and look forward to applying my skills in real-world projects. As I continue my education at CMC Agadir, I am eager to collaborate, learn from others, and grow to become a leading digital developer.'
    },
    {
      'title': 'Education & Training',
      'body':
          'Currently pursuing a Specialized Technician degree in Digital Development (Mobile Apps) at Cité des Métiers et des Compétences, Agadir (2024-2026). Previously earned a Physics Baccalaureate with Honors in 2024.'
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
