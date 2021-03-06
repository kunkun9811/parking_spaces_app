import 'package:flutter/material.dart';

import '../../theme.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// TODO: Need to pass in function for search results
class SearchBar extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final Function onChanged;
  final Function onTap;

  const SearchBar({
    Key key,
    @required FocusNode searchNode,
    @required TextEditingController searchController,
    @required double width,
    @required double height,
    @required EdgeInsetsGeometry margin,
    this.onTap,
    this.onChanged,
  })  : _searchNode = searchNode,
        _searchController = searchController,
        width = width,
        height = height,
        margin = margin,
        super(key: key);

  final FocusNode _searchNode;
  final TextEditingController _searchController;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    bool isFocused = widget._searchNode.hasFocus;
    return Card(
      margin: widget.margin,
      elevation: 20.sp,
      color: customCyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.sp),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(40.sp),
        ),
        child: Stack(
          children: [
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Where are you going?",
                // Hide HintText when typing
                hintStyle: TextStyle(
                  fontSize: 10.sp,
                  color:
                      isFocused ? Theme.of(context).primaryColor : Colors.white,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              focusNode: widget._searchNode,
              controller: widget._searchController,
              onSubmitted: (input) {
                print(input);
                print(widget._searchNode.hasFocus);
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: 3.5.w,
                ),
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
