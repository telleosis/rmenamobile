
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class TuitionRepositoryImp implements TuitionRepository{

        final TuitionRemoteDataSource remoteDataSource;
        TuitionRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    