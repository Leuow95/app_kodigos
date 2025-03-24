abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderCreated extends OrderState {}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}
