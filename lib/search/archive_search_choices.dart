import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class ArchiveSearchChoices extends StatefulWidget {
  final String category;
  final List<String> optionList;
  final String? selectedValue;
  final bool isFavorite;
  const ArchiveSearchChoices({super.key, required this.category, required this.optionList, this.selectedValue, required this.isFavorite});

  @override
  State<ArchiveSearchChoices> createState() => _ArchiveSearchChoicesState();
}

class _ArchiveSearchChoicesState extends State<ArchiveSearchChoices> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (widget.isFavorite == false) ? Container(
            margin: EdgeInsets.only(right: 2),
            child: Text(widget.category, style: Theme.of(context).textTheme.titleMedium,),
          ) : SizedBox(),
          Expanded(
            child: Container(
              padding: (widget.isFavorite == false) ? EdgeInsets.only(left: 10) : EdgeInsets.zero,
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 10,
                runSpacing: 5,
                children: widget.optionList.map((String itemValue) {
                  return ChoiceChip(
                    label: Text(
                      itemValue,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: _selectedValue == itemValue ? whiteColor : blackColor,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    selectedColor: ColorPalette.accentColors['blue'],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: mediumGreyColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: whiteColor,
                    shadowColor: Colors.transparent,
                    showCheckmark: false,
                    selected: _selectedValue == itemValue,
                    onSelected: (_) {
                      if(_selectedValue == itemValue) {
                        setState(() {
                          _selectedValue = null;
                        });
                      } else {
                        setState(() {
                          _selectedValue = itemValue;
                        });
                      }
                    },
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
