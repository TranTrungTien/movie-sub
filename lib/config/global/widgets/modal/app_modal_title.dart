import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';

class AppModalTitle extends StatelessWidget {
  final String modalTitle;

  const AppModalTitle({super.key, required this.modalTitle});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(6),
        child: Column(
          children: [
            Text(
              modalTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium!.copyWith(
                color: AppColors.error,
              ),
            ),
            Divider(
              color: AppDynamicColorBuilder.getDark3AndGrey200(context),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
