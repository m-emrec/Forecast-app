// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/widgets/view%20managers/appbar_view_manager.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late double height;
  late double expandedHeight;
  late double collapsedHeight;

  @override
  void didChangeDependencies() {
    height = MediaQuery.of(context).size.height;

    /// collapsed height of the appbar
    collapsedHeight = height * 0.5;

    /// expanded height of the appbar
    expandedHeight = height * 0.8;
    super.didChangeDependencies();
  }

  ///border shape of the appbar
  ShapeBorder get _shape => const RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xFF73B2EF),
        width: 3,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          72.0,
        ),
        bottomRight: Radius.circular(72),
      ));

  /// decoration of the container
  Decoration get _decoration => const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            72.0,
          ),
          bottomRight: Radius.circular(72),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 12),
            color: Color(0xFF074090),
            blurRadius: 4,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF11B5FD),
            Color(0xFF0F68F4),
          ],
        ),
      );

  Widget get _flexibleSpace => Container(
        constraints: BoxConstraints(
          maxHeight: expandedHeight,
          minHeight: collapsedHeight,
        ),
        decoration: _decoration,
        child: ViewManager(
          size: BoxConstraints(
            minHeight: collapsedHeight,
            maxHeight: expandedHeight,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      // forceMaterialTransparency: true,
      // collapsedHeight: collapsedHeight,
      // expandedHeight: expandedHeight,
      // pinned: true,
      // shape: _shape,
      child: _flexibleSpace,
    );
  }
}
