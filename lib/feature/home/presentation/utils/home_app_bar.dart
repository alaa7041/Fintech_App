part of '../home_screen.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onNotificationsTap;
  const _HomeAppBar({required this.title, this.onNotificationsTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.width),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.asset(
                  Utils.getAssetDummyJPGPath("user"),
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(8),
            Expanded(
              child: AppText(
                title: title,
                style: TextStyle(
                  fontSize: 24.font,
                  fontWeight: FontWeightsHelper.bold,
                  color: colors.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onNotificationsTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.notifications_none,
              size: 24.font,
              color: colors.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
