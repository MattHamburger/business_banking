import 'package:business_banking/features/login/bloc/login_service_adapter.dart';
import 'package:business_banking/features/login/model/login_entity.dart';
import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class LoginUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  LoginUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<LoginEntity>();
    if (_scope == null) {
      final newLoginEntity = LoginEntity();
      _scope = ExampleLocator()
          .repository
          .create<LoginEntity>(newLoginEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    final entity = ExampleLocator().repository.get<LoginEntity>(_scope);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void submit() async {
    final entity = ExampleLocator().repository.get<LoginEntity>(_scope);
    if (entity.userName == '' || entity.password == '') {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, LoginServiceAdapter());
    }
  }

  void updateUsername(String username) async {
    final entity = ExampleLocator().repository.get<LoginEntity>(_scope);
    final updatedEntity = entity.merge(userName: username);
    ExampleLocator().repository.update<LoginEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updatePassword(String password) async {
    final entity = ExampleLocator().repository.get<LoginEntity>(_scope);
    final updatedEntity = entity.merge(password: password);
    ExampleLocator().repository.update<LoginEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  LoginViewModel buildViewModelForServiceUpdate(LoginEntity entity) {
    if (entity.hasErrors()) {
      return LoginViewModel(
          username: entity.userName,
          password: entity.password,
          serviceStatus: ServiceStatus.fail);
    } else {
      return LoginViewModel(
          username: entity.userName,
          password: entity.password,
          serviceStatus: ServiceStatus.success);
    }
  }

  LoginViewModel buildViewModelForLocalUpdate(LoginEntity entity) {
    return LoginViewModel(
      username: entity.userName,
      password: entity.password,
    );
  }

  LoginViewModel buildViewModelForLocalUpdateWithError(LoginEntity entity) {
    return LoginViewModel(
        username: entity.userName,
        password: entity.password,
        dataStatus: DataStatus.invalid);
  }
}
