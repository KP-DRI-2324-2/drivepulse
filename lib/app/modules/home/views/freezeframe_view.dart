import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/data/data_provider.dart';
import 'package:drivepulse/app/data/model/freezeframe_model.dart';
import 'package:flutter/material.dart';

class FreezeFrameView extends StatelessWidget {
  FreezeFrameView({super.key});
  List<FreezeFrameModel> freezeFrameList = getFreezeFrameList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.highlightColor,
        backgroundColor: themeData.primaryColor,
        title: const Text('Freeze Frame'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by title of pid',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // Handle filter button press
                  },
                ),
              ],
            ),
          ),
          Table(
              columnWidths: const {
                0: FixedColumnWidth(50),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(70),
              },
              border: const TableBorder(
                horizontalInside: BorderSide(width: 1, color: Colors.black),
                bottom: BorderSide(width: 1, color: Colors.black)
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: themeData.highlightColor),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'PID',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Value',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                for (var item in freezeFrameList) buildTableRow(item),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle download button press
        },
        backgroundColor: themeData.primaryColor,
        child: Icon(Icons.download, color: themeData.highlightColor,),
      ),
    );
  }

  TableRow buildTableRow(FreezeFrameModel model) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            model.pid,
            style: TextStyle(color: themeData.primaryColor, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            model.description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            model.value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
