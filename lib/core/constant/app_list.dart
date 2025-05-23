import 'package:flutter/material.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/key/song_key.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/view/home/home_page/home_screen.dart';
import 'package:musiumapplication/view/home/library_page/library_screen.dart';
import 'package:musiumapplication/view/home/logout/logout_screen.dart';

class Song {
  final String image;
  final String category;
  final String song;
  final String songName;
  final String artistsImage;
  final String artistsName;

  Song({
    required this.image,
    required this.category,
    required this.song,
    required this.songName,
    required this.artistsImage,
    required this.artistsName,
  });
}

class YourTopMixes {
  final String image;
  final String label;
  final Color color;

  YourTopMixes({
    required this.image,
    required this.label,
    required this.color,
  });
}

class BasedOnYourRecentListening {
  final String image;

  BasedOnYourRecentListening({required this.image});
}

class Filter {
  final String name;

  Filter({required this.name});
}

class AppList {
  static List<Song> songList = [
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.humMarJayengeLofi,
      songName: "hum Mar JayengeLofi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.abKishDishJauSadLoFi,
      songName: "ab Kish Dish Jau Sad LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.bebePapuLoFi,
      songName: "bebe Papu LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.darasalLofiKritimanMishraLoFi,
      songName: "Darasal Lofi Kriti man Mishra LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.kyuNaHumTumLoFi,
      songName: "Kyu Na Hum Tum LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.manMeraLoFi,
      songName: "Man Mera LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.rabbManyeLoFi,
      songName: "Rabb Manye LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Jazz Band",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.tashanLoFi,
      songName: "Tashan LoFi",
      artistsImage: "Conan Gray",
      artistsName: "Pop Star",
    ),
    Song(
      image: AppImagesKey.loFiBeats,
      category: AppString.loFiBeats,
      song: SongKey.tereBinLoFiMix,
      songName: "Tere Bin LoFi Mix",
      artistsImage: "Conan Gray",
      artistsName: "Pop Star",
    ),
    Song(
      image: AppImagesKey.animeOSTs,
      category: AppString.english,
      song: SongKey.intoYourArmsEnglish,
      songName: "Into Your Arms English",
      artistsImage: "Conan Gray",
      artistsName: "Anime Composer",
    ),
    Song(
      image: AppImagesKey.animeOSTs,
      category: AppString.english,
      song: SongKey.girlsLikeYouFluteEnglish,
      songName: "Girls Like You Flute English",
      artistsImage: "Conan Gray",
      artistsName: "Harry Styles",
    ),
    Song(
      image: AppImagesKey.animeOSTs,
      category: AppString.english,
      song: SongKey.laLaLaayEnglish,
      songName: "La La Laay English",
      artistsImage: "Conan Gray",
      artistsName: "Lo-Fi Producer",
    ),
    Song(
      image: AppImagesKey.animeOSTs,
      category: AppString.english,
      song: SongKey.perfectEnglish,
      songName: "perfect English",
      artistsImage: "Conan Gray",
      artistsName: "Lo-Fi Producer",
    ),
    Song(
      image: AppImagesKey.animeOSTs,
      category: AppString.english,
      song: SongKey.sweetPyschoEnglish,
      songName: "Sweet Pyscho English",
      artistsImage: "Conan Gray",
      artistsName: "Lo-Fi Producer",
    ),
    Song(
      image: AppImagesKey.harryHouse,
      category: AppString.mix,
      song: SongKey.khudaJaneChildMix,
      songName: "khuda Jane Child Mix",
      artistsImage: "Conan Gray",
      artistsName: "Lo-Fi Producer",
    ),
    Song(
      image: AppImagesKey.harryHouse,
      category: AppString.mix,
      song: SongKey.childMixChillarMix,
      songName: "childMixChillarMix",
      artistsImage: "Conan Gray",
      artistsName: "Lo-Fi Producer",
    ),
  ];
  static List<YourTopMixes> yourTopMixes = [
    YourTopMixes(
      image: AppImagesKey.popMix,
      label: AppString.popMix,
      color: AppColors.rectangle1,
    ),
    YourTopMixes(
      image: AppImagesKey.chillMix,
      color: AppColors.rectangle2,
      label: AppString.chillMix,
    ),
    YourTopMixes(
      image: AppImagesKey.kPop,
      label: AppString.kPop,
      color: AppColors.rectangle3,
    ),
  ];
  static List<YourTopMixes> yourTopGenres = [
    YourTopMixes(
      image: AppImagesKey.kPop2,
      label: AppString.kPop2,
      color: AppColors.kPopBGColor,
    ),
    YourTopMixes(
      image: AppImagesKey.indie,
      color: AppColors.indie,
      label: AppString.indie,
    ),
    YourTopMixes(
      image: AppImagesKey.rAndB,
      label: AppString.rAndB,
      color: AppColors.rAndB,
    ),
    YourTopMixes(
      image: AppImagesKey.pop,
      label: AppString.pop,
      color: AppColors.pop,
    ),
  ];
  static List<YourTopMixes> browseAll = [
    YourTopMixes(
      image: AppImagesKey.madeForYou,
      label: AppString.madeForYou,
      color: AppColors.madeForYou,
    ),
    YourTopMixes(
      image: AppImagesKey.released2,
      color: AppColors.released2,
      label: AppString.released,
    ),
    YourTopMixes(
      image: AppImagesKey.musicCharts,
      label: AppString.musicCharts,
      color: AppColors.musicCharts,
    ),
    YourTopMixes(
      image: AppImagesKey.podcasts,
      label: AppString.podcasts,
      color: AppColors.podcasts,
    ),
    YourTopMixes(
      image: AppImagesKey.bollywood,
      label: AppString.bollywood,
      color: AppColors.bollywood,
    ),
    YourTopMixes(
      image: AppImagesKey.popFusion,
      label: AppString.popFusion,
      color: AppColors.popFusion,
    ),
  ];

  static List<BasedOnYourRecentListening> basedOnYourRecentListening = [
    BasedOnYourRecentListening(
      image: AppImagesKey.basedOnYourRecentListening2,
    ),
    BasedOnYourRecentListening(
      image: AppImagesKey.basedOnYourRecentListening1,
    )
  ];

  static List<Filter> filter = [
    Filter(name: AppString.folders),
    Filter(name: AppString.playlists),
    Filter(name: AppString.artists),
    Filter(name: AppString.albums),
    Filter(name: AppString.podcastsShows),
  ];

  static List pages = [
    const HomeScreen(),
    // const ExploreScreen(),
    const LibraryScreen(),
    const LogoutScreen(),
  ];
}
