import 'child_router.dart';
import 'consts.dart';
import 'main_router.dart';
import 'cle.dart';

class Test{
  int testMainRouterConfig(){
    //create cle
    Cle cle = new Cle(routations: [1, -1, -5]);
    //create Main_router with key
    MainRouter main_router = new MainRouter();
    main_router.setCle(cle);
    //show content
    print(main_router.getRoutesValues());
    //config
    main_router.config();
    //get content
    print(main_router.getRoutesValues());
    //reset
    main_router.reset();
    //get content
    print(main_router.getRoutesValues());
  return 0;
  }

  int testRoutesOrder(){
    //create cle
    Cle cle = new Cle(routations: [1, -1, -5], order: [2, 1, 3]);
    //get first order
    print( 2 == cle.getFirstRouterInOrder());
    //get next order
    print( 2 == cle.getNextRouterInOrder(curentRouter: 3));

    return 0;
  }

  int testEncryption({String message =  "ABCDGTHFHHFKSOOOOLSMQPOSJHHDGSBQTTRGDHSSUIIIH"}){
    print('LOG: Message:  ' + message);
    //create cle
    Cle cle = new Cle(routations: [0, 0, 0], order: [2, 1, 3]);
    //create routers
    MainRouter mainRouter = MainRouter();
    mainRouter.setCle(cle);
    //configurate
    mainRouter.config();
    //generated encrypter message
    String encrypted = "";
    for (int i=0; i< message.length; i++){
      encrypted = encrypted + mainRouter.encryptCaracter(caracter: message[i])['encrypted'];
    }

    print('LOG: Encrypted: ' + encrypted);

    //go backward
    mainRouter.reset();
    mainRouter.config();

    String decrypted = "";
    for (int i=0; i< message.length; i++){
      decrypted = decrypted + mainRouter.encryptCaracter(caracter: encrypted[i])['encrypted'];
    }
    //get first order
    print('LOG: backward: ' + decrypted);
    //get next order
    print(message == decrypted);

    return 0;
  }
}