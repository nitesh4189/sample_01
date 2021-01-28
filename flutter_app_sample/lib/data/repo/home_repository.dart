import 'package:flutter_app_sample/data/provider/api_provider.dart';
import 'package:flutter_app_sample/data/repo/home_data.dart';
import 'package:flutter_app_sample/data/repo/home_response_model.dart';

class HomeRepository {
  Future<List<HomeDataList>> fetchListResponse(
      {bool twoDataRequired,
      bool threeDataRequired,
      bool allDataRequired}) async {
    List<HomeDataList> _homeData;
    try {
      String apiResponse = await ApiProvider().getListResponse();

      if (apiResponse != null) {
        List<HomeResponse> _list = homeResponseFromMap(apiResponse);
        _homeData = mapHomeData(_list,
            twoDataRequired: twoDataRequired,
            threeDataRequired: threeDataRequired,
            allDataRequired: allDataRequired);
      }
      return _homeData;
    } catch (e) {
      return _homeData;
    }
  }

  List<HomeDataList> mapHomeData(List<HomeResponse> list,
      {bool twoDataRequired, bool threeDataRequired, bool allDataRequired}) {
    List<HomeDataList> _homeDataList = [];
    int dataRequired = 0;

    try {
      if (twoDataRequired) {
        dataRequired = 2;
      } else if (threeDataRequired) {
        dataRequired = 3;
      } else {
        dataRequired = list?.length;
      }
      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < dataRequired; i++) {
          HomeDataList homeData = HomeDataList();
          homeData.name = list[i]?.login;
          homeData.url = list[i]?.avatarUrl;
          _homeDataList.add(homeData);
        }
      }
    } catch (e) {}
    return _homeDataList;
  }
}
