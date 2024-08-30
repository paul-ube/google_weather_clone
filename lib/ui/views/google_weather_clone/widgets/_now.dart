part of '../google_weather_clone.dart';

class _Now extends StatelessWidget {
  const _Now({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.maxFinite,
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                stops: const [0, 0.1, 1],
                colors: [
                  // Copy the background color of the scaffold
                  colorScheme.secondaryContainer,
                  colorScheme.secondaryContainer.withOpacity(0),
                  colorScheme.secondaryContainer.withOpacity(0),
                  // Colors.black.withOpacity(0.5),
                  // Colors.black.withOpacity(0),
                  // Colors.black.withOpacity(0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
              child: Image.network(
                'https://picsum.photos/id/54/640',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 0.55, 1],
                colors: [
                  // Copy the background color of the scaffold
                  colorScheme.secondaryContainer,
                  colorScheme.secondaryContainer.withOpacity(0.93),
                  colorScheme.secondaryContainer.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(title: 'Now'),
              HorizontalPadding(
                child: Row(
                  children: [
                    Expanded(child: mainData(context)),
                    subtitle(context),
                  ],
                ),
              ),
              vSpaceLarge,
              vSpaceLarge,
              vSpaceLarge,
            ],
          ),
        ],
      ),
    );
  }

  Widget mainData(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MinStartColumn(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '34°',
              style: textTheme.displayLarge?.apply(fontWeightDelta: 4),
            ),
            hSpaceMini,
            Icon(
              Icons.sunny,
              size: textTheme.displayLarge!.fontSize! - 12,
              color: Colors.yellow.shade600,
            ),
          ],
        ),
        Text(
          'High: 37° · Low: 30°',
          style: textTheme.bodySmall?.apply(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        )
      ],
    );
  }

  Widget subtitle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Mostly sunny',
          style: textTheme.labelLarge,
        ),
        vSpaceMini,
        Text(
          'Feels like 44°',
          style: textTheme.bodySmall?.apply(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
