import 'package:flutter/material.dart';

class DataTableWidgetScreen extends StatefulWidget {
  const DataTableWidgetScreen({super.key});

  @override
  State<DataTableWidgetScreen> createState() => _DataTableWidgetScreenState();
}

class _DataTableWidgetScreenState extends State<DataTableWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text("NO:"),
                ),
                DataColumn(
                  label: Text("Column-2"),
                ),
                DataColumn(
                  label: Text("Column-3"),
                ),
                DataColumn(
                  label: Text("Column-4"),
                ),
                DataColumn(
                  label: Text("Column-5"),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("1")),
                    DataCell(Text("cell-1")),
                    DataCell(Text("cell-1")),
                    DataCell(Text("cell-1")),
                    DataCell(Text("cell-1")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("2")),
                    DataCell(Text("cell-2")),
                    DataCell(Text("cell-2")),
                    DataCell(Text("cell-2")),
                    DataCell(Text("cell-2")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("3")),
                    DataCell(Text("cell-3")),
                    DataCell(Text("cell-3")),
                    DataCell(Text("cell-3")),
                    DataCell(Text("cell-3")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("4")),
                    DataCell(Text("cell-4")),
                    DataCell(Text("cell-4")),
                    DataCell(Text("cell-4")),
                    DataCell(Text("cell-4")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("5")),
                    DataCell(Text("cell-5")),
                    DataCell(Text("cell-5")),
                    DataCell(Text("cell-5")),
                    DataCell(Text("cell-5")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("6")),
                    DataCell(Text("cell-6")),
                    DataCell(Text("cell-6")),
                    DataCell(Text("cell-6")),
                    DataCell(Text("cell-6")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("7")),
                    DataCell(Text("cell-7")),
                    DataCell(Text("cell-7")),
                    DataCell(Text("cell-7")),
                    DataCell(Text("cell-7")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("8")),
                    DataCell(Text("cell-8")),
                    DataCell(Text("cell-8")),
                    DataCell(Text("cell-8")),
                    DataCell(Text("cell-8")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("9")),
                    DataCell(Text("cell-9")),
                    DataCell(Text("cell-9")),
                    DataCell(Text("cell-9")),
                    DataCell(Text("cell-9")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("10")),
                    DataCell(Text("cell-10")),
                    DataCell(Text("cell-10")),
                    DataCell(Text("cell-10")),
                    DataCell(Text("cell-10")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("11")),
                    DataCell(Text("cell-11")),
                    DataCell(Text("cell-11")),
                    DataCell(Text("cell-11")),
                    DataCell(Text("cell-11")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("12")),
                    DataCell(Text("cell-12")),
                    DataCell(Text("cell-12")),
                    DataCell(Text("cell-12")),
                    DataCell(Text("cell-12")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("13")),
                    DataCell(Text("cell-13")),
                    DataCell(Text("cell-13")),
                    DataCell(Text("cell-13")),
                    DataCell(Text("cell-13")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("14")),
                    DataCell(Text("cell-14")),
                    DataCell(Text("cell-14")),
                    DataCell(Text("cell-14")),
                    DataCell(Text("cell-14")),
                  ],
                ), DataRow(
                  cells: [
                    DataCell(Text("15")),
                    DataCell(Text("cell-15")),
                    DataCell(Text("cell-15")),
                    DataCell(Text("cell-15")),
                    DataCell(Text("cell-15")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
