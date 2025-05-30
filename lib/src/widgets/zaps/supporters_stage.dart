import 'package:models/models.dart';
import 'package:zaplab_design/zaplab_design.dart';

class AppSupportersStage extends StatelessWidget {
  final List<Profile> topThreeSupporters;

  const AppSupportersStage({
    super.key,
    required this.topThreeSupporters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final isInsideScope = AppScope.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProfilePic.s56(topThreeSupporters[0].author.value),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: AppText.med14(
                  topThreeSupporters[0].author.value?.name ??
                      formatNpub(
                          topThreeSupporters[0].author.value?.npub ?? ''),
                  color: theme.colors.white,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 64,
                  child: AppContainer(
                    padding: const AppEdgeInsets.only(top: AppGapSize.s12),
                    decoration: BoxDecoration(
                      color: isInsideScope
                          ? theme.colors.white8
                          : theme.colors.gray66,
                      borderRadius: BorderRadius.only(
                        topLeft: theme.radius.asBorderRadius().rad16.topRight,
                        bottomLeft:
                            theme.radius.asBorderRadius().rad16.bottomRight,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AppText.med14(
                        '2',
                        color: theme.colors.white66,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Second place (center - winner)
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProfilePic.s56(topThreeSupporters[1].author.value),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: AppText.med14(
                  topThreeSupporters[1].author.value?.name ??
                      formatNpub(
                          topThreeSupporters[1].author.value?.npub ?? ''),
                  color: theme.colors.white,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 96,
                  child: AppContainer(
                    padding: const AppEdgeInsets.only(top: AppGapSize.s12),
                    decoration: BoxDecoration(
                      color: isInsideScope
                          ? theme.colors.white8
                          : theme.colors.gray66,
                      borderRadius: BorderRadius.only(
                        topRight: theme.radius.asBorderRadius().rad16.topRight,
                        topLeft:
                            theme.radius.asBorderRadius().rad16.bottomRight,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AppText.med14(
                        '1',
                        color: theme.colors.white66,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Third place (right)
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppProfilePic.s56(topThreeSupporters[2].author.value),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: AppText.med14(
                  topThreeSupporters[2].author.value?.name ??
                      formatNpub(
                          topThreeSupporters[2].author.value?.npub ?? ''),
                  color: theme.colors.white,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 48,
                  child: AppContainer(
                    padding: const AppEdgeInsets.only(top: AppGapSize.s12),
                    decoration: BoxDecoration(
                      color: isInsideScope
                          ? theme.colors.white8
                          : theme.colors.gray66,
                      borderRadius: BorderRadius.only(
                        topRight: theme.radius.asBorderRadius().rad16.topRight,
                        bottomRight:
                            theme.radius.asBorderRadius().rad16.bottomRight,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AppText.med14(
                        '3',
                        color: theme.colors.white66,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
