import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  var date;

  String getText() {
    if (date == null) {
      return 'Date From';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.black),
        ),
        onPressed: () => pickDate(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getText(),
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(
              Icons.timelapse_outlined,
              color: Colors.black,
            )
          ],
        ),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
