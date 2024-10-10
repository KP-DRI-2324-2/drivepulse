import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:flutter/material.dart';

class AllServiceView extends StatelessWidget {
  const AllServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('All Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildServiceSection('Main Services', [
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.dashboard, 'Dashboard'),
                _buildServiceIcon(Icons.show_chart, 'Line Chart'),
                _buildServiceIcon(Icons.camera, 'Freeze'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.swap_horiz, 'Change'),
              ]),
              const SizedBox(height: 10),
              _buildServiceSection('Other Services', [
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
                _buildServiceIcon(Icons.monitor, 'Monitoring'),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceSection(String title, List<Widget> icons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: icons,
        ),
      ],
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40, color: themeData.primaryColor),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: regularText10,),
      ],
    );
  }
}