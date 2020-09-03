import { NativeModules } from "react-native";
import React, { Component } from "react";


console.log({NativeModules});
const {RNPaypal} = NativeModules;

export default RNPaypal;
