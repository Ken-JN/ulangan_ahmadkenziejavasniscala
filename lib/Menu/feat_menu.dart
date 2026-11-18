import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Controller/football_controller.dart';
import 'package:get/get.dart';

class FeatMenu extends StatelessWidget {
  FeatMenu({super.key});

  final controller = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("English Premier League")),
      body: Container(
        margin: const EdgeInsets.all(18),
        height: 190,
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTeam.length,
                  itemBuilder: (context, index) {
                    final team = controller.listTeam[index];

                    return Card(
                      elevation: 10,
                      child: Container(
                        width: 260,
                        margin: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              team.strBadge,
                              height: 50,
                              width: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.sports_soccer, size: 40);
                              },
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "#${team.strTeam}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Points: ${team.strStadium}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
