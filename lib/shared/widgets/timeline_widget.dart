import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_theme.dart';
import '../models/document.dart';

/// Order in which to sort the timeline
enum SortOrder { mostRecentFirst, oldestFirst }

/// A single entry for the timeline
class TimelineEntry {
  final DateTime date;
  final String title;
  final List<String> thumbnails; // URLs or file paths

  TimelineEntry({
    required this.date,
    required this.title,
    this.thumbnails = const [],
  });
}

/// A vertical timeline widget displaying document entries
class TimelineWidget extends StatelessWidget {
  final List<TimelineEntry> entries;
  final SortOrder sortOrder;

  const TimelineWidget({
    Key? key,
    required this.entries,
    this.sortOrder = SortOrder.mostRecentFirst,
  }) : super(key: key);

  List<TimelineEntry> get _sortedEntries {
    final list = List<TimelineEntry>.from(entries);
    list.sort((a, b) => sortOrder == SortOrder.mostRecentFirst
        ? b.date.compareTo(a.date)
        : a.date.compareTo(b.date));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final sorted = _sortedEntries;
    return ListView.builder(
      itemCount: sorted.length,
      itemBuilder: (context, index) {
        final entry = sorted[index];
        final isFirst = index == 0;
        final isLast = index == sorted.length - 1;
        return TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
            width: 16,
            color: AppColors.primary,
          ),
          beforeLineStyle: LineStyle(
            color: AppColors.divider,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: AppColors.divider,
            thickness: 2,
          ),
          endChild: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${entry.date.day}/${entry.date.month}/${entry.date.year}',
                  style: AppTextTheme.textTheme.caption,
                ),
                const SizedBox(height: 4),
                Text(
                  entry.title,
                  style: AppTextTheme.textTheme.subtitle1,
                ),
                const SizedBox(height: 8),
                if (entry.thumbnails.isNotEmpty)
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: entry.thumbnails.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            entry.thumbnails[i],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          startChild: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 8),
            child: isFirst || isLast
                ? SizedBox(
                    height: 0,
                  )
                : null,
          ),
        );
      },
    );
  }
}
