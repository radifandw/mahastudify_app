import 'package:flutter/material.dart';
import 'package:mahastudify_app/widgets/booking_bottom_sheet.dart';

class SearchTutorPage extends StatelessWidget {
  const SearchTutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER GRADIENT + SEARCH =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E88FF), Color(0xFF06D6FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // baris back + title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Cari Tutor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // search bar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.96),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Cari tutor atau mata pelajaran...',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ===== LIST TUTOR =====
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '5 Tutor Tersedia',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),

                    _TutorCard(
                      initials: 'SW',
                      name: 'Sarah Wijaya',
                      university: 'Universitas Indonesia',
                      majorLine1: 'Matematika',
                      desc:
                          'Mahasiswa S2 Matematika UI. Berpengalaman mengajar lebih dari 3 tahun.',
                      sessions: 124,
                      price: 'Rp 50.000',
                      rating: 4.9,
                      tags: ['Matematika', 'Fisika'],
                    ),
                    SizedBox(height: 10),
                    _TutorCard(
                      initials: 'PM',
                      name: 'Puan Maharan',
                      university: 'Universitas Indonesia',
                      majorLine1: 'Matematika',
                      desc:
                          'Mahasiswa S2 Matematika UI. Berpengalaman mengajar lebih dari 2 tahun.',
                      sessions: 115,
                      price: 'Rp 50.000',
                      rating: 4.9,
                      tags: ['Matematika'],
                    ),
                    SizedBox(height: 10),
                    _TutorCard(
                      initials: 'SW',
                      name: 'Sarah Wijaya',
                      university: 'Universitas Indonesia',
                      majorLine1: 'Matematika',
                      desc:
                          'Mahasiswa S2 Matematika UI. Berpengalaman mengajar lebih dari 3 tahun.',
                      sessions: 124,
                      price: 'Rp 50.000',
                      rating: 4.9,
                      tags: ['Matematika', 'Fisika'],
                    ),
                    SizedBox(height: 10),
                    _TutorCard(
                      initials: 'SW',
                      name: 'Sarah Wijaya',
                      university: 'Universitas Indonesia',
                      majorLine1: 'Matematika',
                      desc:
                          'Mahasiswa S2 Matematika UI. Berpengalaman mengajar lebih dari 3 tahun.',
                      sessions: 124,
                      price: 'Rp 50.000',
                      rating: 4.9,
                      tags: ['Matematika', 'Fisika'],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TutorCard extends StatelessWidget {
  final String initials;
  final String name;
  final String university;
  final String majorLine1;
  final String desc;
  final int sessions;
  final String price;
  final double rating;
  final List<String> tags;

  const _TutorCard({
    required this.initials,
    required this.name,
    required this.university,
    required this.majorLine1,
    required this.desc,
    required this.sessions,
    required this.price,
    required this.rating,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFDFBFF), Color(0xFFF7ECFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ========= baris atas =========
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // avatar + status online
              Stack(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(
                        color: const Color(0xFFE1B8FF),
                        width: 4,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),

              // info tutor
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      university,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      majorLine1,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB018FF),
                      ),
                    ),
                  ],
                ),
              ),

              // badge rating
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Color(0xFFFFC107)),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          // ========= chips info =========
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              const _InfoChip(
                text: 'Online',
                icon: Icons.videocam_outlined,
                bgColor: Color(0xFFE3F2FD),
                textColor: Color(0xFF1E88E5),
              ),
              _InfoChip(
                text: '$sessions sesi',
                icon: Icons.menu_book_outlined,
                bgColor: const Color(0xFFF3E5F5),
                textColor: const Color(0xFFB018FF),
              ),
              for (final tag in tags)
                _InfoChip(
                  text: tag,
                  bgColor: const Color(0xFFF3E5F5),
                  textColor: const Color(0xFFB018FF),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // ========= harga + tombol booking =========
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0FBE2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00A152),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 36,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB018FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // 👉 PANGGIL BOTTOM SHEET BOOKING DI SINI
                    showBookingBottomSheet(
                      context,
                      tutorName: name,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Booking',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
}

class _InfoChip extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;

  const _InfoChip({
    required this.text,
    this.icon,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
