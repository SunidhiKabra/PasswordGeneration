//
//  AppsData.swift
//
//  Created by Mohamed Shehab on 10/24/18.
//  Copyright © 2018 UNCC. All rights reserved.
//

import Foundation

class AppsData{
    
    static let values = "ABCDEFGHIJKLMNOPQRSTUVWKYZabcdefghijklmnopqrstuvwxyz1234567890@#$%^&*"
    
    static func getPassword(len:Int)->String{
        var password  = ""
        for _ in 0..<len {
            let number = Int.random(in: 0..<AppsData.values.count)
            let index = AppsData.values.index(AppsData.values.startIndex, offsetBy: number)
            password = password + String(AppsData.values[index])
            print("\(number), \(AppsData.values[index]), \(password)")
            //delay
            for _ in 0..<10000{
                for _ in 0..<1000{
                }
            }
        }
        return password
    }
}
