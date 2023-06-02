


import 'package:animated_responsive_layout_1/features/messenger/data/model/user_model.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/animated_floating_action_button.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/email_list_view/email_list_view.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/navigation_bar/disappearing_bottom_navigation_bar.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/navigation_bar/disappearing_navigation_rail.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/reply_email_list_view/reply_email_list_view.dart';
import 'package:animated_responsive_layout_1/global/animations/bar_animation.dart';
import 'package:animated_responsive_layout_1/global/animations/rail_animation.dart';
import 'package:animated_responsive_layout_1/global/animations/rail_fab_animation.dart';
import 'package:animated_responsive_layout_1/global/transitions/list_details_transition.dart';
import 'package:flutter/material.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({
    super.key,
    required this.currentUser,
  });

  final User currentUser;

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> with SingleTickerProviderStateMixin{
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);

  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0,
      vsync: this);
  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  int selectedIndex = 0;
  bool wideScreen = false;
  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    // wideScreen = width > 600;
    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              DisappearingNavigationRail(
                railAnimation: _railAnimation,
                railFabAnimation: _railFabAnimation,
                selectedIndex: selectedIndex,
                backgroundColor: _backgroundColor,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              Expanded(
                child: Container(
                  color: _backgroundColor,
                  child: ListDetailTransition(
                    animation: _railAnimation,
                    one: EmailListView(
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      currentUser: widget.currentUser,
                    ),
                    two: const ReplyListView(),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: AnimatedFloatingActionButton(
            animation: _barAnimation,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: DisappearingBottomNavigationBar(
            barAnimation: _barAnimation,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );

  }
}