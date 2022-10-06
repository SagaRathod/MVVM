//
//  APIService.swift
//  MVVM_New
//
//  Created by Sagar Rathode on 06/10/22.
//  Copyright © 2022 Sagar Rathode. All rights reserved.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Employees.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}
