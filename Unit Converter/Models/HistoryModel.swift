//
//  HistoryModel.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/11/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import Foundation
//    Creating five arrays for five measurement types
var length_list = [""]
var speed_list = [""]
var temperature_list = [""]
var volume_list = [""]
var weight_list = [""]

let defaults = UserDefaults.standard
class HistoryModel {
    
    // 5 asrrays for 5 history types
    func save_new_result(result: String, type: String) {
        switch type {
        case "length":
            // If userdefaults doesn't have a array for the chosen categor, then here it creates one
            if  ((UserDefaults.standard.array(forKey: "length_history") != nil)) {
                length_list = UserDefaults.standard.array(forKey: "length_history") as! [String]
            }
            // If the history list length is 5 then remove the first one (the oldest one)
            if length_list.count == 5 {
                length_list.removeFirst()
            }
            // Append the new result to the array and synchronize with the userdefaults's coresponding array
            length_list.append(result)
            defaults.set(length_list, forKey: "length_history")
            defaults.synchronize()
            
            print(length_list)
            
        case "speed":
            if  ((UserDefaults.standard.array(forKey: "speed_history") != nil)) {
                speed_list = UserDefaults.standard.array(forKey: "speed_history") as! [String]
            }
            if speed_list.count == 5 {
                speed_list.removeFirst()
            }
            speed_list.append(result)
            defaults.set(speed_list, forKey: "speed_history")
            defaults.synchronize()
            
            print(speed_list)
            
        case "temperature":
            if  ((UserDefaults.standard.array(forKey: "temperature_history") != nil)) {
                temperature_list = UserDefaults.standard.array(forKey: "temperature_history") as! [String]
            }
            if temperature_list.count == 5 {
                temperature_list.removeFirst()
            }
            temperature_list.append(result)
            defaults.set(temperature_list, forKey: "temperature_history")
            defaults.synchronize()
            
            print(temperature_list)
            
        case "volume":
            if  ((UserDefaults.standard.array(forKey: "volume_history") != nil)) {
                volume_list = UserDefaults.standard.array(forKey: "volume_history") as! [String]
            }
            if volume_list.count == 5 {
                volume_list.removeFirst()
            }
            volume_list.append(result)
            defaults.set(volume_list, forKey: "volume_history")
            defaults.synchronize()
            
            print(volume_list)
            
        case "weight":
            if  ((UserDefaults.standard.array(forKey: "weight_history") != nil)) {
                weight_list = UserDefaults.standard.array(forKey: "weight_history") as! [String]
            }
            if weight_list.count == 5 {
                weight_list.removeFirst()
            }
            weight_list.append(result)
            defaults.set(weight_list, forKey: "weight_history")
            defaults.synchronize()
            
            print(weight_list)
        default:
            print("nothing")
        }
    }
}
