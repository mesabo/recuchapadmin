class ServicesModel {
  final int id;
  final String title;
  final double price;
  final int duration;
  final String description;
  final String createdat;
  final String updatedat;
  final String inprogresss;

  ServicesModel({
    this.id = 0,
    this.title = '',
    this.price = 0,
    this.duration = 0,
    this.description = '',
    this.createdat = '',
    this.updatedat = '',
    this.inprogresss = '',
  });

  ServicesModel.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        title = map['title'] as String,
        price = map['price'] as double,
        duration = map['duration'] as int,
        description = map['description'] as String,
        createdat = map['created_at'] as String,
        updatedat = map['updated_at'] as String,
        inprogresss = map['inprogresss'] as String;

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'title': title,
        'price': price,
        'duration': duration,
        'description': description,
        'created_at': updatedat,
        'updated_at': updatedat,
        'inprogresss': inprogresss
      };

  @override
  String toString() {
    return '{ ${this.id},${this.title},${this.price},${this.duration},${this.description},${this.createdat},${this.updatedat},${this.inprogresss},}';
  }
}
