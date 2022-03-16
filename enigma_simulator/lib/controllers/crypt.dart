import "dart:io";

class Interface {
//rakez m3a les fonctions khtik m chakl nta3 la classe :)

  int next_index = 0;
  int nextPosition = 0;
  int nextPosition2 = 0;
  int nextPosition3 = 0;
  int nextPosition4 = 0;
  int nextPos = 0;

  //
  /*---fonction qui retourne la prochaine position sur le prochain rotor / refleccteur -----*/
  int next_position(int actuel_position, int index) {
    next_index = (actuel_position + index) % 26;
    return next_index;
  }

/*-----------------------------UP-----------------------*/
/*------------ROTOR1------------------------------*/
  List<int> crypt_R1(String lettre) {
    int index = alphabet.indexOf("$lettre");
    nextPosition = R1[0][index];
    return [
      nextPosition,
      index
    ]; //nextPosition -> le contenu de la case  , index -> sa position sur le rotor
  }

/*----------------ROTOR2--------------------------*/
  List<int> crypt_R2(int actuel_position, int index, int direction) {
    index = next_position(actuel_position, index);
    nextPosition2 = R2[direction][index];
    return [nextPosition2, index];
  }

/*--------------------ROTOR3---------------------------*/
  List<int> crypt_R3(int actuel_position, int index, int direction) {
    //direction : up->0 , down->1
    if (direction == 0) {
      index = next_position(actuel_position, index);
    }
    nextPosition3 = R3[direction][index];
    return [nextPosition3, index];
  }

/*------------------REFLECTEUR------------------------*/
  List<int> crypt_reflecteur(int actuel_position, int index) {
    index = next_position(actuel_position, index);
    nextPosition4 = reflecteur[index];
    return [nextPosition4, index];
  }

/*-------------------DOWN---------------------------------*/

  List<int> down_crypt_reflecteur(int actuel_position, int index) {
    index = next_position(actuel_position, index);
    nextPos = reflecteur[index];
    return [nextPos, index];
  }

  List<int> down_crypt_R1(int actuel_position, int index) {
    index = next_position(actuel_position, index);
    nextPosition2 = R1[1][index]; //actuel_position
    return [nextPosition2, index];
  }

  int crypted_letter(int actuel_position, int index) {
    index = next_position(actuel_position, index);
    return index;
  }

  /*------------------FONCTION DE CRYPTAGE (D'UNE LETTRE)-------------------*/
  String Crypt_lettre(String lettre) {
    List<int> r1 = crypt_R1(lettre);
    List<int> r2 = crypt_R2(r1[0], r1[1], 0);
    List<int> r3 = crypt_R3(r2[0], r2[1], 0);
    List<int> r = crypt_reflecteur(r3[0], r3[1]);
    r = crypt_reflecteur(r[0], r[1]);
    r3 = crypt_R3(r[0], r[1], 1);
    r2 = crypt_R2(r3[0], r3[1], 1);
    r1 = down_crypt_R1(r2[0], r2[1]);
    int pos = crypted_letter(r1[0], r1[1]);
    String clettre = alphabet[pos];
    return clettre;
  }
}

void main() {
  Interface inter = Interface();
  print("veuillez saisir une lettre :");
  var l = stdin.readLineSync();
  String lettre = inter.Crypt_lettre("$l");
  print("la lettre apres le cryptage est : $lettre");
}

List<List<int>> R1 = [
  // declarer une matrice
  [
    10,
    21,
    5,
    -17,
    21,
    -4,
    12,
    16,
    6,
    -3,
    7,
    -7,
    4,
    2,
    5,
    -7,
    -11,
    -17,
    -9,
    -6,
    -9,
    -19,
    2,
    -3,
    -21,
    -4
  ],
  [
    17,
    4,
    19,
    21,
    7,
    11,
    3,
    -5,
    7,
    9,
    -10,
    9,
    17,
    6,
    -6,
    -2,
    -4,
    -7,
    -12,
    -5,
    3,
    4,
    -21,
    -16,
    -2,
    -21
  ]
];

List<List<int>> R2 = [
  [
    3,
    17,
    22,
    18,
    16,
    7,
    5,
    1,
    -7,
    16,
    -3,
    8,
    2,
    9,
    2,
    -5,
    -1,
    -13,
    -12,
    -17,
    -11,
    -4,
    1,
    -10,
    -19,
    -25
  ],
  [
    25,
    7,
    17,
    -3,
    13,
    19,
    12,
    3,
    -1,
    11,
    5,
    -5,
    -7,
    10,
    -2,
    1,
    -2,
    4,
    -17,
    -8,
    -16,
    -18,
    -9,
    -1,
    -22,
    -16
  ]
];

List<List<int>> R3 = [
  [
    1,
    16,
    5,
    17,
    20,
    8,
    -2,
    2,
    14,
    6,
    2,
    -5,
    -12,
    -10,
    9,
    10,
    5,
    -9,
    1,
    -14,
    -2,
    -10,
    -6,
    13,
    -10,
    -23
  ],
  [
    12,
    -1,
    23,
    10,
    2,
    14,
    5,
    -5,
    9,
    -2,
    -13,
    10,
    -2,
    -8,
    10,
    -6,
    6,
    -16,
    2,
    -1,
    -17,
    -5,
    -14,
    -9,
    -20,
    -10
  ]
];
var reflecteur = [
  25,
  23,
  21,
  19,
  17,
  15,
  13,
  11,
  9,
  7,
  5,
  3,
  1,
  -1,
  -3,
  -5,
  -7,
  -9,
  -11,
  -13,
  -15,
  -17,
  -19,
  -21,
  -23,
  -25
];
var alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];
