import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class ArchiveSearchChoices extends StatefulWidget {
  final String category;
  final List<String> optionList;
  String? selectedValue;
  bool isFavorite;
  ArchiveSearchChoices({super.key, required this.category, required this.optionList, required this.selectedValue, required this.isFavorite});

  @override
  State<ArchiveSearchChoices> createState() => _ArchiveSearchChoicesState();
}

class _ArchiveSearchChoicesState extends State<ArchiveSearchChoices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.isFavorite == false) ? Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(widget.category, style: TextStyle(color: blackColor, fontSize: 18),),
          ) : SizedBox(),
          Expanded(
            child: Container(
              padding: (widget.isFavorite == false) ? EdgeInsets.only(left: 10) : EdgeInsets.zero,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: (widget.isFavorite == false) ? Border(left: BorderSide()) : Border.fromBorderSide(BorderSide.none),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: widget.optionList.map((String itemValue) {
                  return UnconstrainedBox(
                    child: SizedBox(
                      height: 25,
                      child: ChoiceChip(
                        label: Align(
                          alignment: Alignment(0, -0.5),
                          child: Text(itemValue, style: TextStyle(
                              fontSize: 16,
                          ),),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        selectedColor: ColorPalette.accentColors['yellow'],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: blackColor),
                        ),
                        backgroundColor: whiteColor,
                        shadowColor: Colors.transparent,
                        showCheckmark: false,
                        selected: widget.selectedValue == itemValue,
                        onSelected: (_) {
                          if(widget.selectedValue == itemValue) {
                            setState(() {
                              widget.selectedValue = null;
                            });
                          } else {
                            setState(() {
                              widget.selectedValue = itemValue;
                            });
                          }
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
