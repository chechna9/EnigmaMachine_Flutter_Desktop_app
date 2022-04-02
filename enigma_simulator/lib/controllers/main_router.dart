import 'package:enigma_simulator/constants.dart';
import 'package:flutter/foundation.dart';

import 'child_router.dart';
import 'consts.dart';
import 'cle.dart';

class MainRouter extends ChangeNotifier {
  List<ChildRouter> cor_routers = [
    ChildRouter(key: 1, content: List.from(R1)),
    ChildRouter(key: 2, content: List.from(R2)),
    ChildRouter(key: 3, content: List.from(R3)),
  ];

  Cle cle = Cle();
  List<int> reflecteur = const_reflecteur;
  List<String> alghabet = const_alghabet;

  //count routations in current router
  int _routationCounter = 0;
  //currrent router, value in 1, 2, 3
  int _currentRouter = 0;

  MainRouter() {
    encryptionInfo['indexes'] = Map();
    //init&reset
    initAnim();
  }

  int setCle(Cle cle) {
    this.cle = cle;
    return 0;
  }

  Cle getCle() {
    return this.cle;
  }

  int config() {
    shouldRotate = false;
    //config routers
    for (int i = 0; i <= 2; i++) {
      cor_routers[i].rotate(cle.getRoutersRotation(router: i + 1));
    }

    this._currentRouter = this.cle.getFirstRouterInOrder();
    this._routationCounter = 0;

    //config first router to shift and direction
    notifyListeners();
    return 0;
  }

  void initAnim() {
    encryptionInfo['indexes']["reflecteur"] = -1;
    encryptionInfo['indexes']['forward'] = [-1, -1, -1];
    encryptionInfo['indexes']['backward'] = [-1, -1, -1];
    encryptionInfo["indexes"]["first"] = -1;
    encryptionInfo["indexes"]["last"] = -1;
    notifyListeners();
  }

  int reset() {
    shouldRotate = false;
    //roset routers
    cor_routers.clear();
    this.cor_routers = [
      ChildRouter(key: 1, content: List.from(R1)),
      ChildRouter(key: 2, content: List.from(R2)),
      ChildRouter(key: 3, content: List.from(R3)),
    ];

    this._currentRouter = this.cle.getFirstRouterInOrder();
    this._routationCounter = 0;
    //init&reset
    initAnim();
    notifyListeners();
    return 0;
  }

  List<List<List<int>>> getAllRoutesValues() {
    //get routes values in 3D array
    //[R1, R2, R3]
    List<List<List<int>>> routes = [];
    for (int i = 0; i <= 2; i++) {
      routes.add(this.cor_routers[i].getContent());
    }
    return routes;
  }

  List<List<int>> getRouteValues(index) {
    //get routes values in 2D array
    return this.cor_routers[index].getContent();
  }

  int routate() {
    //rotate the current router
    int routerToRotate = this._currentRouter;
    //print("LOG: in rotate: routerToRotate = " + routerToRotate.toString());
    this
        .cor_routers[(routerToRotate - 1) % 3]
        .rotate(this.cle.getRoutersDirection(router: routerToRotate));
    //update the routation counter
    this._routationCounter++;
    //if >= 26 go to next router in order
    if (this._routationCounter >= 26) {
      this._currentRouter =
          this.cle.getNextRouterInOrder(curentRouter: this._currentRouter);
      //reset routations
      this._routationCounter = 0;
    }
    notifyListeners();
    return routerToRotate;
  }

  Map encryptionInfo = Map();

  //encryption function: return a map {'encrypted': caracter, 'rotated': the routated route}
  Map encryptCaracter({String caracter = 'A'}) {
    encryptionInfo['indexes'] = Map();
    //Turn into lowercase
    caracter = caracter.toUpperCase();
    //find index
    int index = this.alghabet.indexOf(caracter);
    encryptionInfo['indexes']['first'] = index;

    //print('Log: first index: ' + index.toString());

    //forward
    encryptionInfo['indexes']['forward'] = [-1, -1, -1];
    for (int routeIndex = 0; routeIndex < 3; routeIndex++) {
      encryptionInfo['indexes']['forward'][routeIndex] = index;

      index = this.cor_routers[routeIndex].getNext(index);
      //print('Log: forward index at router: '+this.cor_routers[routeIndex].key.toString()+': ' + index.toString());
    }

    //reflection
    encryptionInfo['indexes']['reflecteur'] = index;
    index = (this.reflecteur[index] + index) % 26;

    //backward
    encryptionInfo['indexes']['backward'] = [-1, -1, -1]; //init
    for (int routeIndex = 2; routeIndex >= 0; routeIndex--) {
      encryptionInfo['indexes']['backward'][routeIndex] = index;
      index = this.cor_routers[routeIndex].getNext(index, isBackward: true);
      //print('Log: backward index at router: '+this.cor_routers[routeIndex].key.toString()+': ' + index.toString());
    }

    //get letter
    encryptionInfo['indexes']['last'] = index;
    encryptionInfo['encrypted'] = this.alghabet[index].toUpperCase();
    //rotate after calculating the incryption
    // encryptionInfo['rotated'] = this._routate();
    notifyListeners();
    return encryptionInfo;
  }
}
