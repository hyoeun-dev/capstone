import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class TodoSearchChoices extends StatefulWidget {
  final String category;
  final List<String> optionList;
  final String? selectedValue;
  const TodoSearchChoices({super.key, required this.category, required this.optionList, this.selectedValue});

  @override
  State<TodoSearchChoices> createState() => _TodoSearchChoicesState();
}

class _TodoSearchChoicesState extends State<TodoSearchChoices> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            margin: EdgeInsets.only(right: 10),
            child: Text(widget.category, style: Theme.of(context).textTheme.titleMedium,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10),
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
