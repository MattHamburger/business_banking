import 'package:business_banking/dependency/Image_picker_plugin.dart';
import 'package:business_banking/dependency/permission_handler_plugin.dart';
import 'package:business_banking/features/deposit_check/model/1st_hub_card/deposit_check_card_view_model.dart';
import 'package:business_banking/features/deposit_check/model/2nd_data_entry/deposit_check_view_model.dart';
import 'package:business_banking/features/deposit_check/model/3rd_request_confirmation/deposit_check_confirm_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import '1st_hub_card/deposit_check_card_event.dart';
import '1st_hub_card/deposit_check_card_usecase.dart';
import '2nd_data_entry/deposit_check_event.dart';
import '2nd_data_entry/deposit_check_usecase.dart';
import '3rd_request_confirmation/deposit_check_confirm_event.dart';
import '3rd_request_confirmation/deposit_check_confirmation_usecase.dart';

class DepositCheckBloc extends Bloc {
  DepositCheckCardUseCase? _depositCheckCardUseCase;
  DepositCheckUseCase? _depositCheckUseCase;
  DepositCheckConfirmUseCase? _depositCheckConfirmUseCase;

  final depositCheckCardEventPipe =
      Pipe<DepositCheckCardEvent>(canSendDuplicateData: true);
  final depositCheckEventPipe =
      Pipe<DepositCheckEvent>(canSendDuplicateData: true);
  final depositCheckConfirmEventPipe =
      Pipe<DepositCheckConfirmEvent>(canSendDuplicateData: true);

  final depositCheckCardViewModelPipe = Pipe<DepositCheckCardViewModel>();
  final depositCheckViewModelPipe = Pipe<DepositCheckViewModel>();
  final depositCheckConfirmViewModelPipe = Pipe<DepositCheckConfirmViewModel>();

  @override
  void dispose() {
    depositCheckCardViewModelPipe.dispose();
    depositCheckViewModelPipe.dispose();
    depositCheckConfirmViewModelPipe.dispose();

    depositCheckCardEventPipe.dispose();
    depositCheckEventPipe.dispose();
    depositCheckConfirmEventPipe.dispose();
  }

  DepositCheckBloc({
    DepositCheckCardUseCase? depositCheckCardUseCase,
    DepositCheckUseCase? depositCheckUseCase,
    DepositCheckConfirmUseCase? depositCheckConfirmUseCase,
  }) {
    _depositCheckCardUseCase = depositCheckCardUseCase ??
        DepositCheckCardUseCase(depositCheckCardViewModelPipe.send);
    depositCheckCardViewModelPipe
        .whenListenedDo(() => _depositCheckCardUseCase!.execute());

    _depositCheckUseCase = depositCheckUseCase ??
        DepositCheckUseCase(depositCheckViewModelPipe.send,
            PermissionHandlerPlugin(), ImagePickerPlugin());
    depositCheckViewModelPipe
        .whenListenedDo(() => _depositCheckUseCase!.execute());

    _depositCheckConfirmUseCase =
        DepositCheckConfirmUseCase(depositCheckConfirmViewModelPipe.send);
    depositCheckConfirmViewModelPipe
        .whenListenedDo(() => _depositCheckConfirmUseCase!.execute());

    depositCheckCardEventPipe.receive.listen(depositCheckCardEventPipeHandler);
    depositCheckEventPipe.receive.listen(depositCheckEventPipeHandler);
    depositCheckConfirmEventPipe.receive
        .listen(depositCheckConfirmEventPipeHandler);
  }

  void depositCheckEventPipeHandler(DepositCheckEvent event) {
    if (event is UpdateCheckAmountEvent) {
      _depositCheckUseCase!.updateAmount(event.checkAmount);
    } else if (event is UpdateUserEmailEvent) {
      _depositCheckUseCase!.updateEmail(event.userEmail);
    } else if (event is UpdateCheckImgEvent) {
      _depositCheckUseCase!.updateImgs(event.imgType);
    } else if (event is SubmitDepositCheckEvent) {
      _depositCheckUseCase!.submitDepositCheck();
    } else if (event is ResetDepositCheckViewModelEvent) {
      _depositCheckConfirmUseCase!.resetViewModel();
    }
  }

  void depositCheckCardEventPipeHandler(DepositCheckCardEvent event) {
    if (event is UpdateAccountInfoEvent) {
      _depositCheckUseCase!.updateAccountInfo(event.accountInfo);
    }
  }

  void depositCheckConfirmEventPipeHandler(DepositCheckConfirmEvent event) {
    if (event is ResetDepositCheckViewModelEvent) {
      _depositCheckConfirmUseCase!.resetViewModel();
    }
  }
}
