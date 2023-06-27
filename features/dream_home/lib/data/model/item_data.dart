class ItemData {
  final String ratting;
  final String name;
  final String location;
  final String price;
  final String per;
  final String description;
  final String url;

  ItemData(
      {required this.ratting,
      required this.name,
      required this.location,
      required this.price,
      required this.per,
      required this.description,
      required this.url});
}

final items = [
  ItemData(
    url: 'https://www.grollohomes.com.au/wp-content/uploads/2020/05/Grollo-Belmore-140.jpg',
      ratting: '8.2',
      name: "Take the Interior Tour",
      location: 'Thai',
      price: '\$1200.0',
      per: "Per Month",
      description:
          'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
  ItemData(
    url: 'https://www.hgtv.com/content/dam/images/hgtv/fullset/2022/11/10/0/dh23_front-yard-whole-house-high-DJI_0051_h.jpg',
      ratting: '6.2',
      name: "TGuest Bedroom Suites",
      location: 'Thai',
      price: '\$1920.0',
      per: "Per Month",
      description:
      'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
  ItemData(
    url: 'https://24housing.co.uk/wp-content/uploads/2018/03/dream-home.jpg',
      ratting: '10.2',
      name: "Hardworking Spaces",
      location: 'Thai',
      price: '\$2000.0',
      per: "Per Month",
      description:
      'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
  ItemData(
    url: 'https://amazingarchitecture.com/storage/1207/dream-house.jpg',
      ratting: '5.2',
      name: "Pet Station Inspiration",
      location: 'Thai',
      price: '\$1800.0',
      per: "Per Month",
      description:
      'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
  ItemData(
    url: 'https://www.residencestyle.com/wp-content/uploads/2020/09/Dream-Home.jpeg',
      ratting: '8.2',
      name: "TCozy Nooks",
      location: 'Thai',
      price: '\$1200.0',
      per: "Per Month",
      description:
      'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
  ItemData(
    url: 'https://img.freepik.com/premium-photo/luxury-modern-house-clouds-dream-home-3d-render-illustration_691560-6152.jpg',
      ratting: '10',
      name: "Homes in Colorado",
      location: 'Thai',
      price: '\$1200.0',
      per: "Per Month",
      description:
      'Discover beautiful Colorado-inspired interiors at HGTV Dream Home 2023 and shop your favorite products from Wayfair®.'),
];
