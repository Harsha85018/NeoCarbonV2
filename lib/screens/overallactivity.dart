import 'package:flutter/material.dart';

class OverallActivityScreen extends StatelessWidget {
  final double overallEmissions;

  const OverallActivityScreen({Key? key, required this.overallEmissions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overall Activity'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Column(
            children: [
              const Text('OVERALL EMISSIONS', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                '${overallEmissions.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('SINCE START', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('ACTIVITY HISTORY',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Activity ${index + 1}'),
                          subtitle: const Text('Carbon Emissions: 10.5 kg'),
                          trailing: Text('${(index + 1) * 10} days ago'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
