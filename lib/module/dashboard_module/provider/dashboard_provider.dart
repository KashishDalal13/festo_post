import 'package:festo_post/app_export.dart';

class DashboardProvider extends ChangeNotifier {
  // DashboardProvider() {
  //   loadData();
  // }
  //
  // loadData() async {
  //   switchValue = await Injector.getTheme();
  // }

  int _current = 0, eventIndex = 0, trendingIndex = 0;
  late final List<String> selectedImageList;
  late final String selectedLabel;

  int get current => _current;

  final List<String> imgList = [SvgPath.carousel, SvgPath.carousel2, SvgPath.carousel3];

  List<Map<String, dynamic>> addDate = [
    {
      "label": "14 Oct",
      "imageList": [SvgPath.upcoming1, SvgPath.upcoming2, SvgPath.upcoming3]
    },
    {
      "label": "15 Oct",
      "imageList": [SvgPath.upcoming1, SvgPath.upcoming3, SvgPath.upcoming1, SvgPath.upcoming3, SvgPath.upcoming1]
    },
    {
      "label": "16 Oct",
      "imageList": [SvgPath.upcoming2, SvgPath.upcoming3]
    },
    {
      "label": "17 Oct",
      "imageList": [SvgPath.upcoming1, SvgPath.upcoming2]
    },
    {
      "label": "18 Oct",
      "imageList": [SvgPath.upcoming1, SvgPath.upcoming2, SvgPath.upcoming3]
    },
    {
      "label": "19 Oct",
      "imageList": [SvgPath.upcoming1, SvgPath.upcoming3]
    },
  ];

  List<Map<String, dynamic>> addTodayEvent = [
    {
      "label": StrRef.navratri,
      "imageList": [SvgPath.navratri1, SvgPath.navratri2, SvgPath.navratri1, SvgPath.navratri1, SvgPath.navratri1]
    },
    {
      "label": StrRef.coffee,
      "imageList": [SvgPath.coffee1, SvgPath.coffee2, SvgPath.coffee1, SvgPath.coffee1, SvgPath.coffee1]
    },
    {
      "label": StrRef.birthday,
      "imageList": [SvgPath.bday1, SvgPath.bday2, SvgPath.bday1, SvgPath.bday1, SvgPath.bday1]
    },
  ];

  List<Map<String, dynamic>> addTrendingEvent = [
    {
      "label": "Shramdaan",
      "imageList": [SvgPath.trend1, SvgPath.trend2, SvgPath.trend3, SvgPath.trend3, SvgPath.trend3]
    },
    {
      "label": "Sports",
      "imageList": [SvgPath.coffee1, SvgPath.coffee2, SvgPath.coffee1]
    },
    {
      "label": "Gold Medal",
      "imageList": [SvgPath.bday1, SvgPath.bday2, SvgPath.bday1]
    },
    {
      "label": "Politics",
      "imageList": [SvgPath.bday1, SvgPath.bday2, SvgPath.bday1]
    },
  ];

  List<Map<String, dynamic>> addSeasonOffers = [
    {"imageList": SvgPath.festiveOffer1, "label": "Navratri Offer"},
    {"imageList": SvgPath.festiveOffer2, "label": "Dussehra Offers"},
    {"imageList": SvgPath.festiveOffer3, "label": "Diwali Sale & Offers"},
    {"imageList": SvgPath.festiveOffer4, "label": "All Offers"},
    {"imageList": SvgPath.festiveOffer4, "label": "All Offers"},
    {"imageList": SvgPath.festiveOffer4, "label": "All Offers"}
  ];

  List<Map<String, dynamic>> addCategoryOffer = [
    {
      "label": "Offers and Sale",
      "imageList": [SvgPath.offerSale1, SvgPath.offerSale2, SvgPath.offerSale3, SvgPath.offerSale1, SvgPath.offerSale2]
    },
    {
      "label": "Quotes",
      "imageList": [SvgPath.quotes1, SvgPath.quotes2, SvgPath.quotes3, SvgPath.quotes1, SvgPath.quotes2]
    },
    {
      "label": "Greetings and Congratulatory",
      "imageList": [SvgPath.gretting1, SvgPath.gretting2, SvgPath.gretting3, SvgPath.gretting1, SvgPath.gretting2]
    },
    {
      "label": "Morning Wishes",
      "imageList": [SvgPath.MorningWish1, SvgPath.MorningWish2, SvgPath.MorningWish3, SvgPath.MorningWish1, SvgPath.MorningWish2]
    },
    {
      "label": "Rest In Peace",
      "imageList": [SvgPath.RestPeace1, SvgPath.RestPeace2, SvgPath.RestPeace3, SvgPath.RestPeace2, SvgPath.RestPeace1, SvgPath.RestPeace3, SvgPath.RestPeace2, SvgPath.RestPeace1]
    },
  ];

  onSelectDate({required int index}) {
    eventIndex = index;
    notifyListeners();
  }

  onSelectTrending({required int index}) {
    trendingIndex = index;
    notifyListeners();
  }

  void indicator(int index) {
    _current = index;
    notifyListeners();
  }

  void onPageChanged(int index) {
    indicator(index);
  }

  onProfile() {
    NavigationService.routeToNamed('profile');
  }

  void onViewAll(BuildContext context, {required int index}) {
    if (index == 0) {
      selectedLabel = addTodayEvent[index]["label"];
      selectedImageList = addTodayEvent[index]["imageList"].cast<String>();
    } else if (index == 1) {
      selectedLabel = addTodayEvent[index]["label"];
      selectedImageList = addTodayEvent[index]["imageList"].cast<String>();
    } else if (index == 2) {
      selectedLabel = addTodayEvent[index]["label"];
      selectedImageList = addTodayEvent[index]["imageList"].cast<String>();
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FrameEditorView(imageList: selectedImageList, label: selectedLabel),
      ),
    );
  }
  void onViewAllOffer(BuildContext context, {required int index}) {
    if (index == 0) {
      selectedLabel = addCategoryOffer[index]["label"];
      selectedImageList = addCategoryOffer[index]["imageList"].cast<String>();
    } else if (index == 1) {
      selectedLabel = addCategoryOffer[index]["label"];
      selectedImageList = addCategoryOffer[index]["imageList"].cast<String>();
    } else if (index == 2) {
      selectedLabel = addCategoryOffer[index]["label"];
      selectedImageList = addCategoryOffer[index]["imageList"].cast<String>();
    }else if (index == 3) {
      selectedLabel = addCategoryOffer[index]["label"];
      selectedImageList = addCategoryOffer[index]["imageList"].cast<String>();
    }else if (index == 4) {
      selectedLabel = addCategoryOffer[index]["label"];
      selectedImageList = addCategoryOffer[index]["imageList"].cast<String>();
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FrameEditorView(imageList: selectedImageList, label: selectedLabel),
      ),
    );
  }
  void onViewAllTrending(BuildContext context, {required int index}) {
    if (index >= 0 && index < addTrendingEvent.length) {
      selectedLabel = addTrendingEvent[index]["label"];
      selectedImageList = addTrendingEvent[index]["imageList"].cast<String>();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FrameEditorView(imageList: selectedImageList, label: selectedLabel),
        ),
      );
    }
  }
}
