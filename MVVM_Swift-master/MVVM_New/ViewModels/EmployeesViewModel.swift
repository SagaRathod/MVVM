//
//  EmployeesViewModel.swift
//  MVVM_New
//
//  Created by Sagar Rathode on 06/10/22.
//  Copyright © 2022 Sagar Rathode. All rights reserved.
//

import Foundation

class EmployeesViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var empData : Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            self.empData = empData
        }
    }
}
