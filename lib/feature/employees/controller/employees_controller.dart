import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/employees/domain/entity/employees_model.dart';
import 'package:my_hris/core/employees/domain/use-case/employees_interactor.dart';

Provider<EmployeesInteractor> employeesInteractor =
    Provider<EmployeesInteractor>((ref) => EmployeesInteractor());

AutoDisposeFutureProvider<List<EmployeesModel>> employeesController =
    FutureProvider.autoDispose<List<EmployeesModel>>(
        (ref) => ref.watch(employeesInteractor).getEmployeesInfo());

AutoDisposeFutureProviderFamily<EmployeesModel, int> employeesDetailController =
    FutureProvider.autoDispose.family<EmployeesModel, int>((ref, index) =>
        ref.watch(employeesInteractor).getEmployeesDetailInfo(index));
