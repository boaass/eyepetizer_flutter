class ZCLFloatEntrance {
  ZCLFloatEntrance({
    this.type,
    this.image,
    this.position,
    this.redirectUrl,
  });

  String? type;
  Image? image;
  String? position;
  String? redirectUrl;

  factory ZCLFloatEntrance.fromJson(Map<String, dynamic> json) => ZCLFloatEntrance(
    type: json["type"] == null ? null : json["type"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    position: json["position"] == null ? null : json["position"],
    redirectUrl: json["redirect_url"] == null ? null : json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "image": image == null ? null : image!.toJson(),
    "position": position == null ? null : position,
    "redirect_url": redirectUrl == null ? null : redirectUrl,
  };
}

class Image {
  Image({
    this.type,
    this.url,
    this.body,
    this.imageInfo,
  });

  String? type;
  String? url;
  String? body;
  ImageInfo? imageInfo;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    type: json["type"] == null ? null : json["type"],
    url: json["url"] == null ? null : json["url"],
    body: json["body"] == null ? null : json["body"],
    imageInfo: json["image_info"] == null ? null : ImageInfo.fromJson(json["image_info"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "url": url == null ? null : url,
    "body": body == null ? null : body,
    "image_info": imageInfo == null ? null : imageInfo!.toJson(),
  };
}

class ImageInfo {
  ImageInfo({
    this.width,
    this.height,
    this.scale,
  });

  int? width;
  int? height;
  int? scale;

  factory ImageInfo.fromJson(Map<String, dynamic> json) => ImageInfo(
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    scale: json["scale"] == null ? null : json["scale"],
  );

  Map<String, dynamic> toJson() => {
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "scale": scale == null ? null : scale,
  };
}
