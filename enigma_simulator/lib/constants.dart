import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:flutter/material.dart';

const Color myGrey = Color(0xff506266);
const Color myBlue = Color(0xff10454f);
const Color myGreen = Color(0xffbde038);
bool encryptMode = true;
bool firstOperation = true;

//first rotor conrollers
String firstRotor = "R1";
String firstRotorDirection = "D";
String firstRotorSigne = "+";
String firstRotorDecalage = "0";
//Second rotor values
String secondRotor = "R2";
String secondRotorDirection = "D";
String secondRotorSigne = "+";
String secondRotorDecalage = "0";
//third rotor values
String thirdRotor = "R3";
String thirdRotorDirection = "D";
String thirdRotorSigne = "+";
String thirdRotorDecalage = "0";
//for rotors
List<String> rotors = ["R1", "R2", "R3"];
List<String> decalageValues = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25"
];
