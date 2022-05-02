class ModelCountries {
  String? name;
  String? currency;
  String? unicodeFlag;
  String? flag;
  String? dialCode;

  ModelCountries(
      {this.name, this.currency, this.unicodeFlag, this.flag, this.dialCode});

  ModelCountries.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    currency = json['currency'] ?? '';
    unicodeFlag = json['unicodeFlag'] ?? '';
    flag = json['flag'] ?? 'assets/images/no-image.svg';
    dialCode = json['dialCode'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['currency'] = currency;
    data['unicodeFlag'] = unicodeFlag;
    data['flag'] = flag;
    data['dialCode'] = dialCode;
    return data;
  }
}
