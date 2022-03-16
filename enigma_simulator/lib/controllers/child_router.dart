
class ChildRouter{
  final int key;
  final List<List<int>> content;

  const ChildRouter({required this.key, required this.content});

  //get table values

  List<List<int>> getContent(){
    return this.content;
  }

  int getNext(int index, {bool isBackward = false}){
    if (index >=0 &&  index <26){
      //print('LOG: get index in childRouter result of  '+ index.toString() +': ' + this.content[isBackward? 1 :0 ][index].toString());
      //print(isBackward? 1 :0);
      index = (this.content[isBackward? 1 :0 ][index] + index) % 26;
    }else{
      throw Exception();
    }
    return index;
  }

  int rotate(int shift){
    //get the positive equiv of shift value
    shift = shift % 26;
    //get first positions item's pos in the old list
    int i_pos = (26 - shift) % 26;
    //rotate
    this.content[0] = this.content[0].sublist(i_pos)..addAll(this.content[0].sublist(0, i_pos));
    this.content[1] = this.content[1].sublist(i_pos)..addAll(this.content[1].sublist(0, i_pos));
    return 0 ;
  }
  
}


//List.generate(length, (index) => List(2), growable: false);