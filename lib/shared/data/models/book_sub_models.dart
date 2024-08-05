class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['smallThumbnail'] = smallThumbnail;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class SaleInfo {
  String? country;
  String? buyLink;
  ListPrice? listPrice;

  SaleInfo({
    this.country,
    this.buyLink,
    this.listPrice,
  });

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    buyLink = json['buyLink'];
    listPrice = json['listPrice'] != null
        ? ListPrice.fromJson(json['listPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['country'] = country;
    data['buyLink'] = buyLink;
    if (listPrice != null) {
      data['listPrice'] = listPrice!.toJson();
    }

    return data;
  }
}

class ListPrice {
  num? amount;
  String? currencyCode;

  ListPrice({this.amount, this.currencyCode});

  ListPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class AccessInfo {
  String? country;
  Epub? epub;
  Pdf? pdf;
  String? accessViewStatus;

  AccessInfo({this.country, this.epub, this.pdf, this.accessViewStatus});

  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    epub = json['epub'] != null ? Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null;
    accessViewStatus = json['accessViewStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['country'] = country;
    if (epub != null) {
      data['epub'] = epub!.toJson();
    }
    if (pdf != null) {
      data['pdf'] = pdf!.toJson();
    }
    data['accessViewStatus'] = accessViewStatus;
    return data;
  }
}

class Epub {
  bool? isAvailable;
  String? downloadLink;

  Epub({this.isAvailable, this.downloadLink});

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    downloadLink = json['downloadLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAvailable'] = this.isAvailable;
    data['downloadLink'] = this.downloadLink;
    return data;
  }
}

class Pdf {
  bool? isAvailable;
  String? downloadLink;
  String? acsTokenLink;

  Pdf({this.isAvailable, this.downloadLink, this.acsTokenLink});

  Pdf.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    downloadLink = json['downloadLink'];
    acsTokenLink = json['acsTokenLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAvailable'] = this.isAvailable;
    data['downloadLink'] = this.downloadLink;
    data['acsTokenLink'] = this.acsTokenLink;
    return data;
  }
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['textSnippet'] = this.textSnippet;
    return data;
  }
}
