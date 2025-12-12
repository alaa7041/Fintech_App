import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/di/dependency_injection.dart';
import 'package:fintech_app/feature/portfolio/data/models/portfolio_model.dart';
import 'package:fintech_app/feature/portfolio/domain/usecases/get_portfolio_usecase.dart';
import 'package:fintech_app/feature/portfolio/presentation/controller/portfolio_states.dart';

class PortfolioCubit extends Cubit<PortfolioState> {

 final getPortfolioUseCase = getIt<GetPortfolioUseCase>();

  PortfolioCubit() : super(PortfolioInitial());

  Future<void> loadPortfolio() async {
    //if (showLoading) {
      emit(PortfolioLoading());
    //}

    try {
      final localPortfolio = PortfolioModel.getDefaultPortfolio();
      final result = await getPortfolioUseCase(localPortfolio);
      emit(PortfolioSuccess(result: result));
    } catch (e) {
      emit(PortfolioError(message: e.toString()));
    }
}
}
