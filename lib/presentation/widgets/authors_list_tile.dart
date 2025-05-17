import 'package:flutter/material.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';
import 'package:realview_challenge/core/theme/app_theme.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/presentation/widgets/star_rating.dart';

class AuthorsListTile extends StatelessWidget {
  final Author author;

  const AuthorsListTile({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    author.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 8.0),
                StarRating(rating: author.formattedRatingsAverage),
              ],
            ),
            _buildSubtitle(
              context: context,
              label: context.l10n.topWork,
              value: author.topWork,
            ),
            _buildSubtitle(
              context: context,
              label: context.l10n.birthDate,
              value: author.birthDate,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle({
    required BuildContext context,
    required String label,
    String? value,
  }) {
    final displayValue =
        value?.isNotEmpty == true ? value : context.l10n.notAvailableShort;
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Text(
        "$label: $displayValue",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            Theme.of(
              context,
            ).extension<CustomTextStyles>()?.listTileSubtitleStyle,
      ),
    );
  }
}
