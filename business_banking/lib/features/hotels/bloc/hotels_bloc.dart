import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'hotels_usecase.dart';

class HotelsBloc extends Bloc {
  //
  late HotelsUseCase _hotelsUseCase;
  final hotelsViewModelPipe = Pipe<HotelsListViewModel>();

  @override
  void dispose() {
    hotelsViewModelPipe.dispose();
  }

  HotelsBloc({HotelsUseCase? hotelsUseCase}) {
    _hotelsUseCase = hotelsUseCase ??
        HotelsUseCase((viewModel) =>
            hotelsViewModelPipe.send(viewModel as HotelsListViewModel));

    hotelsViewModelPipe.whenListenedDo(_hotelsUseCase.create);
  }

  hotelLiked(HotelViewModel viewModel) {
    _hotelsUseCase.switchLike(viewModel);
  }
}
