import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';

class MusicController extends GetxController {
  var downloadSong = <String>[].obs;
  final AudioPlayer _audioPlayer = AudioPlayer();

  RxBool isPlaying = false.obs;
  var isFavorite = false.obs;
  RxString currentSongPath = ''.obs;
  var isDownloading = false.obs;
  var downloadProgress = 0.0.obs;
  var isDeleted = false.obs;

  var favoriteSong = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestStoragePermission().then((granted) {
      if (granted) {
        loadDownloadedSongs();
        retrieveFromLocal();
      }
    });
  }

  Future<void> setupAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
  }

  Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      Get.snackbar("Permission Required", "Storage permission is required to download songs.",
          snackPosition: SnackPosition.BOTTOM);
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    return false;
  }

  Future<void> downloadFromAsset(String assetPath, String fileName) async {
    bool permissionGranted = await requestStoragePermission();
    if (!permissionGranted) return;

    try {
      isDownloading.value = true;

      final musicFolder = Directory('/storage/emulated/0/Download/MyMusic/');
      if (!await musicFolder.exists()) {
        await musicFolder.create();
      }

      print("===========>${assetPath}");
      final savePath = "${musicFolder.path}/$fileName";
      final newFile = File(savePath);

      final songData = await rootBundle.load(assetPath);
      final songBytes = songData.buffer.asUint8List();

      await newFile.writeAsBytes(songBytes);

      Get.snackbar(
        'Success',
        'Song saved!',
        snackPosition: SnackPosition.TOP,
      );

      addSong(savePath);
    } catch (error) {
      Get.snackbar('Error', 'Could not save song', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isDownloading.value = false;
    }
  }

  void loadDownloadedSongs() async {
    final musicFolder = Directory('/storage/emulated/0/Download/MyMusic');
    if (await musicFolder.exists()) {
      List<FileSystemEntity> files = musicFolder.listSync();
      downloadSong.assignAll(
          files.where((file) => file.path.endsWith('.mp3')).map((file) => file.path).toList());
    }
  }

  void saveDownloadedSongs() {
    StorageObject.write(StorageKey.download, downloadSong);
  }

  void addSong(String songPath) {
    if (!downloadSong.contains(songPath)) {
      downloadSong.add(songPath);
      saveDownloadedSongs();
    }
  }

  Future<void> togglePlayPause(String songPath) async {
    if (isPlaying.value && currentSongPath.value == songPath) {
      await _audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await _audioPlayer.stop();

      try {
        await _audioPlayer.setAudioSource(
          AudioSource.asset(
            songPath,
            tag: MediaItem(
              id: songPath,
              album: "My Music",
              title: songPath.split('/').last.replaceAll('.mp3', ''),
              artist: "Unknown",
              artUri: Uri.parse('https://example.com/album_art.jpg'), // Thumbnail (Optional)
            ),
          ),
        );

        await _audioPlayer.play();
        currentSongPath.value = songPath;
        isPlaying.value = true;
      } catch (e) {
        debugPrint("❌ Error playing song: $e");
      }
    }
  }

  // Future<void> togglePlayPause(String songPath) async {
  //   bool isAsset = songPath.startsWith("assets/");
  //
  //   try {
  //     // If the song is already playing and it's the same song, pause it
  //     if (isPlaying.value && currentSongPath.value == songPath) {
  //       await _audioPlayer.pause();
  //       isPlaying.value = false;
  //     } else {
  //       // Stop the previous song and reset the player
  //       await _audioPlayer.stop();
  //       await _audioPlayer.seek(Duration.zero);
  //
  //       // Load the new song (asset or file path)
  //       if (isAsset) {
  //         await _audioPlayer.setAsset(songPath);
  //       } else {
  //         await _audioPlayer.setFilePath(songPath);
  //       }
  //
  //       // Set volume to max
  //       await _audioPlayer.setVolume(1.0);
  //
  //       // Play the new song
  //       await _audioPlayer.play();
  //
  //       // Update state after the song starts playing
  //       currentSongPath.value = songPath;
  //       isPlaying.value = true; // Immediately update the state to reflect playing status
  //     }
  //     update();
  //   } catch (e) {
  //     debugPrint("❌ Error playing song: $e");
  //   }
  // }

  void removeSong(String songPath) async {
    if (downloadSong.contains(songPath)) {
      File file = File(songPath);
      if (await file.exists()) {
        await file.delete();
      }
      downloadSong.remove(songPath);
      saveDownloadedSongs();
      isDeleted.value = true;
    }
  }

  void storeInLocal() {
    StorageObject.write(StorageKey.favorite, favoriteSong);
  }

  void retrieveFromLocal() {
    var storedSongs = StorageObject.read(StorageKey.favorite);
    if (storedSongs != null) {
      favoriteSong.assignAll(List<String>.from(storedSongs));
    }
  }

  void addToFavorite(String songPath) {
    if (!favoriteSong.contains(songPath)) {
      favoriteSong.add(songPath);
      storeInLocal();
      isFavorite.value = true;
    } else {
      favoriteSong.remove(songPath);
      storeInLocal();
      isFavorite.value = false;
    }
  }

  void removeFromFavorite(int index) {
    if (index < favoriteSong.length) {
      favoriteSong.removeAt(index);
      storeInLocal();
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
