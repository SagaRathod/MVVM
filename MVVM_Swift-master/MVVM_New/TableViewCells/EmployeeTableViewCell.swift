//
//  EmployeeTableViewCell.swift
//  MVVM_New
//
//  Created by Sagar Rathode on 06/10/22.
//  Copyright © 2022 Sagar Rathode. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    var employee : EmployeeData? {
        didSet {
            if let id = employee?.id{
                employeeIdLabel.text = String(id)
            }else{
                employeeIdLabel.text = ""
            }
            
            employeeNameLabel.text = employee?.employeeName
            
            if let salary = employee?.employeeSalary{
                employeeSalaryLabel.text = String(salary)
            }else{
                employeeSalaryLabel.text = ""
            }
            
            if let age = employee?.employeeAge{
                employeeAgeLabel.text = String(age)
            }else{
                employeeAgeLabel.text = ""
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
