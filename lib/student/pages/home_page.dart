import 'package:flutter/material.dart';
import 'package:mahastudify_app/widgets/notification_bottom_sheet.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER GRADIENT + SEARCH =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
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
                  // Salam + notifikasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat Datang! 👋',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Budi Santoso',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // === ICON NOTIF BISA DI TAP ===
                          InkWell(
                            borderRadius: BorderRadius.circular(999),
                            onTap: () {
                              showNotificationBottomSheet(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
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

            // ===== KONTEN SCROLLABLE =====
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---- Kelas Mendatang ----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Kelas Mendatang',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: Color(0xFFB018FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const _UpcomingClassCard(
                      initials: 'AR',
                      name: 'Ahmad Rizki',
                      subject: 'Fisika',
                      dateLabel: 'Hari ini',
                      time: '10:00 - 11:30',
                    ),
                    const _UpcomingClassCard(
                      initials: 'RA',
                      name: 'Rina Amalia',
                      subject: 'Bahasa Inggris',
                      dateLabel: 'Besok',
                      time: '14:00 - 15:30',
                    ),
                    const _UpcomingClassCard(
                      initials: 'AP',
                      name: 'Andi Pratama',
                      subject: 'Matematika',
                      dateLabel: '24 Nov 2024',
                      time: '09:00 - 10:30',
                    ),

                    const SizedBox(height: 20),

                    // ---- Mata Pelajaran Populer ----
                    const Text(
                      'Mata Pelajaran Populer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(
                      width: size.width,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: const [
                          _SubjectCard(
                            title: 'Matematika',
                            tutors: 12,
                            colors: [Color(0xFF9C27FF), Color(0xFFE040FB)],
                          ),
                          _SubjectCard(
                            title: 'Fisika',
                            tutors: 8,
                            colors: [Color(0xFF1976FF), Color(0xFF00BCD4)],
                          ),
                          _SubjectCard(
                            title: 'Kimia',
                            tutors: 6,
                            colors: [Color(0xFF00C853), Color(0xFF00E5FF)],
                          ),
                          _SubjectCard(
                            title: 'Biologi',
                            tutors: 7,
                            colors: [Color(0xFF00BFA5), Color(0xFF1DE9B6)],
                          ),
                          _SubjectCard(
                            title: 'Bahasa Inggris',
                            tutors: 10,
                            colors: [Color(0xFFFF4081), Color(0xFFFF80AB)],
                          ),
                          _SubjectCard(
                            title: 'Ekonomi',
                            tutors: 5,
                            colors: [Color(0xFFFFA000), Color(0xFFFFC107)],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---- Tutor Terbaik ----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tutor Terbaik',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: Color(0xFFB018FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const _TopTutorCard(
                      initials: 'SW',
                      name: 'Sarah Wijaya',
                      university: 'UI',
                      subjects: 'Matematika & Fisika',
                      sessions: 124,
                      price: 'Rp 50.000',
                      rating: 4.9,
                    ),
                    const _TopTutorCard(
                      initials: 'AR',
                      name: 'Ahmad Rizki',
                      university: 'ITB',
                      subjects: 'Kimia',
                      sessions: 98,
                      price: 'Rp 45.000',
                      rating: 4.8,
                    ),
                    const SizedBox(height: 12),
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

/// Card Kelas Mendatang
class _UpcomingClassCard extends StatelessWidget {
  final String initials;
  final String name;
  final String subject;
  final String dateLabel;
  final String time;

  const _UpcomingClassCard({
    required this.initials,
    required this.name,
    required this.subject,
    required this.dateLabel,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2ECC71),
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.video_call, size: 14, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'Online - Zoom',
                      style: TextStyle(fontSize: 11, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8E7FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  dateLabel,
                  style: const TextStyle(
                    color: Color(0xFFB018FF),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.access_time,
                      size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Card Mata Pelajaran Populer
class _SubjectCard extends StatelessWidget {
  final String title;
  final int tutors;
  final List<Color> colors;

  const _SubjectCard({
    required this.title,
    required this.tutors,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 20 * 2 - 12) / 2;

    return Container(
      width: width,
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$tutors Tutor',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

/// Card Tutor Terbaik
class _TopTutorCard extends StatelessWidget {
  final String initials;
  final String name;
  final String university;
  final String subjects;
  final int sessions;
  final String price;
  final double rating;

  const _TopTutorCard({
    required this.initials,
    required this.name,
    required this.university,
    required this.subjects,
    required this.sessions,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF2ECC71),
                  shape: BoxShape.circle,
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
                bottom: -2,
                right: -2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                          size: 12, color: Colors.white),
                      const SizedBox(width: 2),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
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
                  subjects,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB018FF),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3E5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.menu_book,
                              size: 12, color: Color(0xFFB018FF)),
                          const SizedBox(width: 4),
                          Text(
                            '$sessions sesi',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFFB018FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0FBE2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF00A152),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
