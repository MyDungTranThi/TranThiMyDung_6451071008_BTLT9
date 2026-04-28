import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/repository/auth_repository.dart';

class AuthController {
  final AuthRepository _repository = AuthRepository();

  /// Get current user
  User? get currentUser => _repository.currentUser;

  /// Get auth state changes as stream
  Stream<User?> get authStateChanges => _repository.authStateChanges;

  /// Sign up with email and password
  Future<void> signUp(String email, String password) async {
    if (email.trim().isEmpty) {
      throw Exception('Email cannot be empty.');
    }
    if (password.trim().isEmpty) {
      throw Exception('Password cannot be empty.');
    }
    if (password.trim().length < 6) {
      throw Exception('Password must be at least 6 characters.');
    }
    
    await _repository.signUp(email, password);
  }

  /// Sign in with email and password
  Future<void> signIn(String email, String password) async {
    if (email.trim().isEmpty) {
      throw Exception('Email cannot be empty.');
    }
    if (password.trim().isEmpty) {
      throw Exception('Password cannot be empty.');
    }
    
    await _repository.signIn(email, password);
  }

  /// Sign out
  Future<void> signOut() async {
    await _repository.signOut();
  }
}
