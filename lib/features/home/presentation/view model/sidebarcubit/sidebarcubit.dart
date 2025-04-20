import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trasportation/features/home/data/datasource/payroll_data_source.dart';
import 'package:trasportation/features/home/presentation/view%20model/sidebarcubit/sidebarstate.dart';

import '../../../data/model/payroll_driver_model.dart';

class SideBarCubit extends Cubit<SideBarState>{
  SideBarCubit():super(InitialState());
  PyrollDriverModel? driverPayroll;

  getDriverPayroll(String email,String pass,context)async{
    PyrollDriverModel? datta;
    PayrollDataSource payrollDataSource=PayrollDataSource();
    emit(IsloadingPyroll());
    try{
      datta=await payrollDataSource.getPayrollDriver(email, pass,context);
      print(datta);
      emit(SuccessPyroll(data: datta));
    }catch(e){
      print(e);
      emit(FailurePyroll(errorMessage: e.toString()));
    }
  }

}