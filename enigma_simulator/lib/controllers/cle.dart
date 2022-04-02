class Cle {
  final List<int> order; //par default: R1 R2 R3
  final List<int> routations; //default R1: 0, R2: 0 R3: 0
  final List<int> directions; //default R1: D, R2: D R3: D

  const Cle(
      {this.order = const [1, 2, 3],
      this.routations = const [0, 0, 0],
      this.directions = const [1, 1, 1]});

  List<int> getOrder() {
    return this.order;
  }

  //get routations in the order [first router, second ...]
  List<int> getRoutations() {
    return this.routations;
  }

  int getRoutersRotation({int router = 1}) {
    return this.routations[this.order.indexOf(router)] *
        this.directions[this.order.indexOf(router)];
  }

  int getRoutersDirection({int router = 1}) {
    //print(router);

    router = router + 1 % 3;
    return directions[this.order.indexOf(router)];
  }

  int getNextRouterInOrder({int curentRouter = 1}) {
    int currentRoutersIndex = this.order.indexOf(curentRouter);
    int next = this.order[(currentRoutersIndex + 1) % 3];
    return next;
  }

  int getFirstRouterInOrder() {
    return this.order[0];
  }
}
