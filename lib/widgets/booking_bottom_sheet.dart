import 'package:flutter/material.dart';

class BookingSlot {
  final String subject;
  final String dateText;
  final String timeText;

  BookingSlot({
    required this.subject,
    required this.dateText,
    required this.timeText,
  });
}

void showBookingBottomSheet(
  BuildContext context, {
  required String tutorName,
}) {
  // contoh dummy jadwal – nanti bisa kamu ganti dari backend
  final slots = <BookingSlot>[
    BookingSlot(
      subject: "Matematika",
      dateText: "Senin, 2 Desember 2024",
      timeText: "09:00 - 10:30",
    ),
    BookingSlot(
      subject: "Fisika",
      dateText: "Senin, 2 Desember 2024",
      timeText: "14:00 - 15:30",
    ),
    BookingSlot(
      subject: "Matematika",
      dateText: "Rabu, 4 Desember 2024",
      timeText: "10:00 - 11:30",
    ),
  ];

  int? selectedIndex;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.7,
            maxChildSize: 0.95,
            minChildSize: 0.5,
            builder: (context, scrollController) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 32), // buat center title
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Booking Kelas",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Text(
                        "Pilih jadwal yang tersedia dari $tutorName",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Jadwal Tersedia (${slots.length} slot)",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // LIST SLOT
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: slots.length,
                        itemBuilder: (context, index) {
                          final slot = slots[index];
                          final isSelected = selectedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedIndex = index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFEAF2FF)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF3B6BE8)
                                      : const Color(0xFFE0E0E0),
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // chip mata pelajaran
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE3F2FD),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      slot.subject,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF1976D2),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 16, color: Colors.black54),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          slot.dateText,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time,
                                          size: 16, color: Colors.black54),
                                      const SizedBox(width: 8),
                                      Text(
                                        slot.timeText,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Warning jika belum pilih jadwal
                    if (selectedIndex == null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8E1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFFE082)),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.warning_amber_rounded,
                                color: Color(0xFFFFA000), size: 18),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Pilih salah satu jadwal terlebih dahulu",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF8D6E63),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 12),

                    // TOMBOL LANJUT
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: selectedIndex == null
                              ? Colors.grey.shade400
                              : null,
                        ).copyWith(
                          backgroundColor: selectedIndex == null
                              ? MaterialStatePropertyAll(
                                  Colors.grey.shade400,
                                )
                              : const MaterialStatePropertyAll(
                                  null,
                                ),
                        ),
                        onPressed: () {
                          if (selectedIndex == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Silakan pilih salah satu jadwal dulu ya."),
                              ),
                            );
                            return;
                          }

                          // TODO: nanti arahkan ke halaman pembayaran
                          Navigator.pop(context); // tutup bottom sheet dulu
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Jadwal dipilih: "
                                "${slots[selectedIndex!].dateText} "
                                "${slots[selectedIndex!].timeText}",
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Lanjut ke Pembayaran",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
    },
  );
}
