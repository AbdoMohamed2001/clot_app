import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/assets.dart';
import '../text_styles.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.enabled = false,
    // required this.onResultsChanged,
  });
  final void Function(String?)? onChanged;
  final bool enabled;
  // final Function(List<ProductEntity>) onResultsChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: SizedBox(
        height: 40,
        child: TextField(
          focusNode: _focusNode,
          enabled: widget.enabled,
          controller: _searchController,
          // onChanged: context.read<SearchCubit>().searchFruits,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyles.book12,
            contentPadding: EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            suffixIconConstraints: BoxConstraints(
              minHeight: 16,
              maxHeight: 16,
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14, right: 12),
              child: SvgPicture.asset(Assets.vectorsSearch),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
