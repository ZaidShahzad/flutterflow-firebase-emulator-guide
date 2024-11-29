// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/custom_code/actions/index.dart';
import '/custom_code/actions/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

const String HOST = 'localhost';
const FIRESTORE_EMULATOR_PORT = 8080;
const AUTH_EMULATOR_PORT = 9099;
const STORAGE_EMULATOR_PORT = 9199;
const FUNCTIONS_EMULATOR_PORT = 5001;

Future<dynamic> initFirebaseEmulatorConnector() async {
  try {
    final app = Firebase.app();
    const enableEmulators = FFAppConstants.connectToFirebaseEmulators;
    debugPrint(
        '[Firebase Emulator Connector] Should we connect to local firebase emulators? (Firestore, Auth, Storage, and Functions): $enableEmulators');
    if (enableEmulators) {
      // Attempt to connect to the Firestore local emulator
      try {
        FirebaseFirestore.instance
            .useFirestoreEmulator(HOST, FIRESTORE_EMULATOR_PORT);
        debugPrint(
            '[Firebase Emulator Connector] ✓ Firestore Emulator connected on port $FIRESTORE_EMULATOR_PORT');
      } catch (e) {
        debugPrint(
            '[Firebase Emulator Connector] ✗ Firestore Emulator failled to connect: $e');
      }
      // Attempt to connect to the Auth local emulator
      try {
        await FirebaseAuth.instance.useAuthEmulator(HOST, AUTH_EMULATOR_PORT);
        debugPrint(
            '[Firebase Emulator Connector] ✓ Auth Emulator connected on port $AUTH_EMULATOR_PORT');
      } catch (e) {
        debugPrint(
            '[Firebase Emulator Connector] ✗ Auth Emulator failed to connect: $e');
      }
      // Attempt to connect to the Storage local emulator
      try {
        await FirebaseStorage.instance
            .useStorageEmulator(HOST, STORAGE_EMULATOR_PORT);
        debugPrint(
            '[Firebase Emulator Connector] ✓ Storage Emulator connected on port $STORAGE_EMULATOR_PORT');
      } catch (e) {
        debugPrint(
            '[Firebase Emulator Connector] ✗ Storage Emulator failed to connect: $e');
      }
      // Attempt to connect to the Cloud Functions local emulator
      try {
        FirebaseFunctions.instance
            .useFunctionsEmulator(HOST, FUNCTIONS_EMULATOR_PORT);
        debugPrint(
            '[Firebase Emulator Connector] ✓ Functions Emulator connected on port $FUNCTIONS_EMULATOR_PORT');
      } catch (e) {
        debugPrint(
            '[Firebase Emulator Connector] ✗ Functions Emulator failed to connect: $e');
      }
      debugPrint('[Firebase Emulator Connector] Initialization complete');
    }
    return app;
  } catch (e) {
    debugPrint('[Firebase Emulator Connector] Fatal initialization error: $e');
    rethrow;
  }
}
