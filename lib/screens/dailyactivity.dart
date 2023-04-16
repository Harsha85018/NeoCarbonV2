import 'package:flutter/material.dart';

class DailyActivityScreen extends StatelessWidget {
  const DailyActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Activity'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('DAILY EMISSIONS', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  const Text('3.2',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('TODAY', style: TextStyle(fontSize: 16)),
                ],
              ),
              Column(
                children: [
                  const Text('OVERALL EMISSIONS',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  const Text('98.5',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('SINCE START', style: TextStyle(fontSize: 16)),
                ],
              ),
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
                  const Text('TODAY\'S ACTIVITY',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Activity ${index + 1}'),
                          subtitle: const Text('Carbon Emissions: 1.2 kg'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ADD ACTIVITY'),
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
