import 'package:flutter/material.dart';
// import '../ControlScreen/control_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../../widgets/app_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../widgets/date_picker.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void navigat(BuildContext ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  void getData(String filter) {}

  void handleDateFrom() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Objects',
              //   style: TextStyle(fontSize: 18),
              // ),
              const SizedBox(
                height: 12,
              ),
              DropdownSearch<String>(
                maxHeight: 400,
                mode: Mode.MENU,
                showSearchBox: true,
                showSelectedItems: true,
                items: const ["R19", "R4", "Exara", 'BMW i8 Coupe'],
                label: "Objects List",
                hint: "country in menu mode",
                onChanged: print,
                selectedItem: "R19",
                // ignore: avoid_print
                // onFind: (filter) => {print('ffff');},
              ),
              const SizedBox(
                height: 12,
              ),
              // const Text(
              //   'Filter',
              //   style: TextStyle(fontSize: 18),
              // ),
              const SizedBox(
                height: 12,
              ),
              DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItems: true,
                items: const [
                  "Last Hour",
                  "Today",
                  "Yesterday",
                  'Befor 2 Days',
                  'Befor 3 Days',
                  'This week',
                  'Last week',
                  'This month',
                  'Last month'
                ],
                label: "Objects List",
                hint: "country in menu mode",
                onChanged: print,
                selectedItem: "Last Hour",
                // ignore: avoid_print
                // onFind: (filter) => {print('ffff');},
              ),
              const SizedBox(
                height: 18,
              ),
              // const Text(
              //   'Date',
              //   style: TextStyle(fontSize: 18),
              // ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 56,
                      child: DatePickerWidget(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                        ),
                        onPressed: handleDateFrom,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Date To',
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.timelapse_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              // const Text(
              //   'Time',
              //   style: TextStyle(fontSize: 18),
              // ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                        ),
                        onPressed: handleDateFrom,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Time From',
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.timelapse_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                        ),
                        onPressed: handleDateFrom,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Time To',
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.timelapse_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              // const Text(
              //   'Stop Duration',
              //   style: TextStyle(fontSize: 18),
              // ),
              const SizedBox(
                height: 12,
              ),
              DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItems: true,
                items: const [
                  "Last Hour",
                  "Today",
                  "Yesterday",
                  'Befor 2 Days',
                  'Befor 3 Days',
                  'This week',
                  'Last week',
                  'This month',
                  'Last month'
                ],
                label: "Objects List",
                hint: "country in menu mode",
                onChanged: print,
                selectedItem: "Last Hour",
                // ignore: avoid_print
                // onFind: (filter) => {print('ffff');},
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: handleDateFrom,
                  child: const Text('Show History'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
