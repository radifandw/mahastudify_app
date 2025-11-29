import 'package:flutter/material.dart';

class MyClassesPage extends StatefulWidget {
  const MyClassesPage({super.key});

  @override
  State<MyClassesPage> createState() => _MyClassesPageState();
}

class _MyClassesPageState extends State<MyClassesPage> {
  bool isUpcoming = true; // true = Mendatang, false = Selesai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER GRADIENT =====
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back_ios,
                            size: 18, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Kelas Saya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== SEGMENTED TAB =====
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFF1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _SegmentButton(
                        text: 'Mendatang',
                        isActive: isUpcoming,
                        onTap: () {
                          setState(() => isUpcoming = true);
                        },
                      ),
                    ),
                    Expanded(
                      child: _SegmentButton(
                        text: 'Selesai',
                        isActive: !isUpcoming,
                        onTap: () {
                          setState(() => isUpcoming = false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===== LIST KELAS =====
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: isUpcoming
                      ? const [
                          _UpcomingClassCardJoin(
                            initials: 'AR',
                            name: 'Ahmad Rizki',
                            subject: 'Fisika',
                            topic: 'Mekanika Kuantum',
                            dateLabel: 'Hari ini',
                            time: '10:00 - 11:30',
                            zoomUrl: 'https://zoom.us/j/123456789',
                            badgeText: 'Hari ini',
                          ),
                          SizedBox(height: 12),
                          _UpcomingClassCardJoin(
                            initials: 'RA',
                            name: 'Rina Amalia',
                            subject: 'Bahasa Inggris',
                            topic: 'TOEFL Speaking Practice',
                            dateLabel: 'Besok, 19 Nov',
                            time: '14:00 - 15:30',
                            zoomUrl: 'https://zoom.us/j/987654321',
                            badgeText: 'Besok, 19 Nov',
                          ),
                          SizedBox(height: 12),
                          _UpcomingClassCardJoin(
                            initials: 'AP',
                            name: 'Andi Pratama',
                            subject: 'Matematika',
                            topic: 'Statistika Dasar',
                            dateLabel: '24 Nov 2024',
                            time: '09:00 - 10:30',
                            zoomUrl: 'https://zoom.us/j/555555555',
                            badgeText: '24 Nov 2024',
                          ),
                        ]
                      : const [
                          _FinishedClassCard(
                            initials: 'SW',
                            name: 'Sarah Wijaya',
                            subject: 'Matematika',
                            topic: 'Integral & Diferensial',
                            dateLabel: '15 Nov 2024',
                            time: '09:00 - 10:30',
                          ),
                          SizedBox(height: 12),
                          _FinishedClassCard(
                            initials: 'SW',
                            name: 'Sarah Wijaya',
                            subject: 'Matematika',
                            topic: 'Trigonometri',
                            dateLabel: '12 Nov 2024',
                            time: '09:00 - 10:30',
                          ),
                          SizedBox(height: 12),
                          _FinishedClassCard(
                            initials: 'SW',
                            name: 'Sarah Wijaya',
                            subject: 'Matematika',
                            topic: 'Aljabar Linear',
                            dateLabel: '10 Nov 2024',
                            time: '09:00 - 10:30',
                          ),
                          SizedBox(height: 12),
                          _FinishedClassCard(
                            initials: 'SW',
                            name: 'Sarah Wijaya',
                            subject: 'Matematika',
                            topic: 'Geometri Analitik',
                            dateLabel: '8 Nov 2024',
                            time: '09:00 - 10:30',
                            showRatingBadge: true,
                            rating: 9,
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

/// ===== Segmented Button =====
class _SegmentButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.black87 : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

/// ===== Card Kelas Mendatang + Join Meeting =====
class _UpcomingClassCardJoin extends StatelessWidget {
  final String initials;
  final String name;
  final String subject;
  final String topic;
  final String dateLabel;
  final String time;
  final String zoomUrl;
  final String badgeText;

  const _UpcomingClassCardJoin({
    required this.initials,
    required this.name,
    required this.subject,
    required this.topic,
    required this.dateLabel,
    required this.time,
    required this.zoomUrl,
    required this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // baris atas
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
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
                    const SizedBox(height: 2),
                    Text(
                      topic,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
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
                        const SizedBox(width: 10),
                        const Icon(Icons.videocam_outlined,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        const Text(
                          'Online - Zoom',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF1E88E5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // box link zoom
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Link Zoom Meeting:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  zoomUrl,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1565C0),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // tombol join
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ).copyWith(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => null,
                ),
              ),
              onPressed: () {
                // TODO: buka link zoom / deep link
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E88FF), Color(0xFF06D6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    'Join Meeting',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ===== Card Kelas Selesai + Rating =====
class _FinishedClassCard extends StatelessWidget {
  final String initials;
  final String name;
  final String subject;
  final String topic;
  final String dateLabel;
  final String time;
  final bool showRatingBadge;
  final int rating;

  const _FinishedClassCard({
    required this.initials,
    required this.name,
    required this.subject,
    required this.topic,
    required this.dateLabel,
    required this.time,
    this.showRatingBadge = false,
    this.rating = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // baris atas
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
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
                    const SizedBox(height: 2),
                    Text(
                      topic,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          dateLabel,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 12),
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
                ),
              ),
              if (showRatingBadge)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3CD),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star,
                          size: 14, color: Color(0xFFFFC107)),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
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

          const SizedBox(height: 12),

          // tombol beri rating
          SizedBox(
            width: double.infinity,
            height: 42,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1E88E5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                // TODO: buka form rating
              },
              icon: const Icon(Icons.star_border, color: Color(0xFF1E88E5)),
              label: const Text(
                'Beri Rating & Review',
                style: TextStyle(
                  color: Color(0xFF1E88E5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
