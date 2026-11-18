
import 'package:ulangan_ahmadkenziejavasniscala/Models/team_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FootballController extends GetxController {
  var isLoading = false.obs;

  var footballModel = Rxn<PremierLeagueModel>();
  var listTeam = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFootball();
  }

  // method hit API
  void getFootball() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League",
      );

      final response = await http.get(url);

      isLoading.value = false;
      if (response.statusCode == 200) {
        footballModel.value = premierLeagueModelFromJson(response.body);

        if (footballModel.value != null &&
            footballModel.value!.teams.isNotEmpty) {
          listTeam.value = footballModel.value!.teams;
        } else {
          Get.snackbar("Failed", "Data is empty");
        }
      } else {
        Get.snackbar("Failed", "Check internet connection");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Failed", e.toString());
    }
  }
}
