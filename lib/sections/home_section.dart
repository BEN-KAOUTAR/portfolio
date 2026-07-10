import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/hover_widget.dart';

// ─── Hero Profile Image ───────────────────────────────────────────────────────
class HeroProfileImage extends StatelessWidget {
  final double size;
  const HeroProfileImage({super.key, this.size = 300});

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (isHovered) {
        return AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF00FFCC), Color(0xFF00D2FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00FFCC).withValues(alpha: isHovered ? 0.8 : 0.4),
                    blurRadius: isHovered ? 60 : 40,
                    spreadRadius: isHovered ? 10 : 5,
                  )
                ],
              ),
              padding: const EdgeInsets.all(6),
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.jpeg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.0, -0.3),
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF0D0A24),
                      child: const Icon(Icons.person, size: 100, color: Color(0xFF00FFCC)),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Social Icon Button ───────────────────────────────────────────────────────
Widget buildSocialIcon(dynamic icon, String tooltip, String url) {
  return HoverWidget(
    builder: (isHovered) {
      return Tooltip(
        message: tooltip,
        preferBelow: false,
        verticalOffset: 35,
        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF030014),
          border: Border.all(color: const Color(0xFF00FFCC)),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(url)),
            child: AnimatedScale(
              scale: isHovered ? 1.25 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHovered ? const Color(0xFF00FFCC) : Colors.transparent,
                  border: Border.all(color: const Color(0xFF00FFCC), width: 2),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00FFCC).withValues(alpha: 0.6),
                            blurRadius: 15,
                          )
                        ]
                      : null,
                ),
                child: Center(
                  child: FaIcon(
                    icon,
                    color: isHovered ? const Color(0xFF030014) : const Color(0xFF00FFCC),
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

// ─── Home Section ─────────────────────────────────────────────────────────────
class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double w = constraints.maxWidth;
        final bool mobile = w < 850;
        final double titleSize =
            mobile ? (w < 400 ? 30 : 36) : (w < 1100 ? 45 : (w < 1500 ? 65 : 80));
        final double subSize = mobile ? 15.0 : (w < 1100 ? 18.0 : 22.0);
        final double hPad = mobile ? 24 : (w < 1200 ? 60 : 100);
        final double imgSize = mobile ? 280.0 : (w < 1100 ? 350.0 : 450.0);

        final content = Column(
          crossAxisAlignment:
              mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi, it's Kaoutar Ben Hettouch",
              textAlign: mobile ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontSize: mobile ? 16 : 20,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              textAlign: mobile ? TextAlign.center : TextAlign.start,
              text: TextSpan(
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                children: const [
                  TextSpan(text: "I'm a "),
                  TextSpan(
                    text: "Digital Developer",
                    style: TextStyle(
                      color: Color(0xFF00FFCC),
                      shadows: [Shadow(color: Color(0x6600FFCC), blurRadius: 15)],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "I specialize in Mobile Application Development (Flutter & Kotlin) and hold a Specialized Technician degree in Digital Development (Mobile Applications option) from CMC Agadir. I build premium, high-performance applications with a focus on analytical precision, rigour, and seamless user experiences.",
              textAlign: mobile ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontSize: subSize,
                color: Colors.white54,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  mobile ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                buildSocialIcon(FontAwesomeIcons.whatsapp, 'WhatsApp', 'https://wa.me/212630170598'),
                const SizedBox(width: 14),
                buildSocialIcon(FontAwesomeIcons.github, 'GitHub', 'https://github.com/BEN-KAOUTAR'),
                const SizedBox(width: 14),
                buildSocialIcon(FontAwesomeIcons.facebookF, 'Facebook', 'https://www.facebook.com/kaoitar.ben.0'),
                const SizedBox(width: 14),
                buildSocialIcon(FontAwesomeIcons.instagram, 'Instagram', 'https://www.instagram.com/kaoutarben43?igsh=OXE0dW1kZG1hdDhh'),
              ],
            ),
            const SizedBox(height: 50),
            HoverWidget(
              builder: (isHovered) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse('https://canva.link/pkbbwx03t40nymt')),
                    child: AnimatedScale(
                      scale: isHovered ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: mobile ? 28 : 40,
                          vertical: mobile ? 14 : 18,
                        ),
                        decoration: BoxDecoration(
                          color: isHovered ? const Color(0xFF00FFCC).withValues(alpha: 0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFF00FFCC),
                            width: 2,
                          ),
                          boxShadow: isHovered
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF00FFCC).withValues(alpha: 0.6),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  )
                                ]
                              : [],
                        ),
                        child: Text(
                          'Download CV',
                          style: TextStyle(
                            color: const Color(0xFF00FFCC),
                            fontSize: mobile ? 15 : 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );

        final image = HeroProfileImage(size: imgSize);

        return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height - 80),
          padding:
              EdgeInsets.only(left: hPad, right: hPad, top: 140, bottom: 48),
          child: mobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    const SizedBox(height: 40),
                    content,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: content),
                    const SizedBox(width: 60),
                    image,
                  ],
                ),
        );
      },
    );
  }
}
