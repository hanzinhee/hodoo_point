class PartnershipModel {
  final String name;
  final String title;
  final String imageUrl;
  final List<String>? tags;
  final Uri? siteUrl;
  final Uri? iosUrlScheme;
  final String? iosBundleId;
  final String? androidAppId;

  bool get isApp =>
      iosUrlScheme != null && iosBundleId != null && androidAppId != null;

  PartnershipModel(
      {required this.name,
      required this.title,
      required this.imageUrl,
      this.tags,
      this.siteUrl,
      this.iosUrlScheme,
      this.iosBundleId,
      this.androidAppId});

  factory PartnershipModel.calin() {
    return PartnershipModel(
        name: 'Calin',
        title: '트렌디한 제작상품 판매',
        imageUrl:
            'https://play-lh.googleusercontent.com/sDptUGcZJJ0IwJjtCj887XMpvrUJjZ54Gxl8qDjvsKZe7MBdpHU0m0QcuIKo4v-FSvI=w480-h960-rw',
        tags: ['제작상품'],
        androidAppId: 'com.blogpay.calin0928',
        iosUrlScheme: Uri.parse('calin0928://'),
        iosBundleId: '1545088750');
  }

  factory PartnershipModel.lupium() {
    return PartnershipModel(
      name: '루피움',
      title: '건강/뷰티 쇼핑몰',
      imageUrl: 'https://lupium.co.kr/_images/logo.png',
      siteUrl: Uri.parse('https://lupium.co.kr'),
      tags: ['뷰티'],
    );
  }
}
