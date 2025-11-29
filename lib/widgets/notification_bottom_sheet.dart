import 'package:flutter/material.dart';

void showNotificationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.65,
        maxChildSize: 0.90,
        minChildSize: 0.40,
        builder: (context, controller) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "🔔 Notifikasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "Tetap update dengan aktivitas terbaru Anda",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // List Notifikasi
                Expanded(
                  child: ListView(
                    controller: controller,
                    children: [
                      notifItem(
                        title: "Kelas Hari Ini",
                        subtitle:
                            "Kelas Fisika dengan Ahmad Rizki dimulai pukul 10:00",
                        time: "2 jam lalu",
                        highlighted: true,
                      ),
                      notifItem(
                        title: "Pembayaran Berhasil",
                        subtitle:
                            "Pembayaran untuk kelas Bahasa Inggris telah dikonfirmasi",
                        time: "1 hari lalu",
                        highlighted: true,
                      ),
                      notifItem(
                        title: "Review Tutor",
                        subtitle: "Jangan lupa beri review untuk Sarah Wijaya",
                        time: "2 hari lalu",
                      ),
                      notifItem(
                        title: "Promo Spesial",
                        subtitle:
                            "Dapatkan diskon 20% untuk booking 5 kelas sekaligus!",
                        time: "3 hari lalu",
                      ),
                    ],
                  ),
                ),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Tandai Semua Sudah Dibaca"),
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

/// Widget item notifikasi
Widget notifItem({
  required String title,
  required String subtitle,
  required String time,
  bool highlighted = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: highlighted ? const Color(0xFFE8F0FF) : Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text(time, style: const TextStyle(fontSize: 11, color: Colors.black45)),
      ],
    ),
  );
}
