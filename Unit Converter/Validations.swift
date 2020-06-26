//
//  ValidationModel.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/11/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import Foundation

class Validations {
//    Validate first zeros before first digit inequal to 0 or decimal point
//    If the string contains all zeros, keeps one "0", else remove all of first zeros
    func validateFirstZero (value: String) -> String{
        var zeros =  value
        var prefix = ""
        var length = 0
        let separate_zeros =  zeros.components(separatedBy:"0")
        let count_zeros = separate_zeros.count - 1
//        Check if the string contains - or + mark
//        If yes save the value to prefix and remove it from the string
        if zeros.contains("-") {
            zeros.removeFirst()
            prefix = "-"
        } else if zeros.contains("+") {
            zeros.removeFirst()
        }
        length = value.count - 1
//       Check if the input contains all zeros and then return zero after the prefix
        if zeros.count == count_zeros {
            if count_zeros != 0 {
                return prefix + "0"
            } else {
                return prefix
            }
//       If not then remove only zeros followed by first none-zero digit or decimal point
       } else {
            for _ in 0 ... length {
                if zeros.prefix(1) == "0" {
                    zeros.removeFirst()
                    length = length - 1
                } else if zeros.prefix(1) == "." {
                    zeros = "0" + zeros
                    break
                } else {
                    break
                }
            }
            return prefix + zeros
        }
    }

//   If the entry is a desimal point then it executes this function
    func validateFirstZeroForDecimal (value: String) -> String{
        var zeros =  value
        var prefix = ""
        var length = 0
//        Check if the string contains - or + mark
//        If yes save the value to prefix and remove it from the string
        if zeros.contains("-") {
            zeros.removeFirst()
            prefix = "-"
        } else if zeros.contains("+") {
            zeros.removeFirst()
        }
//       Else it contains only a list of zeros before the decimal point, it removers all of them except one ot keep it as 0.%
//       If it has only one zero that zero remains without any change
//       If the extfield is empty before the decimal point is entered, then it adds a zero before the decimal point
        if value.count != 0 {
            length = value.count - 1
            for _ in 0 ... length {
                if zeros.prefix(1) == "0" {
                    zeros.removeFirst()
                    length = length - 1
                } else if zeros.prefix(1) == "." {
                    zeros = "0" + zeros
                    break
                } else {
                    break
                }
            }
        }
        
//       When the validated result returns the prefix's attached before the result
        if zeros == "" {
            return prefix + "0"
        } else {
            return prefix + zeros
        }
    }
  
//    Get executed when stone or s_pound value is entered
//    If the text field is empty, then it returns a zero, otherwise the textfield's value
    func validateEmpty (value: String) -> String{
        if value == "" {
            return "0"
        } else {
            return value
        }
    }
 
//   This helps to avoid if - or decimal point repeatition
//    And has been used to check if the value contains + mark, which is useless
    func validateDuplication (value: String, input: String) -> Bool{
        if value.contains(input) {
            return false
        } else {
            return true
        }
    }
    
//    This functions finds why if the textfield.text becomes nil and then fix it
    func validatedInvalidEntries (value: String, comparison_value: String, input: String) -> String {
        var editable_value = value
        var editable_comparison_value = comparison_value
        if Float(editable_comparison_value) == nil || editable_comparison_value.contains("e+"){
            editable_comparison_value = ""
        }
        if input != "" {
            editable_value = input
        } else if editable_value != "" {
            editable_value = editable_comparison_value
        }
        return editable_value
    }
    
    
}
