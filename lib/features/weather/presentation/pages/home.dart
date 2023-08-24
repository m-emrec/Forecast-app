import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          CustomAppBar(
            scrollController: _controller,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 25,
              (context, index) => SizedBox(
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late bool _isCollapsed;
  @override
  void initState() {
    _isCollapsed = false;
    widget.scrollController.addListener(() {
      logger.i("message");
      logger.i(widget.scrollController.position.pixels);
      if (widget.scrollController.position.pixels > 259) {
        setState(() {
          _isCollapsed = true;
        });
      } else {
        setState(() {
          _isCollapsed = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      // title: AppBar(
      //   title: const Text("KAdıköy"),
      // ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF11B5FD),
              Color(0xFF0F68F4),
            ],
          ),
        ),
        child: SafeArea(
          child: _isCollapsed ? CollapsedView() : ExpandedView(),
        ),
      ),
      collapsedHeight: size.height * 0.4,
      expandedHeight: size.height * 0.75,
      pinned: true,
    );
  }
}

class ExpandedView extends StatefulWidget {
  const ExpandedView({super.key});

  @override
  State<ExpandedView> createState() => _ExpandedViewState();
}

class _ExpandedViewState extends State<ExpandedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text("Expanded"),
        ),
      ],
    );
  }
}

class CollapsedView extends StatefulWidget {
  const CollapsedView({super.key});

  @override
  State<CollapsedView> createState() => _CollapsedViewState();
}

class _CollapsedViewState extends State<CollapsedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text("Collapsed"),
        ),
      ],
    );
  }
}
