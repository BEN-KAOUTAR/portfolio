import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/hover_widget.dart';
import 'widgets/stars_background.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const MyApp());
}

// ─── App Root ─────────────────────────────────────────────────────────────────
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaoutar Ben-Hettouch | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF030014),
        primaryColor: const Color(0xFF00FFCC),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FFCC),
          secondary: Color(0xFF00D2FF),
          surface: Color(0xFF0D0A24),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

// ─── Portfolio Home Page ──────────────────────────────────────────────────────
class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Section keys for scroll-to navigation
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ── Detect active section on scroll ─────────────────────────────────────────
  void _onScroll() {
    double scrollOffset = _scrollController.offset;

    double getOffset(GlobalKey key) {
      final RenderBox? rb =
          key.currentContext?.findRenderObject() as RenderBox?;
      return rb != null
          ? rb.localToGlobal(Offset.zero).dy + scrollOffset
          : 0.0;
    }

    double homeOffset = getOffset(_homeKey);
    double aboutOffset = getOffset(_aboutKey);
    double skillsOffset = getOffset(_skillsKey);
    double projectsOffset = getOffset(_projectsKey);
    double contactOffset = getOffset(_contactKey);

    String currentSection = 'Home';
    if (scrollOffset >= contactOffset - 200) {
      currentSection = 'Contact';
    } else if (scrollOffset >= projectsOffset - 200) {
      currentSection = 'Projects';
    } else if (scrollOffset >= skillsOffset - 200) {
      currentSection = 'Skills';
    } else if (scrollOffset >= aboutOffset - 200) {
      currentSection = 'About Me';
    } else if (scrollOffset >= homeOffset - 200) {
      currentSection = 'Home';
    }

    if (currentSection != _activeSection) {
      setState(() => _activeSection = currentSection);
    }
  }

  void _scrollToSection(GlobalKey key) {
    final RenderBox? rb =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (rb != null) {
      final double offset =
          rb.localToGlobal(Offset.zero).dy + _scrollController.offset - 80;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // ── Build ────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 850;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF030014),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: Stack(
        children: [
          // 1 – Starry background (fixed behind everything)
          const Positioned.fill(child: TwinklingStarsBackground()),

          // 2 – Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Home
                SizedBox(key: _homeKey, child: const HomeSection()),

                // About
                Container(
                  key: _aboutKey,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00030014),
                        Color(0x220D0A24),
                        Color(0x00030014),
                      ],
                    ),
                  ),
                  child: const AboutSection(),
                ),

                // Skills
                SizedBox(key: _skillsKey, child: const SkillsSection()),

                // Projects
                Container(
                  key: _projectsKey,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00030014),
                        Color(0x220D0A24),
                        Color(0x00030014),
                      ],
                    ),
                  ),
                  child: const ProjectsSection(),
                ),

                // Contact
                SizedBox(key: _contactKey, child: const ContactSection()),

                // Footer
                _buildFooter(),
              ],
            ),
          ),

          // 3 – Fixed top navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildNavBar(context, isMobile),
          ),
        ],
      ),
    );
  }

  // ── Navigation Bar ───────────────────────────────────────────────────────────
  Widget _buildNavBar(BuildContext context, bool isMobile) {
    return Container(
      height: isMobile ? 80 : 100,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      decoration: BoxDecoration(
        color: const Color(0xFF030014).withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(color: Color(0x1A00FFCC)),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00FFCC).withValues(alpha: 0.05),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          // Logo
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF00FFCC).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00FFCC), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00FFCC).withValues(alpha: 0.5),
                      blurRadius: 12,
                      spreadRadius: 2,
                    )
                  ]
                ),
                child: const Text(
                  'B',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFCC),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'E N',
                style: TextStyle(
                  fontSize: isMobile ? 22 : 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: const Color(0xFF00FFCC).withValues(alpha: 0.3),
                      blurRadius: 10,
                    )
                  ]
                ),
              ),
            ],
          ),
          const Spacer(),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF00FFCC)),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            )
          else
            Row(
              children: [
                _buildNavLink('Home', _homeKey, isMobile),
                _buildNavLink('About Me', _aboutKey, isMobile),
                _buildNavLink('Skills', _skillsKey, isMobile),
                _buildNavLink('Projects', _projectsKey, isMobile),
                _buildNavLink('Contact', _contactKey, isMobile),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNavLink(String label, GlobalKey key, bool isMobile) {
    final bool isActive = _activeSection == label;
    return HoverWidget(
      builder: (isHovered) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _scrollToSection(key),
            child: AnimatedScale(
              scale: isHovered ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 8),
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 20, vertical: 8),
                decoration: BoxDecoration(
                  color: isHovered 
                      ? const Color(0xFF00FFCC).withValues(alpha: 0.15) 
                      : Colors.transparent,
                  borderRadius: isHovered ? BorderRadius.circular(20) : BorderRadius.circular(0),
                  border: isHovered 
                      ? Border.all(
                          color: const Color(0xFF00FFCC).withValues(alpha: 0.5), 
                          width: 1,
                        ) 
                      : Border(
                          bottom: BorderSide(
                            color: isActive ? const Color(0xFF00FFCC) : Colors.transparent,
                            width: 2,
                          ),
                        ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00FFCC).withValues(alpha: 0.3),
                            blurRadius: 10,
                            spreadRadius: 1,
                          )
                        ]
                      : [],
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: (isActive || isHovered)
                        ? const Color(0xFF00FFCC)
                        : Colors.white70,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ── Mobile Drawer ────────────────────────────────────────────────────────────
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF030014),
      child: Container(
        decoration: BoxDecoration(
          border: const Border(
            left: BorderSide(color: Color(0x3300FFCC), width: 1),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF030014),
              const Color(0xFF0D0A24).withValues(alpha: 0.8),
              const Color(0xFF030014),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drawer Header / Brand
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00FFCC).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF00FFCC), width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FFCC).withValues(alpha: 0.3),
                                blurRadius: 10,
                              )
                            ]
                          ),
                          child: const Text(
                            'B',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00FFCC),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'B E N',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(color: Color(0x1F00FFCC), height: 1),
              ),
              const SizedBox(height: 20),
              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildDrawerItem('Home', Icons.home_outlined, 'Home', () {
                      Navigator.pop(context);
                      _scrollToSection(_homeKey);
                    }),
                    _buildDrawerItem('About Me', Icons.person_outline, 'About Me', () {
                      Navigator.pop(context);
                      _scrollToSection(_aboutKey);
                    }),
                    _buildDrawerItem('Skills', Icons.psychology_outlined, 'Skills', () {
                      Navigator.pop(context);
                      _scrollToSection(_skillsKey);
                    }),
                    _buildDrawerItem('Projects', Icons.palette_outlined, 'Projects', () {
                      Navigator.pop(context);
                      _scrollToSection(_projectsKey);
                    }),
                    _buildDrawerItem('Contact', Icons.mail_outline, 'Contact', () {
                      Navigator.pop(context);
                      _scrollToSection(_contactKey);
                    }),
                  ],
                ),
              ),
              // Social & bottom info
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Kaoutar Ben Hettouch',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Digital Developer Portfolio',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: const Color(0xFF00FFCC).withValues(alpha: 0.8), fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, String sectionName, VoidCallback onTap) {
    final bool isActive = _activeSection == sectionName;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: HoverWidget(
        builder: (isHovered) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF00FFCC).withValues(alpha: 0.15)
                  : isHovered
                      ? const Color(0xFF00FFCC).withValues(alpha: 0.05)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive
                    ? const Color(0xFF00FFCC)
                    : isHovered
                        ? const Color(0xFF00FFCC).withValues(alpha: 0.3)
                        : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: const Color(0xFF00FFCC).withValues(alpha: 0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ]
                  : [],
            ),
            child: ListTile(
              leading: Icon(
                icon,
                color: isActive ? const Color(0xFF00FFCC) : Colors.white70,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: isActive ? const Color(0xFF00FFCC) : Colors.white,
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: isActive ? const Color(0xFF00FFCC) : Colors.white30,
              ),
              onTap: onTap,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Footer ───────────────────────────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF030014),
        border: Border(top: BorderSide(color: Color(0x1F00FFCC))),
      ),
      child: const Center(
        child: Text(
          'Copyright © B E N | Portfolio Kaoutar Ben Hettouch. All Rights Reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white38, fontSize: 13),
        ),
      ),
    );
  }
}
