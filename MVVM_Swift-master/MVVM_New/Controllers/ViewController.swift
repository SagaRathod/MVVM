//
//  ViewController.swift
//  MVVM_New
//
//  Created by Sagar Rathode on 06/10/22.
//  Copyright © 2022 Sagar Rathode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeeViewModel : EmployeesViewModel!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.employeeViewModel =  EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            
            cell.employeeIdLabel.text = "Id: " + String(evm.id)
            cell.employeeNameLabel.text = "NAME: " + evm.employeeName
            cell.employeeSalaryLabel.text = "Salary: " + String(evm.employeeSalary)
            cell.employeeAgeLabel.text = "Age: " + String(evm.employeeAge)
            
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    
}

