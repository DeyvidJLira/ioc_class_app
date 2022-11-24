class Exchange {
  String coinName = "";
  String coinCode = "";
  double? bid = 0.0;
  double? percentChange = 0.0;

  Exchange(
      {required this.coinName,
      required this.coinCode,
      this.bid,
      this.percentChange});

  Exchange.fromJson(String code, Map<String, dynamic> json) {
    coinCode = json[code]['codein'];
    coinName = json[code]['name'].toString().split("/")[1];
    percentChange = double.parse(json[code]['pctChange']);
    bid = double.parse(json[code]['bid']);
  }

  @override
  bool operator ==(other) {
    return (other is Exchange) && other.coinCode == coinCode;
  }

  @override
  int get hashCode => coinCode.hashCode;
}
