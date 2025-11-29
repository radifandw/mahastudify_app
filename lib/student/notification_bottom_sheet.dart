import 'package:flutter/material.dart';

void showNotificationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        minChildSize: 0.40,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.notifications_active_outlined,
                            color: Colors.blue, size: 26),
                        SizedBox(width: 8),
                        Text(
                          "Notifikasi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),

                const SizedBox(height: 4),
                const Text(
                  "Tetap update dengan aktivitas terbaru Anda",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 20),

                // LIST NOTIFICATION
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      _notifTile(
                        title: "Kelas Hari Ini",
                        subtitle:
                            "Kelas Fisika dengan Ahmad Rizki dimulai pukul 10:00",
                        time: "2 jam lalu",
                        highlight: true,
                      ),
                      _notifTile(
                        title: "Pembayaran Berhasil",
                        subtitle:
                            "Pembayaran untuk kelas Bahasa Inggris telah dikonfirmasi",
                        time: "1 hari lalu",
                        highlight: true,
                      ),
                      _notifTile(
                        title: "Review Tutor",
                        subtitle:
                            "Jangan lupa beri review untuk Sarah Wijaya",
                        time: "2 hari lalu",
                      ),
                      _notifTile(
                        title: "Promo Spesial",
                        subtitle:
                            "Dapatkan diskon 20% untuk booking 5 kelas sekaligus!",
                        time: "3 hari lalu",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Tandai Semua Sudah Dibaca",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

/// Widget untuk tile notifikasi
Widget _notifTile({
  required String title,
  required String subtitle,
  required String time,
  bool highlight = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: highlight ? const Color(0xFFEFF6FF) : Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot biru
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(top: 6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 12),

        // Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),

        // Waktu
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}
