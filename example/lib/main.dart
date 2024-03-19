import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction(
    (notification) {
      return true;
    },
  );

  runApp(
    NeumorphicTheme(
      theme: NeumorphicThemeData(
        intensity: 0.8,
        lightSource: LightSource.topLeft,
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AssetsAudioPlayer _assetsAudioPlayer;
  final audios = <Audio>[
    Audio(
      'assets/audios/rock.mp3',
      metas: Metas(
        id: 'Rock',
        title: 'Rock',
        artist: 'Florent Champigny',
        album: 'RockAlbum',
        image: MetasImage.network(
          'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png',
        ),
      ),
    ),
    Audio(
      'assets/audios/2 country.mp3',
      metas: Metas(
        id: 'Country',
        title: 'Country',
        artist: 'Florent Champigny',
        album: 'CountryAlbum',
        image: MetasImage.asset('assets/images/country.jpg'),
      ),
    ),
    Audio(
      'assets/audios/electronic.mp3',
      metas: Metas(
        id: 'Electronics',
        title: 'Electronic',
        artist: 'Florent Champigny',
        album: 'ElectronicAlbum',
        image: MetasImage.network(
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/hiphop.mp3',
      metas: Metas(
        id: 'Hiphop',
        title: 'HipHop',
        artist: 'Florent Champigny',
        album: 'HipHopAlbum',
        image: MetasImage.network(
          'https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/pop%20test.mp3',
      metas: Metas(
        id: 'Pop',
        title: 'Pop',
        artist: 'Florent Champigny',
        album: 'PopAlbum',
        image: MetasImage.network(
          'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg',
        ),
      ),
    ),
    Audio(
      'assets/audios/instrumental.mp3',
      metas: Metas(
        id: 'Instrumental',
        title: 'Instrumental',
        artist: 'Florent Champigny',
        album: 'InstrumentalAlbum',
        image: MetasImage.network(
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg',
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    // openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.all(18),
                      onPressed: () {
                        _assetsAudioPlayer.open(
                          Audio('assets/audios/horn.mp3'),
                          autoStart: true,
                        );
                      },
                      child: Icon(
                        Icons.add_alert,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
