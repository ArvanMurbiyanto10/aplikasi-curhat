import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk efek blur background
import 'chat_room_percintaan_hubungan.dart';
import 'chat_room_keluarga.dart';
import 'chat_room_teman_sosial.dart';

class ChatTopicSelectionPage extends StatelessWidget {
  const ChatTopicSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF5D4037),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        children: [
          // ============================================================
          // AREA KOMIK HERO SECTION (TIDAK ADA PERUBAHAN DI SINI)
          // ============================================================
          SizedBox(
            height: 320,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // --- BACKGROUND ABSTRAK (Blobs) ---
                Positioned(
                  top: -80,
                  right: -60,
                  child: _buildBlurryBlob(
                    color: theme.colorScheme.primary.withOpacity(0.15),
                    size: 250,
                  ),
                ),
                Positioned(
                  top: 80,
                  left: -80,
                  child: _buildBlurryBlob(
                    color: theme.colorScheme.secondary.withOpacity(0.15),
                    size: 220,
                  ),
                ),

                // --- BUBBLE CHAT ---
                Positioned(
                  top: 70,
                  right: 24,
                  left: 84,
                  child: CustomPaint(
                    painter: ComicBubblePainter(
                      bgColor: theme.colorScheme.surface.withOpacity(0.95),
                      borderColor: theme.colorScheme.outlineVariant.withOpacity(
                        0.6,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(28, 22, 28, 38),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 14,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Arvan AI berkata:",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\"Kamu tidak sendirian, pilih topik yang paling menggambarkan perasaanmu saat ini.\"",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // --- AVATAR UTAMA (FOTO ASLI) ---
                Positioned(
                  bottom: 0,
                  left: 24,
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/foto_asli.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // --- JUDUL ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Pilih Ruang Curhat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // --- MENU CARDS ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildTopicCard(
                  context,
                  "Percintaan & Hubungan",
                  "Galau, patah hati, atau cari saran PDKT.",
                  "assets/arvan_percintaan.png",
                  Colors.pinkAccent,
                ),
                _buildTopicCard(
                  context,
                  "Keluarga",
                  "Masalah dengan orang tua atau saudara.",
                  "assets/arvan_keluarga.png",
                  Colors.orangeAccent,
                ),
                _buildTopicCard(
                  context,
                  "Teman & Sosial",
                  "Persahabatan, lingkungan kerja, atau bullying.",
                  "assets/arvan_teman-sosial.png",
                  Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Blob
  Widget _buildBlurryBlob({required Color color, required double size}) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  // =================================================================
  // BAGIAN YANG DIPERBAIKI ADA DI SINI
  // =================================================================
  Widget _buildTopicCard(
    BuildContext context,
    String title,
    String subtitle,
    String imageAsset,
    Color themeColor,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withOpacity(0.4),
          ),
        ),
        color: theme.colorScheme.surfaceContainerLowest,
        child: InkWell(
          onTap: () {
            if (title.contains("Percintaan")) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomPercintaanHubungan(),
                ),
              );
            } else if (title.contains("Keluarga")) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomKeluarga(),
                ),
              );
            } else if (title.contains("Teman")) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomTemanSosial(),
                ),
              );
            }
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // --- PERBAIKAN AVATAR MENU ---
                // Menggunakan CircleAvatar agar konsisten dengan chat room
                // dan menangani pemotongan gambar lebih baik secara default.
                CircleAvatar(
                  radius: 27.5, // Setengah dari ukuran yang diinginkan (55 / 2)
                  backgroundColor: themeColor.withOpacity(0.1),
                  backgroundImage: AssetImage(imageAsset),
                  // CircleAvatar secara otomatis melakukan 'cover' dan centering.
                  // Ini seharusnya mengatasi masalah rambut terpotong atau gambar tenggelam.
                ),

                // -----------------------------
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// PAINTER UNTUK BUBBLE (TETAP SAMA)
class ComicBubblePainter extends CustomPainter {
  final Color bgColor;
  final Color borderColor;

  ComicBubblePainter({required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;
    final paintBorder = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.04)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final path = Path();
    final w = size.width;
    final h = size.height;
    const tailHeight = 20.0;
    const tailWidthBase = 25.0;
    const tailPositionX = 60.0;
    const curveStrength = 5.0;

    path.moveTo(20, 0);
    path.quadraticBezierTo(w / 2, -curveStrength, w - 20, 0);
    path.quadraticBezierTo(w, 0, w, 20);
    path.quadraticBezierTo(
      w + curveStrength,
      (h - tailHeight) / 2,
      w,
      h - tailHeight - 20,
    );
    path.quadraticBezierTo(w, h - tailHeight, w - 20, h - tailHeight);
    path.quadraticBezierTo(
      (tailPositionX + tailWidthBase + w / 2) / 2,
      h - tailHeight + curveStrength,
      tailPositionX + tailWidthBase,
      h - tailHeight,
    );
    path.lineTo(tailPositionX, h);
    path.lineTo(tailPositionX - 5, h - tailHeight);
    path.quadraticBezierTo(
      20,
      h - tailHeight + curveStrength,
      20,
      h - tailHeight,
    );
    path.quadraticBezierTo(-curveStrength, (h - tailHeight) / 2, 0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.close();

    canvas.drawPath(path.shift(const Offset(0, 4)), shadowPaint);
    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
