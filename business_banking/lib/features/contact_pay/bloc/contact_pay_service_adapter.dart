import 'package:business_banking/features/contact_pay/api/contact_pay_service.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class ContactPayServiceAdapter extends ServiceAdapter<ContactPayEntity,
    ContactPayRequestModel, ContactPayResponseModel, ContactPayService> {
  ContactPayServiceAdapter() : super(ContactPayService());

  @override
  ContactPayEntity createEntity(
      ContactPayEntity initialEntity, ContactPayResponseModel responseModel) {
    return initialEntity.merge(confirmationId: responseModel.confirmationId);
  }

  @override
  ContactPayRequestModel createRequest(ContactPayEntity entity) {
    return ContactPayRequestModel(
        paymentAmount: entity.paymentAmount.toString(),
        paymentContactEmail: entity.contactEmail);
  }
}
