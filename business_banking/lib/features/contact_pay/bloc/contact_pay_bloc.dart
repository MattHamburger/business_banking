// Main job of bloc - add the channel of communication to the presenter
import 'package:business_banking/features/contact_pay/model/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class ContactPayBloc extends Bloc {
  Pipe<ContactPayFormViewModel> contactPayFormViewModelPipe = Pipe();
  Pipe<String> onCityChangePipe = Pipe();
  //EventPipe

  ContactPayFormViewModel model = ContactPayFormViewModel(city: 'NewYork');

  ContactPayBloc() {
    contactPayFormViewModelPipe.whenListenedDo(() {
      contactPayFormViewModelPipe.send(model);
    });

    onCityChangePipe.receive.listen(_onCityChangePipeListener);
  }

  void _onCityChangePipeListener(String city) {
    model = ContactPayFormViewModel(city: city);
    contactPayFormViewModelPipe.send(model);
  }

  @override
  void dispose() {}
}
