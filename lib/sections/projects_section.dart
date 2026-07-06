import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/hover_widget.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // ── Project Data ─────────────────────────────────────────────────────────────
  static const _projects = [
    {
      'title': 'CalculateIce',
      'emoji': '🧊',
      'desc':
          'An intelligent ice calculation app that helps businesses and users determine the exact quantity of ice needed based on various parameters. Streamlines ordering and reduces waste.',
      'tag': 'Flutter',
      'color': 0xFF00D2FF,
      'tech': ['Flutter', 'Dart', 'Material 3'],
      'apk': '',
      'web': '',
      'status': 'coming_soon',
    },
    {
      'title': 'CourtKeeper (Tennis)',
      'emoji': '🎾',
      'desc':
          'An intelligent Android app dedicated to automatic tennis score management, strictly respecting official rules: Points, Games, Sets, Deuce, Advantage, and Tie-break. Saves full match history.',
      'tag': 'Kotlin',
      'color': 0xFF4CAF50,
      'tech': ['Kotlin', 'SharedPreferences', 'RecyclerView', 'Gson'],
      'apk': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Touristique Agadir',
      'emoji': '🏖️',
      'desc':
          'A tourism app for visitors to Agadir, Morocco. Features interactive maps, local attraction guides, ratings, category filtering, and offline-ready content for an immersive travel experience.',
      'tag': 'Kotlin',
      'color': 0xFFFF9800,
      'tech': ['Kotlin', 'Google Maps', 'Firebase', 'Material 3'],
      'apk': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Academic Platform',
      'emoji': '🎓',
      'desc':
          'A responsive academic management web platform for students and professors. Includes course scheduling, grade tracking, announcements, and a clean dashboard interface.',
      'tag': 'Web',
      'color': 0xFF9C27B0,
      'tech': ['HTML', 'CSS', 'JavaScript', 'PHP'],
      'apk': '',
      'web': 'https://github.com/BEN-KAOUTAR',
      'status': 'done',
    },
    {
      'title': 'iKenas',
      'emoji': '🏠',
      'desc':
          'A smart home services app connecting users with professional cleaning and household service providers. Features booking, real-time availability, and service history tracking.',
      'tag': 'Flutter',
      'color': 0xFFE91E63,
      'tech': ['Flutter', 'Dart', 'Firebase', 'Provider'],
      'apk': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Amannet (PFE)',
      'emoji': '🔐',
      'desc':
          'End-of-study project — A comprehensive trust and security platform. Implements advanced authentication, role-based access control, and secure data management for enterprise use.',
      'tag': 'Flutter',
      'color': 0xFF00FFCC,
      'tech': ['Flutter', 'Dart', 'Firebase', 'Kotlin', 'REST API'],
      'apk': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double w = constraints.maxWidth;
      final bool isMobile = w < 850;
      final double hPad = isMobile ? 24 : (w < 1200 ? 60 : 100);
      final int cols = w < 650 ? 1 : (w < 1050 ? 2 : 3);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
        child: Column(
          children: [
            buildSectionHeader("My Projects"),
            const SizedBox(height: 50),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 28,
                mainAxisSpacing: 28,
                mainAxisExtent: 460,
              ),
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                final accentColor = Color(project['color'] as int);
                final isComingSoon = project['status'] == 'coming_soon';

                return HoverWidget(
                  builder: (isHovered) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0A24).withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isHovered
                              ? accentColor
                              : accentColor.withValues(alpha: 0.25),
                          width: isHovered ? 1.5 : 1,
                        ),
                        boxShadow: isHovered
                            ? [
                                BoxShadow(
                                  color: accentColor.withValues(alpha: 0.25),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Banner ──────────────────────────────────────
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 145,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  accentColor.withValues(alpha: isHovered ? 0.25 : 0.1),
                                  accentColor.withValues(alpha: isHovered ? 0.05 : 0.02),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: AnimatedScale(
                                    scale: isHovered ? 1.15 : 1.0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack,
                                    child: Text(
                                      project['emoji'] as String,
                                      style: const TextStyle(fontSize: 60),
                                    ),
                                  ),
                                ),
                                // Tag badge
                                Positioned(
                                  top: 14,
                                  right: 14,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: accentColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: accentColor, width: 1),
                                    ),
                                    child: Text(
                                      project['tag'] as String,
                                      style: TextStyle(
                                        color: accentColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Coming Soon badge
                                if (isComingSoon)
                                  Positioned(
                                    top: 14,
                                    left: 14,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.orange, width: 1),
                                      ),
                                      child: const Text(
                                        'Coming Soon',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // ── Content ──────────────────────────────────────
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      project['desc'] as String,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 12.5,
                                          height: 1.6),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Tech chips
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children:
                                        (project['tech'] as List<String>)
                                            .map((tech) => Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: accentColor.withValues(alpha: 0.08),
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                    border: Border.all(
                                                        color: accentColor.withValues(alpha: 0.3)),
                                                  ),
                                                  child: Text(tech,
                                                      style: TextStyle(
                                                          color: accentColor.withValues(alpha: 0.8),
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600)),
                                                ))
                                            .toList(),
                                  ),
                                  const SizedBox(height: 14),
                                  // ── Action buttons ──────────────────────
                                  Row(
                                    children: [
                                      if (!isComingSoon && (project['apk'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: FontAwesomeIcons.googlePlay,
                                          label: 'APK',
                                          url: project['apk'] as String,
                                          color: accentColor,
                                        ),
                                      if (!isComingSoon && (project['apk'] as String).isNotEmpty)
                                        const SizedBox(width: 10),
                                      if (!isComingSoon && (project['web'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: Icons.language,
                                          label: 'Live',
                                          url: project['web'] as String,
                                          color: accentColor,
                                          isFa: false,
                                        ),
                                      if (!isComingSoon)
                                        _buildLinkBtn(
                                          icon: FontAwesomeIcons.github,
                                          label: 'GitHub',
                                          url: 'https://github.com/BEN-KAOUTAR',
                                          color: accentColor,
                                        ),
                                      if (isComingSoon)
                                        Text(
                                          'In development...',
                                          style: TextStyle(
                                            color: Colors.orange.withValues(alpha: 0.7),
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLinkBtn({
    required dynamic icon,
    required String label,
    required String url,
    required Color color,
    bool isFa = true,
  }) {
    return HoverWidget(
      builder: (isHovered) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(url)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isHovered ? color.withValues(alpha: 0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isHovered ? color : color.withValues(alpha: 0.4),
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 10,
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isFa
                    ? FaIcon(icon, size: 11, color: color)
                    : Icon(icon as IconData, size: 13, color: color),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
