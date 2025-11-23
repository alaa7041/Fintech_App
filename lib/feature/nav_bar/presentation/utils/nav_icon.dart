part of '../nav_bar.dart';


class _NavIcon extends StatelessWidget {
  final String assetPath;
  final int index;
  final int selectedIndex;
  const _NavIcon({
    required this.assetPath,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!; 
    return SvgPicture.asset(
      Utils.getIconsSVGPath(assetPath),
      colorFilter: ColorFilter.mode(
        selectedIndex == index
            ? colors.primary
            : colors.grey,
        BlendMode.srcIn,
      ),
      width: 24.radius,
      height: 24.radius,
    );
  }
}
