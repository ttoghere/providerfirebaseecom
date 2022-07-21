import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth authInstance = FirebaseAuth.instance;
final User? user = authInstance.currentUser;
final uid = user!.uid;
final FirebaseFirestore fFirestore = FirebaseFirestore.instance;
