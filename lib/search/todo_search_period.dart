import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoSearchPeriod extends StatefulWidget {
  final String category;

  const TodoSearchPeriod({super.key, required this.category});

  @override
  State<TodoSearchPeriod> createState() => _TodoSearchPeriodState();
}

class _TodoSearchPeriodState extends State<TodoSearchPeriod> {
  DateTime? selectedStartDate = DateTime.now();
  DateTime? selectedEndDate = DateTime.now();

  Future<void> pickStartDate(context) async {
    DateTime? pickedStartDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));

    if (pickedStartDate != null) {
      setState(() {
        selectedStartDate = pickedStartDate;
      });
    }
  }

  Future<void> pickEndDate(context) async {
    DateTime? pickedEndDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));

    if (pickedEndDate != null) {
      setState(() {
        selectedEndDate = pickedEndDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              widget.category,
              style: TextStyle(color: blackColor, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(border: Border(left: BorderSide())),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => pickStartDate(context),
                  child: SizedBox(
                    height: 25,
                    child: Chip(
                      label: Align(
                        alignment: Alignment(0, -1),
                        child: Text(
                          DateFormat('yyyy/MM/dd').format(selectedStartDate!),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: blackColor),
                      ),
                      backgroundColor: whiteColor,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text('~', style: TextStyle(fontSize: 16),),
                ),
                GestureDetector(
                  onTap: () => pickEndDate(context),
                  child: SizedBox(
                    height: 25,
                    child: Chip(
                      label: Align(
                        alignment: Alignment(0, -1),
                        child: Text(
                          DateFormat('yyyy/MM/dd').format(selectedEndDate!),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: blackColor),
                      ),
                      backgroundColor: whiteColor,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
