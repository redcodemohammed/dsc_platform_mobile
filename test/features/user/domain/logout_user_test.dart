import 'package:dartz/dartz.dart';
import 'package:dsc_platform/features/user/domain/repositories.dart';
import 'package:dsc_platform/features/user/domain/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  MockUserRepository repository;
  LogoutUser logoutUser;

  setUp(() {
    repository = new MockUserRepository();
    logoutUser = new LogoutUser(repository);
  });

  test(
    'Test logout user.',
    () async {
      when(repository.logout()).thenAnswer(
        (_) async => Right(any),
      );

      await logoutUser();

      verifyNever(repository.logout());
      verifyNoMoreInteractions(repository);
    },
  );
}
