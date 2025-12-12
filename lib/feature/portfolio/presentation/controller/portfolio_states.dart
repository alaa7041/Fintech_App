import 'package:fintech_app/feature/portfolio/domain/usecases/get_portfolio_usecase.dart';

abstract class PortfolioState  {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioSuccess extends PortfolioState {
  final PortfolioResult result;

   PortfolioSuccess({required this.result});

}

class PortfolioError extends PortfolioState {
  final String message;

   PortfolioError({required this.message});
}