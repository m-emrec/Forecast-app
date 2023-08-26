// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/widgets/view_manager.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;
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
    collapsedHeight = height * 0.5;
    expandedHeight = height * 0.75;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceMaterialTransparency: true,
      collapsedHeight: collapsedHeight,
      expandedHeight: expandedHeight,
      pinned: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFF73B2EF),
          width: 3,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            72.0,
          ),
          bottomRight: Radius.circular(72),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
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
        ),
        child: ViewManager(
          scrollController: widget.scrollController,
        ),
      ),
    );
  }
}
