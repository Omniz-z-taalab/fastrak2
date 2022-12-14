class ApiCollectAmount {
  Coast coast;

  ApiCollectAmount({this.coast});

  ApiCollectAmount.fromJson(Map<String, dynamic> json) {
    coast = json['data'] != null ? new Coast.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coast != null) {
      data['data'] = this.coast.toJson();
    }
    return data;
  }
}

class Coast {
  dynamic moneyCollected;
  dynamic insuranceFees;
  dynamic shippingFees;
  dynamic moneyCollectedFees;
  dynamic vat;
  dynamic shippingFeesDiscount;
  dynamic totalShippingFees;

  Coast(
      {this.moneyCollected,
        this.insuranceFees,
        this.shippingFees,
        this.moneyCollectedFees,
        this.vat,
        this.shippingFeesDiscount,
        this.totalShippingFees});

  Coast.fromJson(Map<String, dynamic> json) {
    print(json);
    print(json['money_collected']);
    print(json['total_shipping_fees']);
    moneyCollected = json['money_collected'];
    print(json['money_collected']);
    insuranceFees = json['insurance_fees'];
    print(json['insurance_fees']);
    shippingFees = json['shipping_fees'];
    print(json['shipping_fees']);
    moneyCollectedFees = json['money_collected_fees'];
    print(json['money_collected_fees']);
    vat = json['vat'];
    shippingFeesDiscount = json['shipping_fees_discount'];
    totalShippingFees = json['total_shipping_fees'];
     print(totalShippingFees.toString() + 'yaaaaaraaaab');

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['money_collected'] = this.moneyCollected;
    data['insurance_fees'] = this.insuranceFees;
    data['shipping_fees'] = this.shippingFees;
    data['money_collected_fees'] = this.moneyCollectedFees;
    data['vat'] = this.vat;
    data['shipping_fees_discount'] = this.shippingFeesDiscount;
    data['total_shipping_fees'] = this.totalShippingFees;
    return data;
  }
}