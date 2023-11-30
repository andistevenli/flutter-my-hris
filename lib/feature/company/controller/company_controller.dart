import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/company/domain/entity/department_model.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';
import 'package:my_hris/core/company/domain/use-case/company_interactor.dart';

Provider<CompanyInteractor> companyInteractor =
    Provider<CompanyInteractor>((ref) => CompanyInteractor());

AutoDisposeFutureProvider<GeneralModel> companyGeneralController =
    FutureProvider.autoDispose<GeneralModel>(
        (ref) => ref.watch(companyInteractor).getGeneralInfo());

AutoDisposeFutureProvider<List<DepartmentModel>> companyDepartmentController =
    FutureProvider.autoDispose<List<DepartmentModel>>(
        (ref) => ref.watch(companyInteractor).getDepartmentInfo());

AutoDisposeFutureProvider<List<PositionModel>> companyPositionController =
    FutureProvider.autoDispose<List<PositionModel>>(
        (ref) => ref.watch(companyInteractor).getPositionInfo());
