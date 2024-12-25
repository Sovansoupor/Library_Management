
import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/models/book.dart';
import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final void Function()? onIconPressed;
  final Book book;

  const CollectionCard({
    super.key,
    required this.book,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final returnDate = book.borrowStatuses.isNotEmpty
        ? book.borrowStatuses.last.returnDate ?? now.add(const Duration(days: 14))
        : now.add(const Duration(days: 14)); // Default return date if no status

    final daysLeft = returnDate.difference(now).inDays;

    // Calculate progress value
    const int totalDays = 14; // 2-week borrow period
    final progress = daysLeft >= 0 ? (totalDays - daysLeft) / totalDays : 1.0;

    return Container(
      padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 8),
      decoration: BoxDecoration(
        color: TColors.secondary,
        borderRadius: BorderRadius.circular(3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: 500,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Book Cover Image
          Container(
            decoration: BoxDecoration(
              color: TColors.darkbg,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(
                book.coverImage,
                height: 140,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Book Details
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Collection',
                      style: TColors.bodyStyle,
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz_outlined),
                      onPressed: onIconPressed,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Title
                Text(
                  book.title,
                  style: TColors.captionStyle.copyWith(
                    letterSpacing: -0.5,
                    height: 1.2,
                  ),
                ),
                // Author Name
                Text(book.author, style: TColors.authorStyle),
                const SizedBox(height: 16),
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: const Color(0xFFEFEDED),
                    valueColor: const AlwaysStoppedAnimation<Color>(TColors.primary),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 5),
                // Completion Text
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: daysLeft > 0 ? const Color(0xFF292828) : const Color(0xFFAB140A),
                    ),
                    children: [
                      if (daysLeft < 0)
                        const TextSpan(
                          text: 'Please return the book!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      else
                        TextSpan(
                          text: '$daysLeft',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const TextSpan(
                        text: ' days left to return',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}