import 'package:animated_responsive_layout_1/features/messenger/data/model/user_model.dart';
import 'package:animated_responsive_layout_1/features/messenger/data/model/data.dart' as data;
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/email_list_view/widgets/email_widget.dart';
import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/widgets/email_list_view/widgets/search_bar_widget.dart' as search_bar;
import 'package:flutter/material.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          search_bar.SearchBar(currentUser: currentUser),
          const SizedBox(height: 8),
          ...List.generate(
            data.emails.length,
                (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EmailWidget(
                  email: data.emails[index],
                  onSelected: onSelected != null
                      ? () {
                    onSelected!(index);
                  }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}