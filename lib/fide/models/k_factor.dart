

enum KFactor {
  k40,
  k30,
  k20,
  k15,
  k10;

  String get kName => name.substring(1);

  int kInt() {
    switch (this) {
      case KFactor.k10:
        return 10;
      case KFactor.k15:
        return 15;
      case KFactor.k20:
        return 20;
      case KFactor.k30:
        return 30;
      case KFactor.k40:
        return 40;
    }
  }
}
