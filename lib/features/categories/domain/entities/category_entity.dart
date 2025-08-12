class CategoryEntity {
  final String id;
  final String name;
  final String imageUrl;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

List<CategoryEntity> getDummyCategories() {
  return [
    CategoryEntity(
      id: 'jubahMen',
      name: 'Jubah Men',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7qukz-lezwtlmi1ftgeb.webp',
    ),
    CategoryEntity(
      id: 'kurtaMen',
      name: 'Kurta Men',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7r98x-lsfj9hj0vn5j3d.webp',
    ),
    CategoryEntity(
      id: 'hajiAndUmrah',
      name: 'Haji & Umrahz',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7rask-m2ggej1b83i5fc.webp',
    ),
    CategoryEntity(
      id: 'sejadah',
      name: 'Sejadah',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7r98x-lsfj9hj0vn5j3d.webp',
    ),
    CategoryEntity(
      id: 'kopiah',
      name: 'Kopiah',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7rasj-m6dmiz81amlkd1.webp',
    ),
    CategoryEntity(
      id: 'ridak',
      name: 'Ridak',
      imageUrl:
          'https://down-my.img.susercontent.com/file/my-11134207-7rask-m6umkxwty1qx09.webp',
    ),
  ];
}
