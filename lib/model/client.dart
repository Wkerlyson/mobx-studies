import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String name;

  @observable
  String cpf;

  @observable
  String email;

  @action
  chageName(String name) => this.name = name;

  @action
  chageCpf(String cpf) => this.cpf = cpf;

  @action
  chageEmail(String email) => this.email = email;
}
