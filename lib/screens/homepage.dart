import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_details/models/data.dart';
import 'package:insta_details/utils/custom_dio_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CustomDioMixin {
  bool loading = true;
  bool error = false;
  List<Media> media = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : error
                    ? const Center(
                        child: Text('An error has occurred!'),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          print("media n° $index ${media[index].mediaUrl}");
                          return MediaWidget(
                            media: media[index],
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Future<void> getData() async {
    try {
      final storage = GetStorage();
      final token = storage.read("accessToken");

      final response = await dio.get(
        'https://graph.instagram.com/me/media?fields=id,caption,media_url,timestamp&access_token=$token',
      );
      print("get data response => ${response.statusCode} ${response.data}");
      if (response.statusCode.toString().startsWith('2')) {
        media = Medias.fromMap(response.data).data;
      }
    } catch (e) {
      print("get data failed");
      print(e);
      setState(() {
        error = true;
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}

class MediaWidget extends StatelessWidget {
  final Media? media;
  const MediaWidget({Key? key, required this.media}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: GridView.builder(
        shrinkWrap: true, //
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return media != null && media!.mediaUrl != ""
              ? Image.network(media!.mediaUrl)
              : SizedBox.shrink();
        },
      ),
    );
  }
}
// well, as u can see i cant get the media url. it's null. why is that happenning?