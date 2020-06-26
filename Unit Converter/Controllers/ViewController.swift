//
//  ViewController.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/3/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate{
    @IBOutlet var converter_view: UIView!
    //    buttons at the top left and top right
    @IBOutlet weak var constants: UIButton!
    @IBOutlet weak var history: UIButton!
    //    icon background images to indicate the selected category
    @IBOutlet weak var length_selected: UIImageView!
    @IBOutlet weak var speed_selected: UIImageView!
    @IBOutlet weak var temerature_selected: UIImageView!
    @IBOutlet weak var volume_selected: UIImageView!
    @IBOutlet weak var weight_selected: UIImageView!
    //    Length component set
    @IBOutlet weak var length_view: UIView!
    @IBOutlet weak var milimetre_textfield: UITextField!
    @IBOutlet weak var centimetre_textfield: UITextField!
    @IBOutlet weak var metre_textfield: UITextField!
    @IBOutlet weak var inch_textfield: UITextField!
    @IBOutlet weak var yard_textfield: UITextField!
    @IBOutlet weak var mile_textfield: UITextField!
    //    Speed  component set
    @IBOutlet weak var speed_view: UIView!
    @IBOutlet weak var metres_per_second_textfield: UITextField!
    @IBOutlet weak var miles_per_hour: UITextField!
    @IBOutlet weak var neutrical_miles_per_hour_textfield: UITextField!
    //    Temperature  component set
    @IBOutlet weak var temperature_view: UIView!
    @IBOutlet weak var celcius_textfield: UITextField!
    @IBOutlet weak var fahrenheit_textfield: UITextField!
    @IBOutlet weak var kelvin_textfield: UITextField!
    //    Volume  component set
    @IBOutlet weak var volume_view: UIView!
    @IBOutlet weak var gallon_textfield: UITextField!
    @IBOutlet weak var litre_textfield: UITextField!
    @IBOutlet weak var uk_pint_textfield: UITextField!
    @IBOutlet weak var fluid_ounce_textfield: UITextField!
    @IBOutlet weak var millilitre_textfield: UITextField!
    //    Weight  component set
    @IBOutlet weak var weight_view: UIView!
    @IBOutlet weak var kilogram_textfield: UITextField!
    @IBOutlet weak var gram_textfield: UITextField!
    @IBOutlet weak var ounce_textfield: UITextField!
    @IBOutlet weak var pound_textfield: UITextField!
    @IBOutlet weak var stone_textfield: UITextField!
    @IBOutlet weak var s_pound_textfield: UITextField!
    //    minus button to keyboard and save button (when a valid result is ready so save)
    @IBOutlet weak var minus_button: UIButton!
    @IBOutlet weak var save_button: UIButton!
    //    Creating models
    let converterModel = ConverterModel()
    let validations = Validations()
    let historyModel = HistoryModel()
    
    //    Collection view's data source array
    var valueString = "" //     To get the input of the text field
    var historyFlag = false //     To identify which view to got to
    var category = "" //    To identify the category when saving a result
    let transition = CircularTransition() //     To animate the history view transition
    let specialGreen = UIColor(displayP3Red: 57/255, green: 144/255, blue: 62/255, alpha: 1) //     To history view transition
    var save_string = "" //     To save the result
    var isChanged = false
    //    To save the current length values of the text fields before add the input
    var current_millimetre = ""
    var current_centimetre = ""
    var current_metre = ""
    var current_inch = ""
    var current_yard = ""
    var current_mile = ""
    //    To save the current speed values of the text fields before add the input
    var current_metres_per_second = ""
    var current_miles_per_hour = ""
    var current_neutrical_miles_per_hour = ""
    //    To save the current temperature values of the text fields before add the input
    var current_celcius = ""
    var current_fahrenheit = ""
    var current_kelvin = ""
    //    To save the current volume values of the text fields before add the input
    var current_gallon = ""
    var current_litre = ""
    var current_uk_pint = ""
    var current_fl_oz = ""
    var current_milliletre = ""
    //    To save the current weight values of the text fields before add the input
    var current_kilogram = ""
    var current_gram = ""
    var current_ounce = ""
    var current_pound = ""
    var current_stone = ""
    var current_s_pound = ""
    
    let success_message = "The convertion result saved to history successfully."
    let failed_title = "Oops!"
    let failed_message = "The result has empty fields or been edited before save."
    let sorry_title = "Sorry!"
    let sorry_message = "This input exceeds the input size limit"
    //    A UIView to add as text fields' input views to avoid the system keyboard appearance
    var dummyView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    Initialy appear temperature view as the default view
        selectCategory(category: "temperature")
        category = "temperature"
        //    Initially setting the save button hidden setting borders
        save_button.isHidden = true
        save_button.layer.cornerRadius = 8
        save_button.layer.borderColor = UIColor.white.cgColor
        save_button.layer.borderWidth = 1
        //    Creating a view to set as the textfields' inputView to avoid appearing the system keyboard
        dummyView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //    Setting the dummyView as the textfields' inputView
        milimetre_textfield.inputView = dummyView;
        centimetre_textfield.inputView = dummyView;
        metre_textfield.inputView = dummyView;
        inch_textfield.inputView = dummyView;
        yard_textfield.inputView = dummyView;
        mile_textfield.inputView = dummyView;
        metres_per_second_textfield.inputView = dummyView;
        miles_per_hour.inputView = dummyView;
        neutrical_miles_per_hour_textfield.inputView = dummyView;
        celcius_textfield.inputView = dummyView;
        fahrenheit_textfield.inputView = dummyView;
        kelvin_textfield.inputView = dummyView;
        gallon_textfield.inputView = dummyView;
        litre_textfield.inputView = dummyView;
        uk_pint_textfield.inputView = dummyView;
        fluid_ounce_textfield.inputView = dummyView;
        millilitre_textfield.inputView = dummyView;
        kilogram_textfield.inputView = dummyView;
        gram_textfield.inputView = dummyView;
        ounce_textfield.inputView = dummyView;
        pound_textfield.inputView = dummyView;
        stone_textfield.inputView = dummyView;
        s_pound_textfield.inputView = dummyView;
        
        //        Blended color effect
        let topColor = UIColor(red: 57/255, green: 144/255, blue: 62/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        let gradiantColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradiantLocations: [Float] = [0.0, 0.9]
        let gradiantLayer: CAGradientLayer = CAGradientLayer()
        gradiantLayer.colors = gradiantColors
        gradiantLayer.locations = gradiantLocations as [NSNumber]?
        gradiantLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradiantLayer, at: 0)
    }
    //    Button to open the physical constants view
    @IBAction func constantButton(_ sender: Any) {
        historyFlag = false
    }
    //    Button to open the history view
    @IBAction func historyButton(_ sender: Any) {
        historyFlag = true
    }
    //    Custom key-pad buttons 0 - 9
    @IBAction func key_1(_ sender: Any) {
        typeInTo(category: category, input: "1")
    }
    @IBAction func key_2(_ sender: Any) {
        typeInTo(category: category, input: "2")
    }
    @IBAction func key_3(_ sender: Any) {
        typeInTo(category: category, input: "3")
    }
    @IBAction func key_4(_ sender: Any) {
        typeInTo(category: category, input: "4")
    }
    @IBAction func key_5(_ sender: Any) {
        typeInTo(category: category, input: "5")
    }
    @IBAction func key_6(_ sender: Any) {
        typeInTo(category: category, input: "6")
    }
    @IBAction func key_7(_ sender: Any) {
        typeInTo(category: category, input: "7")
    }
    @IBAction func key_8(_ sender: Any) {
        typeInTo(category: category, input: "8")
    }
    @IBAction func key_9(_ sender: Any) {
        typeInTo(category: category, input: "9")
    }
    @IBAction func key_0(_ sender: Any) {
        typeInTo(category: category, input: "0")
    }
    //    Textfield 'editing change'
    @IBAction func millimetre_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func centimetre_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func metre_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func inch_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func yard_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func mile_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func metres_per_second_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func miles_per_hour(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func neutrical_miles_per_hour_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func celcius_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func fahrenheit_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func kelvin_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func gallon_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func litre_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func uk_pint_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func fluid_ounce_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func millilitre_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func kilogram_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func gram_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func ounce_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func pound_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func stone_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    @IBAction func s_pound_action(_ sender: Any) {
        typeInTo(category: category, input: "")
    }
    //    Custom key-pad decimal point
    @IBAction func key_dot(_ sender: Any) {
        typeInTo(category: category, input: ".")
    }
    //    Custom key-pad minus (NEG) button
    @IBAction func key_minus(_ sender: Any) {
        typeMinusInTo(category: category, input: "-")
    }
    //    Custom key-pad delete button
    @IBAction func key_delete(_ sender: Any) {
        deleteLastFrom(category: category)
    }
    
    //    Custom tab bar catergory buttons
    @IBAction func lengthButton(_ sender: Any) {
        if category != "length" {
            selectCategory(category: "length")
            category = "length"
        }
    }
    @IBAction func speedButton(_ sender: Any) {
        if category != "speed" {
            selectCategory(category: "speed")
            category = "speed"
        }
    }
    @IBAction func temperatureButton(_ sender: Any) {
        if category != "temperature" {
            selectCategory(category: "temperature")
            category = "temperature"
        }
    }
    @IBAction func volumeButton(_ sender: Any) {
        if category != "volume" {
            selectCategory(category: "volume")
            category = "volume"
        }
    }
    @IBAction func weightButton(_ sender: Any) {
        if category != "weight" {
            selectCategory(category: "weight")
            category = "weight"
        }
    }
    
    // Ater every input or deletion the appeared view's textfield values are saved into corresponding variables for the validation purposes
    // It happens with this function
    func save_values (category: String) {
        switch category {
        case "length":
            current_millimetre = milimetre_textfield.text!
            current_centimetre = centimetre_textfield.text!
            current_metre = metre_textfield.text!
            current_inch = inch_textfield.text!
            current_yard = yard_textfield.text!
            current_mile = mile_textfield.text!
        case "speed":
            current_metres_per_second = metres_per_second_textfield!.text!
            current_miles_per_hour = miles_per_hour.text!
            current_neutrical_miles_per_hour = neutrical_miles_per_hour_textfield.text!
        case "temperature":
            current_celcius = celcius_textfield.text!
            current_fahrenheit = fahrenheit_textfield.text!
            current_kelvin = kelvin_textfield.text!
        case "volume":
            current_gallon = gallon_textfield.text!
            current_litre = litre_textfield.text!
            current_uk_pint = uk_pint_textfield.text!
            current_fl_oz = fluid_ounce_textfield.text!
            current_milliletre = millilitre_textfield.text!
        case "weight":
            current_kilogram = kilogram_textfield.text!
            current_gram = gram_textfield.text!
            current_ounce = ounce_textfield.text!
            current_pound = pound_textfield.text!
            current_stone = stone_textfield.text!
            current_s_pound = s_pound_textfield.text!
        default:
            break
        }
    }
    
    //    When the save button is clicked this function triggers. This checks if not every textfield's value is equal to 0 and every textfield has a which's Float valie is not nil
    //    If both conditions are true, it show the cussess alert. Else the error message alert
    @IBAction func save_button_click(_ sender: Any) {
        switch category {
        case "length":
            if Float(milimetre_textfield.text!) != nil && Float(centimetre_textfield.text!) != nil && Float(metre_textfield.text!) != nil && Float(inch_textfield.text!) != nil && Float(yard_textfield.text!) != nil && Float(milimetre_textfield.text!) != nil && !(Float(milimetre_textfield.text!) == 0 && Float(centimetre_textfield.text!) == 0 && Float(metre_textfield.text!) == 0 && Float(inch_textfield.text!) == 0 && Float(yard_textfield.text!) == 0 && Float(mile_textfield.text!) == 0) {
                historyModel.save_new_result(result: save_string, type: category)
                fade_alert(message: success_message)
            } else {
                showAlert(title: failed_title, message: failed_message)
            }
        case "speed":
            if Float(metres_per_second_textfield.text!) != nil && Float(miles_per_hour.text!) != nil && Float(neutrical_miles_per_hour_textfield.text!) != nil && !(Float(metres_per_second_textfield.text!) == 0 && Float(miles_per_hour.text!) == 0 && Float(neutrical_miles_per_hour_textfield.text!) == 0) {
                historyModel.save_new_result(result: save_string, type: category)
                fade_alert(message: success_message)
            } else {
                showAlert(title: failed_title, message: failed_message)
            }
        case "temperature":
            //    Since here all textfields' values cannot be "0" at the same time. That part is not validated
            if Float(celcius_textfield.text!) != nil && Float(fahrenheit_textfield.text!) != nil && Float(kelvin_textfield.text!) != nil {
                historyModel.save_new_result(result: save_string, type: category)
                fade_alert(message: success_message)
            } else {
                showAlert(title: failed_title, message: failed_message)
            }
        case "volume":
            if Float(gallon_textfield.text!) != nil && Float(litre_textfield.text!) != nil && Float(uk_pint_textfield.text!) != nil && Float(fluid_ounce_textfield.text!) != nil && Float(millilitre_textfield.text!) != nil && !(Float(gallon_textfield.text!) == 0 && Float(litre_textfield.text!) == 0 && Float(uk_pint_textfield.text!) == 0 && Float(fluid_ounce_textfield.text!) == 0 && Float(millilitre_textfield.text!) == 0) {
                historyModel.save_new_result(result: save_string, type: category)
                fade_alert(message: success_message)
            } else {
                showAlert(title: failed_title, message: failed_message)
            }
        case "weight":
            if Float(kilogram_textfield.text!) != nil && Float(gram_textfield.text!) != nil && Float(ounce_textfield.text!) != nil && Float(pound_textfield.text!) != nil && Float(stone_textfield.text!) != nil && Float(s_pound_textfield.text!) != nil && !(Float(kilogram_textfield.text!) == 0 && Float(gram_textfield.text!) == 0 && Float(ounce_textfield.text!) == 0 && Float(pound_textfield.text!) == 0 && (Float(stone_textfield.text!) == 0 && Float(stone_textfield.text!) == 0)) {
                historyModel.save_new_result(result: save_string, type: category)
                fade_alert(message: success_message)
            } else {
                showAlert(title: failed_title, message: failed_message)
            }
        default:
            break
        }
    }
    
    //    Check the cursor position and enter the input value to the left hand side of the cursor
    func type_to_cursor_position (textfield: UITextField, input: String) {
        if let selectedRange = textfield.selectedTextRange {
            let cursorPosition = textfield.offset(from: textfield.beginningOfDocument, to: selectedRange.start)
            let string_value = NSMutableString(string: textfield.text!)
            //    Entering the input to thecurrent cursor possition
            string_value.insert(input, at: (cursorPosition))
            if input != "." {
                textfield.text = validations.validateFirstZero(value: string_value as String)
                if input != "" {
                    //    Increase cursor possition by one
                    if let newPosition = textfield.position(from: selectedRange.start, offset: +1) {
                        textfield.selectedTextRange = textfield.textRange(from: newPosition, to: newPosition)
                    }
                }
            } else {
                if !textfield.text!.contains(".") {
                    textfield.text = validations.validateFirstZeroForDecimal(value: string_value as String)
                    if input != "" {
                        //    Increase cursor possition by two
                        if cursorPosition == 0 {
                            if let newPosition = textfield.position(from: selectedRange.start, offset: +2) {
                                textfield.selectedTextRange = textfield.textRange(from: newPosition, to: newPosition)
                            }
                        //    Increase cursor possition by one
                        } else {
                            if let newPosition = textfield.position(from: selectedRange.start, offset: +1) {
                                textfield.selectedTextRange = textfield.textRange(from: newPosition, to: newPosition)
                            }
                        }
                    }
                }
            }
        }
    }
    
    //    Check the cursor possition and delete the value left to the cursor
    func delete_from_cursor_position (textfield: UITextField) {
        if let selectedRange = textfield.selectedTextRange {
            let cursorPosition = textfield.offset(from: textfield.beginningOfDocument, to: selectedRange.start)
            print("\(cursorPosition)")
            // Check if there is any value in the left hand side of the cursor
            if cursorPosition > 0 {
                //    Delete the value in the left hand side to the cursor possition
                textfield.text?.remove(at: (textfield.text?.index((textfield.text?.startIndex)!, offsetBy: cursorPosition - 1))!)
            }
            // Decrese cursor possition by one
            if let newPosition = textfield.position(from: selectedRange.start, offset: -1) {
                textfield.selectedTextRange = textfield.textRange(from: newPosition, to: newPosition)
            }
        }
    }
    
    //    This function validates the textfield.text and then call for delete _from_cursor_position function
    func validate_and_call_for_delete(textfield: UITextField, category: String, unit: String) {
        //    Checks if the textfield value is not a float
        if Float(textfield.text!) == nil || textfield.text!.contains("e+"){
            textfield.text = ""
        } else {
            //    Check if the category is Twmperature
            //    Only Temperature can contain minus symbol
            if category == "temperature" {
                if validations.validateDuplication(value: textfield.text!, input: "+") == false {
                    textfield.text!.removeFirst()
                }
            } else {
                if validations.validateDuplication(value: textfield.text!, input: "+") == false || validations.validateDuplication(value: textfield.text!, input: "-") == false {
                    textfield.text!.removeFirst()
                }
            }
        }
        delete_from_cursor_position(textfield: textfield)
        //    If the textfield is stone or s_pound validates both stone and s_pound textfields
        if textfield == stone_textfield {
            if Float(s_pound_textfield.text!) == nil {
                s_pound_textfield.text = ""
            } else if validations.validateDuplication(value: s_pound_textfield.text!, input: "+") == false || validations.validateDuplication(value: s_pound_textfield.text!, input: "-")  == false {
                s_pound_textfield.text!.removeFirst()
            }
        } else if textfield == s_pound_textfield {
            if Float(stone_textfield.text!) == nil {
                stone_textfield.text = ""
            } else if validations.validateDuplication(value: stone_textfield.text!, input: "+") == false || validations.validateDuplication(value: stone_textfield.text!, input: "-")  == false {
                stone_textfield.text!.removeFirst()
            }
        }
        //    Remove useless zeros at the begining
        textfield.text = validations.validateFirstZero(value: textfield.text!)
        save_values(category: category)
        if textfield.text! == "-" {
            convertValue(value: "", unit: unit, input: "")
        } else {
            convertValue(value: textfield.text!, unit: unit, input: "")
        }
    }

    //    This function validates the textfield and triggers the type_co_cursor_position function
    func validate_and_call_for_type (textfield: UITextField, input: String, comparaison: String, unit: String, catergory: String) {
        // if the value is a negetive value, then it converts to a positive value and save minus mark to a valirable
        var minus = ""
        if textfield.text!.contains("-") {
            minus = "-"
        }
        // Check if the value is not a float value
        if Float(textfield.text!) == nil || textfield.text!.contains("e+"){
            if input == "." {
                textfield.text = "0"
                type_to_cursor_position(textfield: textfield, input: input)
            } else {
                if textfield.text?.prefix(1) == "-" {
                    minus = "-"
                }
                textfield.text = validations.validatedInvalidEntries(value: textfield.text!, comparison_value: comparaison, input: input)
            }
        } else {
            //    Temperature can contains "-", so validations are only for "+"
            if catergory == "temperature" {
                if validations.validateDuplication(value: textfield.text!, input: "+") == false {
                    textfield.text!.removeFirst()
                }
            } else {
                if validations.validateDuplication(value: textfield.text!, input: "+") == false || validations.validateDuplication(value: textfield.text!, input: "-") == false {
                    textfield.text!.removeFirst()
                }
            }
            type_to_cursor_position(textfield: textfield, input: input)
        }
        if textfield == stone_textfield {
            //    If the value is stone or s_pound, both stone and s_pound are validated
            if Float(s_pound_textfield.text!) == nil || s_pound_textfield.text!.contains("e") {
                s_pound_textfield.text = "0"
            } else {
                if validations.validateDuplication(value: s_pound_textfield.text!, input: "+") == false || validations.validateDuplication(value: s_pound_textfield.text!, input: "-") == false {
                    s_pound_textfield.text!.removeFirst()
                }
                s_pound_textfield.text = validations.validateFirstZero(value: s_pound_textfield.text!)
            }
            s_pound_textfield.text = validations.validateEmpty(value: s_pound_textfield.text!)
        } else if textfield == s_pound_textfield {
            if Float(stone_textfield.text!) == nil || stone_textfield.text!.contains("e") {
                stone_textfield.text = "0"
            } else {
                if validations.validateDuplication(value: stone_textfield.text!, input: "+") == false || validations.validateDuplication(value: stone_textfield.text!, input: "-") == false {
                    stone_textfield.text!.removeFirst()
                }
                stone_textfield.text = validations.validateFirstZero(value: stone_textfield.text!)
            }
            stone_textfield.text = validations.validateEmpty(value: stone_textfield.text!)
        }
        //    Maximum input length is 15 characters ( and negetvie mark)
        if textfield.text!.count > 15 {
            textfield.text = comparaison
            showAlert(title: sorry_title, message: sorry_message)
        }
        if catergory == "temperature" && !textfield.text!.contains("-") {
            textfield.text = minus + textfield.text!
        }
        save_values(category: category)
        if textfield.text! != "-" {
            convertValue(value: textfield.text!, unit: unit, input: input)
        }
    }
    
    //    Type 0 to 9 numbers in text fields using the custom keyboard.
    //    Check if the String contains characters other than 0 to 9 numbers, ".", "-" (only for temperature) and remove them,
    //    Remove first useless zeros Send value to the real-time converter function
    func typeInTo (category: String, input: String){
        switch category {
        case "length":
            if milimetre_textfield.isEditing == true {
                validate_and_call_for_type(textfield: milimetre_textfield, input: input, comparaison: current_millimetre, unit: "milimetre", catergory: "length")
            } else if centimetre_textfield.isEditing == true {
                validate_and_call_for_type(textfield: centimetre_textfield, input: input, comparaison: current_centimetre, unit: "centimetre", catergory: "length")
            } else if metre_textfield.isEditing == true {
                validate_and_call_for_type(textfield: metre_textfield, input: input, comparaison: current_metre, unit: "metre", catergory: "length")
            } else if inch_textfield.isEditing == true {
                validate_and_call_for_type(textfield: inch_textfield, input: input, comparaison: current_inch, unit: "inch", catergory: "length")
            } else if yard_textfield.isEditing == true {
                validate_and_call_for_type(textfield: yard_textfield, input: input, comparaison: current_yard, unit: "yard", catergory: "length")
            } else if mile_textfield.isEditing == true {
                validate_and_call_for_type(textfield: mile_textfield, input: input, comparaison: current_mile, unit: "mile", catergory: "length")
            }
        case "speed":
            if metres_per_second_textfield.isEditing == true {
                validate_and_call_for_type(textfield: metres_per_second_textfield, input: input, comparaison: current_metres_per_second, unit: "metre/s", catergory: "speed")
            } else if miles_per_hour.isEditing == true {
                validate_and_call_for_type(textfield: miles_per_hour, input: input, comparaison: current_miles_per_hour, unit: "mile/h", catergory: "speed")
            } else if neutrical_miles_per_hour_textfield.isEditing == true {
                validate_and_call_for_type(textfield: neutrical_miles_per_hour_textfield, input: input, comparaison: current_neutrical_miles_per_hour, unit: "n mile/h", catergory: "speed")
            }
        case "temperature":
            if celcius_textfield.isEditing == true {
                validate_and_call_for_type(textfield: celcius_textfield, input: input, comparaison: current_celcius, unit: "celcius", catergory: "temperature")
            } else if fahrenheit_textfield.isEditing == true {
                validate_and_call_for_type(textfield: fahrenheit_textfield, input: input, comparaison: current_fahrenheit, unit: "fahrenheit", catergory: "temperature")
            } else if kelvin_textfield.isEditing == true {
                validate_and_call_for_type(textfield: kelvin_textfield, input: input, comparaison: current_kelvin, unit: "kelvin", catergory: "temperature")
            }
        case "volume":
            if gallon_textfield.isEditing == true {
                validate_and_call_for_type(textfield: gallon_textfield, input: input, comparaison: current_gallon, unit: "gallon", catergory: "volume")
            } else if litre_textfield.isEditing == true {
                validate_and_call_for_type(textfield: litre_textfield, input: input, comparaison: current_litre, unit: "litre", catergory: "volume")
            } else if uk_pint_textfield.isEditing == true {
                validate_and_call_for_type(textfield: uk_pint_textfield, input: input, comparaison: current_uk_pint, unit: "uk pint", catergory: "volume")
            } else if fluid_ounce_textfield.isEditing == true {
                validate_and_call_for_type(textfield: fluid_ounce_textfield, input: input, comparaison: current_fl_oz, unit: "fl oz", catergory: "volume")
            } else if millilitre_textfield.isEditing == true {
                validate_and_call_for_type(textfield: millilitre_textfield, input: input, comparaison: current_millimetre, unit: "millilitre", catergory: "volume")
            }
        case "weight":
            if kilogram_textfield.isEditing == true {
                validate_and_call_for_type(textfield: kilogram_textfield, input: input, comparaison: current_kilogram, unit: "kilogram", catergory: "weight")
            } else if gram_textfield.isEditing == true {
                validate_and_call_for_type(textfield: gram_textfield, input: input, comparaison: current_gram, unit: "gram", catergory: "weight")
            } else if ounce_textfield.isEditing == true {
                validate_and_call_for_type(textfield: ounce_textfield, input: input, comparaison: current_ounce, unit: "ounce", catergory: "weight")
            } else if pound_textfield.isEditing == true {
                validate_and_call_for_type(textfield: pound_textfield, input: input, comparaison: current_pound, unit: "pound", catergory: "weight")
            } else if stone_textfield.isEditing == true {
                validate_and_call_for_type(textfield: stone_textfield, input: input, comparaison: current_stone, unit: "stone", catergory: "weight")
            } else if s_pound_textfield.isEditing == true {
                validate_and_call_for_type(textfield: s_pound_textfield, input: input, comparaison: current_s_pound, unit: "s pound", catergory: "weight")
            }
        default:
            break
        }
    }
    
    //    When the delete button is triggered this function triggers innitially
    //    This identifies the focused textfield and send the focused textfields data to validate_and_call_for_deleted function
    func deleteLastFrom (category: String){
        switch category {
        case "length":
            if milimetre_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: milimetre_textfield, category: "length", unit: "milimetre")
            } else if centimetre_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: centimetre_textfield, category: "length", unit: "centimetre")
            } else if metre_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: metre_textfield, category: "length", unit: "metre")
            } else if inch_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: inch_textfield, category: "length", unit: "inch")
            } else if yard_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: yard_textfield, category: "length", unit: "yard")
            } else if mile_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: mile_textfield, category: "length", unit: "mile")
            }
        case "speed":
            if metres_per_second_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: metres_per_second_textfield, category: "speed", unit: "metre/s")
            } else if miles_per_hour.isEditing == true {
                validate_and_call_for_delete(textfield: miles_per_hour, category: "speed", unit: "mile/h")
            } else if neutrical_miles_per_hour_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: neutrical_miles_per_hour_textfield, category: "speed", unit: "n mile/h")
            }
        case "temperature":
            if celcius_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: celcius_textfield, category: "temperature", unit: "celcius")
            } else if fahrenheit_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: fahrenheit_textfield, category: "temperature", unit: "fahrenheit")
            } else if kelvin_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: kelvin_textfield, category: "temperature", unit: "kelvin")
            }
        case "volume":
            if gallon_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: gallon_textfield, category: "volume", unit: "gallon")
            } else if litre_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: litre_textfield, category: "volume", unit: "litre")
            } else if uk_pint_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: uk_pint_textfield, category: "volume", unit: "uk pint")
            } else if fluid_ounce_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: fluid_ounce_textfield, category: "volume", unit: "fl oz")
            } else if millilitre_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: millilitre_textfield, category: "volume", unit: "millilitre")
            }
        case "weight":
            if kilogram_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: kilogram_textfield, category: "weight", unit: "kilogram")
            } else if gram_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: gram_textfield, category: "weight", unit: "gram")
            } else if ounce_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: ounce_textfield, category: "weight", unit: "ounce")
            } else if pound_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: pound_textfield, category: "weight", unit: "pound")
            } else if stone_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: stone_textfield, category: "weight", unit: "stone")
            } else if s_pound_textfield.isEditing == true {
                validate_and_call_for_delete(textfield: s_pound_textfield, category: "weight", unit: "s pound")
            }
        default:
            print("default")
        }
    }
    
    //    When the negetvie (NEG) button is clicked this function triggers innitially.
    //    Then the function validates the focused textfields value, add or remove the "-" and calls the converter function
    func typeMinusInTo (category: String, input: String){
        
        if celcius_textfield.isEditing == true {
            if Float(celcius_textfield.text!) == nil && celcius_textfield.text != "" && celcius_textfield.text != "-" {
                celcius_textfield.text = input
            } else if validations.validateDuplication(value: celcius_textfield.text!, input: "-") == false {
                celcius_textfield.text!.removeFirst()
            } else if validations.validateDuplication(value: celcius_textfield.text!, input: "+") == false {
                celcius_textfield.text!.removeFirst()
                celcius_textfield.text = input + validations.validateFirstZero(value: celcius_textfield.text!)
            } else {
                celcius_textfield.text = input + validations.validateFirstZero(value: celcius_textfield.text!)
            }
            save_values(category: "temperature")
            if celcius_textfield.text != "-" && celcius_textfield.text != "" {
                convertValue(value: celcius_textfield.text!, unit: "celcius", input: "-")
            }
        } else if fahrenheit_textfield.isEditing == true {
            if Float(fahrenheit_textfield.text!) == nil && fahrenheit_textfield.text != ""  && fahrenheit_textfield.text != "-" {
                fahrenheit_textfield.text = input
            } else if validations.validateDuplication(value: fahrenheit_textfield.text!, input: "-") == false {
                fahrenheit_textfield.text!.removeFirst()
            } else if validations.validateDuplication(value: fahrenheit_textfield.text!, input: "+") == false {
                fahrenheit_textfield.text!.removeFirst()
                fahrenheit_textfield.text = input + validations.validateFirstZero(value: fahrenheit_textfield.text!)
            } else {
                fahrenheit_textfield.text = input + validations.validateFirstZero(value: fahrenheit_textfield.text!)
            }
            save_values(category: "temperature")
            if fahrenheit_textfield.text != "-" && fahrenheit_textfield.text != "" {
                convertValue(value: fahrenheit_textfield.text!, unit: "fahrenheit", input: "-")
            }
        } else if kelvin_textfield.isEditing == true {
            if Float(kelvin_textfield.text!) == nil && kelvin_textfield.text != ""  && kelvin_textfield.text != "-" {
                kelvin_textfield.text = input
            } else if validations.validateDuplication(value: kelvin_textfield.text!, input: "-") == false {
                kelvin_textfield.text!.removeFirst()
            } else if validations.validateDuplication(value: kelvin_textfield.text!, input: "+") == false {
                kelvin_textfield.text!.removeFirst()
                kelvin_textfield.text = input + validations.validateFirstZero(value: kelvin_textfield.text!)
            } else {
                kelvin_textfield.text = input + validations.validateFirstZero(value: kelvin_textfield.text!)
            }
            save_values(category: "temperature")
            if kelvin_textfield.text != "-" && kelvin_textfield.text != "" {
                convertValue(value: kelvin_textfield.text!, unit: "kelvin", input: "-")
            }
        }
    }
    
    // Save button appears only after a value is converted. If at least one textfield's value is not equal to "0", zero and all values are float values save button appears
    func show_save_button (category: String) {
        switch category {
        case "length":
            if Float(milimetre_textfield.text!) != nil && Float(centimetre_textfield.text!) != nil && Float(metre_textfield.text!) != nil && Float(inch_textfield.text!) != nil && Float(yard_textfield.text!) != nil && Float(milimetre_textfield.text!) != nil && !(Float(milimetre_textfield.text!) == 0 && Float(centimetre_textfield.text!) == 0 && Float(metre_textfield.text!) == 0 && Float(inch_textfield.text!) == 0 && Float(yard_textfield.text!) == 0 && Float(mile_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "speed":
            if Float(metres_per_second_textfield.text!) != nil && Float(miles_per_hour.text!) != nil && Float(neutrical_miles_per_hour_textfield.text!) != nil && !(Float(metres_per_second_textfield.text!) == 0 && Float(miles_per_hour.text!) == 0 && Float(neutrical_miles_per_hour_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        // Tempereture category's all textfields cannot be "0" at the same time. Therefore Only the float validation is added here
        case "temperature":
            if Float(celcius_textfield.text!) != nil && Float(fahrenheit_textfield.text!) != nil && Float(kelvin_textfield.text!) != nil {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "volume":
            if Float(gallon_textfield.text!) != nil && Float(litre_textfield.text!) != nil && Float(uk_pint_textfield.text!) != nil && Float(fluid_ounce_textfield.text!) != nil && Float(millilitre_textfield.text!) != nil && !(Float(gallon_textfield.text!) == 0 && Float(litre_textfield.text!) == 0 && Float(uk_pint_textfield.text!) == 0 && Float(fluid_ounce_textfield.text!) == 0 && Float(millilitre_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "weight":
            if Float(kilogram_textfield.text!) != nil && Float(gram_textfield.text!) != nil && Float(ounce_textfield.text!) != nil && Float(pound_textfield.text!) != nil && Float(stone_textfield.text!) != nil && Float(s_pound_textfield.text!) != nil && !(Float(kilogram_textfield.text!) == 0 && Float(gram_textfield.text!) == 0 && Float(ounce_textfield.text!) == 0 && Float(pound_textfield.text!) == 0 && (Float(stone_textfield.text!) == 0 && Float(stone_textfield.text!) == 0)){
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        default:
            break
        }
    }
    
    //    Calls the converter function related to the focused textfield and show the result in the coresponding text field
    //    If the focused textfield has no value, then the view's all values become empty. Else the converter works
    //    If the convertion is done save_string variable upadates with the convertion results
    func convertValue(value: String, unit: String, input: String) {
        switch unit {
        //    LENGTH CONVERTIONS
        case "milimetre":
            if value == "" {
                centimetre_textfield.text = ""
                metre_textfield.text = ""
                inch_textfield.text = ""
                yard_textfield.text = ""
                mile_textfield.text = ""
            } else {
                centimetre_textfield.text = converterModel.convertMilimetre(value: milimetre_textfield.text!, to_unit: "centimetre")
                metre_textfield.text = converterModel.convertMilimetre(value: milimetre_textfield.text!, to_unit: "metre")
                inch_textfield.text = converterModel.convertMilimetre(value: milimetre_textfield.text!, to_unit: "inch")
                yard_textfield.text = converterModel.convertMilimetre(value: milimetre_textfield.text!, to_unit: "yard")
                mile_textfield.text = converterModel.convertMilimetre(value: milimetre_textfield.text!, to_unit: "mile")
                save_string = "\(value) mm = \(centimetre_textfield.text!) cm = \(metre_textfield.text!) m = \(inch_textfield.text!) inches = \(yard_textfield.text!) yards = \(mile_textfield.text!) miles"
            }
            show_save_button(category: "length")
        case "centimetre":
            if value == "" {
                milimetre_textfield.text = ""
                metre_textfield.text = ""
                inch_textfield.text = ""
                yard_textfield.text = ""
                mile_textfield.text = ""
            } else {
                milimetre_textfield.text = converterModel.convertCentimetre(value: centimetre_textfield.text!, to_unit: "millimetre")
                metre_textfield.text = converterModel.convertCentimetre(value: centimetre_textfield.text!, to_unit: "metre")
                inch_textfield.text = converterModel.convertCentimetre(value: centimetre_textfield.text!, to_unit: "inch")
                yard_textfield.text = converterModel.convertCentimetre(value: centimetre_textfield.text!, to_unit: "yard")
                mile_textfield.text = converterModel.convertCentimetre(value: centimetre_textfield.text!, to_unit: "mile")
                save_string = "\(value) cm = \(milimetre_textfield.text!) mm = \(metre_textfield.text!) m = \(inch_textfield.text!) inches = \(yard_textfield.text!) yards = \(mile_textfield.text!) miles"
            }
            show_save_button(category: "length")
        case "metre":
            if value == "" {
                milimetre_textfield.text = ""
                centimetre_textfield.text = ""
                inch_textfield.text = ""
                yard_textfield.text = ""
                mile_textfield.text = ""
            } else {
                milimetre_textfield.text = converterModel.convertMetre(value: metre_textfield.text!, to_unit: "millimetre")
                centimetre_textfield.text = converterModel.convertMetre(value: metre_textfield.text!, to_unit: "centimetre")
                inch_textfield.text = converterModel.convertMetre(value: metre_textfield.text!, to_unit: "inch")
                yard_textfield.text = converterModel.convertMetre(value: metre_textfield.text!, to_unit: "yard")
                mile_textfield.text = converterModel.convertMetre(value: metre_textfield.text!, to_unit: "mile")
                save_string = "\(value) m = \(milimetre_textfield.text!) mm = \(centimetre_textfield.text!) cm = \(inch_textfield.text!) inches = \(yard_textfield.text!) yards = \(mile_textfield.text!) miles"
            }
            show_save_button(category: "length")
        case "inch":
            if value == "" {
                milimetre_textfield.text = ""
                centimetre_textfield.text = ""
                metre_textfield.text = ""
                yard_textfield.text = ""
                mile_textfield.text = ""
            } else {
                milimetre_textfield.text = converterModel.convertInch(value: inch_textfield.text!, to_unit: "millimetre")
                centimetre_textfield.text = converterModel.convertInch(value: inch_textfield.text!, to_unit: "centimetre")
                metre_textfield.text = converterModel.convertInch(value: inch_textfield.text!, to_unit: "metre")
                yard_textfield.text = converterModel.convertInch(value: inch_textfield.text!, to_unit: "yard")
                mile_textfield.text = converterModel.convertInch(value: inch_textfield.text!, to_unit: "mile")
                save_string = "\(value) inches = \(milimetre_textfield.text!) mm = \(centimetre_textfield.text!) cm = \(metre_textfield.text!) m = \(yard_textfield.text!) yards = \(mile_textfield.text!) miles"
            }
            show_save_button(category: "length")
        case "yard":
            if value == "" {
                milimetre_textfield.text = ""
                centimetre_textfield.text = ""
                metre_textfield.text = ""
                inch_textfield.text = ""
                mile_textfield.text = ""
            } else {
                milimetre_textfield.text = converterModel.convertYard(value: yard_textfield.text!, to_unit: "millimetre")
                centimetre_textfield.text = converterModel.convertYard(value: yard_textfield.text!, to_unit: "centimetre")
                metre_textfield.text = converterModel.convertYard(value: yard_textfield.text!, to_unit: "metre")
                inch_textfield.text = converterModel.convertYard(value: yard_textfield.text!, to_unit: "inch")
                mile_textfield.text = converterModel.convertYard(value: yard_textfield.text!, to_unit: "mile")
                save_string = "\(value) yards = \(milimetre_textfield.text!) mm = \(centimetre_textfield.text!) cm = \(metre_textfield.text!) m = \(inch_textfield.text!) inches = \(mile_textfield.text!) miles"
            }
            show_save_button(category: "length")
        case "mile":
            if value == "" {
                milimetre_textfield.text = ""
                centimetre_textfield.text = ""
                metre_textfield.text = ""
                inch_textfield.text = ""
                yard_textfield.text = ""
            } else {
                milimetre_textfield.text = converterModel.convertMile(value: mile_textfield.text!, to_unit: "millimetre")
                centimetre_textfield.text = converterModel.convertMile(value: mile_textfield.text!, to_unit: "centimetre")
                metre_textfield.text = converterModel.convertMile(value: mile_textfield.text!, to_unit: "metre")
                inch_textfield.text = converterModel.convertMile(value: mile_textfield.text!, to_unit: "inch")
                yard_textfield.text = converterModel.convertMile(value: mile_textfield.text!, to_unit: "yard")
                save_string = " \(value) miles = \(milimetre_textfield.text!) mm = \(centimetre_textfield.text!) cm = \(metre_textfield.text!) m = \(inch_textfield.text!) inches = \(yard_textfield.text!) yards"
            }
            show_save_button(category: "length")
            
        //    SPEED CONVERTIONS
        case "metre/s":
            if value == "" {
                miles_per_hour.text = ""
                neutrical_miles_per_hour_textfield.text = ""
            } else {
                miles_per_hour.text = converterModel.convertMetresPerSecond(value: metres_per_second_textfield.text!, to_unit: "mile/h")
                neutrical_miles_per_hour_textfield.text = converterModel.convertMetresPerSecond(value: metres_per_second_textfield.text!, to_unit: "neutrical mile/h")
                save_string = "\(value) m/s = \(miles_per_hour.text!) mile/h = \(neutrical_miles_per_hour_textfield.text!) Knot"
            }
            show_save_button(category: "speed")
        case "mile/h":
            if value == "" {
                metres_per_second_textfield.text = ""
                neutrical_miles_per_hour_textfield.text = ""
            } else {
                metres_per_second_textfield.text = converterModel.convertMilesPerHour(value: miles_per_hour.text!, to_unit: "metre/s")
                neutrical_miles_per_hour_textfield.text = converterModel.convertMilesPerHour(value: miles_per_hour.text!, to_unit: "neutrical mile/h")
                save_string = "\(value) mile/h = \(metres_per_second_textfield.text!) m/s = \(neutrical_miles_per_hour_textfield.text!) Knot"
            }
            show_save_button(category: "speed")
        case "n mile/h":
            if value == "" {
                metres_per_second_textfield.text = ""
                miles_per_hour.text = ""
            } else {
                metres_per_second_textfield.text = converterModel.convertNeutricalMilesPerHour(value: neutrical_miles_per_hour_textfield.text!, to_unit: "metre/s")
                miles_per_hour.text = converterModel.convertNeutricalMilesPerHour(value: neutrical_miles_per_hour_textfield.text!, to_unit: "mile/h")
                save_string = "\(value) Knot = \(metres_per_second_textfield.text!) m/s = \(miles_per_hour.text!) mile/h"
            }
            show_save_button(category: "speed")
            
        //    TEMPERATURE CONVERTIONS
        case "celcius":
            if value == "" {
                fahrenheit_textfield.text = ""
                kelvin_textfield.text = ""
            } else {
                fahrenheit_textfield.text = converterModel.convertCelcius(value: celcius_textfield.text!, to_unit: "fahrenheit")
                kelvin_textfield.text = converterModel.convertCelcius(value: celcius_textfield.text!, to_unit: "kelvin")
                save_string = "\(value) °C = \(fahrenheit_textfield.text!) °F = \(kelvin_textfield.text!) K"
            }
            show_save_button(category: "temperature")
        case "fahrenheit":
            if value == "" {
                celcius_textfield.text = ""
                kelvin_textfield.text = ""
            } else {
                celcius_textfield.text = converterModel.convertFahrenheit(value: fahrenheit_textfield.text!, to_unit: "celcius")
                kelvin_textfield.text = converterModel.convertFahrenheit(value: fahrenheit_textfield.text!, to_unit: "kelvin")
                save_string = "\(value) °F = \(celcius_textfield.text!) °C = \(kelvin_textfield.text!) K"
            }
            show_save_button(category: "temperature")
        case "kelvin":
            if value == "" {
                celcius_textfield.text = ""
                fahrenheit_textfield.text = ""
            } else {
                celcius_textfield.text = converterModel.convertKelvin(value: kelvin_textfield.text!, to_unit: "celcius")
                fahrenheit_textfield.text = converterModel.convertKelvin(value: kelvin_textfield.text!, to_unit: "fahrenheit")
                save_string = "\(value) K = \(celcius_textfield.text!) °C = \(fahrenheit_textfield.text!) °F"
            }
            show_save_button(category: "temperature")
        //    VOLUME CONVERTIONS
        case "gallon":
            if value == "" {
                litre_textfield.text = ""
                uk_pint_textfield.text = ""
                fluid_ounce_textfield.text = ""
                millilitre_textfield.text = ""
            } else {
                litre_textfield.text = converterModel.convertGallon(value: gallon_textfield.text!, to_unit: "litre")
                uk_pint_textfield.text = converterModel.convertGallon(value: gallon_textfield.text!, to_unit: "uk pint")
                fluid_ounce_textfield.text = converterModel.convertGallon(value: gallon_textfield.text!, to_unit: "fluid ounce")
                millilitre_textfield.text = converterModel.convertGallon(value: gallon_textfield.text!, to_unit: "millilitre")
                save_string = " \(value) gal = \(litre_textfield.text!) l = \(uk_pint_textfield.text!) pint = \(fluid_ounce_textfield.text!) fl oz = \(millilitre_textfield.text!) ml"
            }
            show_save_button(category: "volume")
        case "litre":
            if value == "" {
                gallon_textfield.text = ""
                uk_pint_textfield.text = ""
                fluid_ounce_textfield.text = ""
                millilitre_textfield.text = ""
            } else {
                gallon_textfield.text = converterModel.convertLitre(value: litre_textfield.text!, to_unit: "gallon")
                uk_pint_textfield.text = converterModel.convertLitre(value: litre_textfield.text!, to_unit: "uk pint")
                fluid_ounce_textfield.text = converterModel.convertLitre(value: litre_textfield.text!, to_unit: "fluid ounce")
                millilitre_textfield.text = converterModel.convertLitre(value: litre_textfield.text!, to_unit: "millilitre")
                save_string = " \(value) l = \(gallon_textfield.text!) gal = \(uk_pint_textfield.text!) pint = \(fluid_ounce_textfield.text!) fl oz = \(millilitre_textfield.text!) ml"
            }
            show_save_button(category: "volume")
        case "uk pint":
            if value == "" {
                gallon_textfield.text = ""
                litre_textfield.text = ""
                fluid_ounce_textfield.text = ""
                millilitre_textfield.text = ""
            } else {
                gallon_textfield.text = converterModel.convertUkPint(value: uk_pint_textfield.text!, to_unit: "gallon")
                litre_textfield.text = converterModel.convertUkPint(value: uk_pint_textfield.text!, to_unit: "litre")
                fluid_ounce_textfield.text = converterModel.convertUkPint(value: uk_pint_textfield.text!, to_unit: "fluid ounce")
                millilitre_textfield.text = converterModel.convertUkPint(value: uk_pint_textfield.text!, to_unit: "millilitre")
                save_string = " \(value) pint = \(gallon_textfield.text!) gal = \(litre_textfield.text!) l = \(fluid_ounce_textfield.text!) fl oz = \(millilitre_textfield.text!) ml"
            }
            show_save_button(category: "volume")
        case "fl oz":
            if value == "" {
                gallon_textfield.text = ""
                litre_textfield.text = ""
                uk_pint_textfield.text = ""
                millilitre_textfield.text = ""
            } else {
                gallon_textfield.text = converterModel.convertFluidOunce(value: fluid_ounce_textfield.text!, to_unit: "gallon")
                litre_textfield.text = converterModel.convertFluidOunce(value: fluid_ounce_textfield.text!, to_unit: "litre")
                uk_pint_textfield.text = converterModel.convertFluidOunce(value: fluid_ounce_textfield.text!, to_unit: "uk pint")
                millilitre_textfield.text = converterModel.convertFluidOunce(value: fluid_ounce_textfield.text!, to_unit: "millilitre")
                save_string = " \(value) fl oz = \(gallon_textfield.text!) gal = \(litre_textfield.text!) l = \(uk_pint_textfield.text!) pint = \(millilitre_textfield.text!) ml"
            }
            show_save_button(category: "volume")
        case "millilitre":
            if value == "" {
                gallon_textfield.text = ""
                litre_textfield.text = ""
                uk_pint_textfield.text = ""
                fluid_ounce_textfield.text = ""
            } else {
                gallon_textfield.text = converterModel.convertMillilitre(value: millilitre_textfield.text!, to_unit: "gallon")
                litre_textfield.text = converterModel.convertMillilitre(value: millilitre_textfield.text!, to_unit: "litre")
                uk_pint_textfield.text = converterModel.convertMillilitre(value: millilitre_textfield.text!, to_unit: "uk pint")
                fluid_ounce_textfield.text = converterModel.convertMillilitre(value: millilitre_textfield.text!, to_unit: "fluid ounce")
                save_string = " \(value) ml = \(gallon_textfield.text!) gal = \(litre_textfield.text!) l = \(uk_pint_textfield.text!) pint = \(fluid_ounce_textfield.text!) fl oz"
            }
            show_save_button(category: "volume")
            
        //    WEIGHT CONVERTIONS
        case "kilogram":
            if value == "" {
                gram_textfield.text = ""
                ounce_textfield.text = ""
                pound_textfield.text = ""
                stone_textfield.text = ""
                s_pound_textfield.text = ""
            } else {
                gram_textfield.text = converterModel.convertKilogram(value: kilogram_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertKilogram(value: kilogram_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertKilogram(value: kilogram_textfield.text!, to_unit: "pound")
                stone_textfield.text = converterModel.convertKilogram(value: kilogram_textfield.text!, to_unit: "stone")
                s_pound_textfield.text = converterModel.convertKilogram(value: kilogram_textfield.text!, to_unit: "s pound")
                save_string = " \(value) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs = \(stone_textfield.text!) st. and \(s_pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        case "gram":
            if value == "" {
                kilogram_textfield.text = ""
                ounce_textfield.text = ""
                pound_textfield.text = ""
                stone_textfield.text = ""
                s_pound_textfield.text = ""
            } else {
                kilogram_textfield.text = converterModel.convertGram(value: gram_textfield.text!, to_unit: "kilogram")
                ounce_textfield.text = converterModel.convertGram(value: gram_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertGram(value: gram_textfield.text!, to_unit: "pound")
                stone_textfield.text = converterModel.convertGram(value: gram_textfield.text!, to_unit: "stone")
                s_pound_textfield.text = converterModel.convertGram(value: gram_textfield.text!, to_unit: "s pound")
                save_string = " \(value) g = \(kilogram_textfield.text!) kg = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs = \(stone_textfield.text!) st. and \(s_pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        case "ounce":
            if value == "" {
                kilogram_textfield.text = ""
                gram_textfield.text = ""
                pound_textfield.text = ""
                stone_textfield.text = ""
                s_pound_textfield.text = ""
            } else {
                kilogram_textfield.text = converterModel.convertOunce(value: ounce_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertOunce(value: ounce_textfield.text!, to_unit: "gram")
                pound_textfield.text = converterModel.convertOunce(value: ounce_textfield.text!, to_unit: "pound")
                stone_textfield.text = converterModel.convertOunce(value: ounce_textfield.text!, to_unit: "stone")
                s_pound_textfield.text = converterModel.convertOunce(value: ounce_textfield.text!, to_unit: "s pound")
                save_string = " \(value) oz = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(pound_textfield.text!) lbs = \(stone_textfield.text!) st. and \(s_pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        case "pound":
            if value == "" {
                kilogram_textfield.text = ""
                gram_textfield.text = ""
                ounce_textfield.text = ""
                stone_textfield.text = ""
                s_pound_textfield.text = ""
            } else {
                kilogram_textfield.text = converterModel.convertPound(value: pound_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertPound(value: pound_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertPound(value: pound_textfield.text!, to_unit: "ounce")
                stone_textfield.text = converterModel.convertPound(value: pound_textfield.text!, to_unit: "stone")
                s_pound_textfield.text = converterModel.convertPound(value: pound_textfield.text!, to_unit: "s pound")
                save_string = " \(value) lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(stone_textfield.text!) st. and \(s_pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        case "stone":
            //    In here to show empty result stone and s_pound both should be empty ("")
            if stone_textfield.text! == "" && s_pound_textfield.text! == "" {
                kilogram_textfield.text = ""
                gram_textfield.text = ""
                ounce_textfield.text = ""
                pound_textfield.text = ""
            //    If stone textfield is empty, then it means 0 stones and X pounds
            } else if stone_textfield.text! == "" {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "pound")
                save_string = "0 st. and  \(s_pound_textfield.text!) lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            //    If s_pound is empty it means X stones and 0 pounds
            } else if s_pound_textfield.text! == "" {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "pound")
                save_string = "\(value) st. and  0 lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            //    If both are not empty, then it works as normal
            } else {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "pound")
                save_string = "\(value) st. and  \(s_pound_textfield.text!) lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        case "s pound":
            //    In here to show empty result stone and s_pound both should be empty ("")
            if stone_textfield.text! == "" && s_pound_textfield.text! == "" {
                kilogram_textfield.text = ""
                gram_textfield.text = ""
                ounce_textfield.text = ""
                pound_textfield.text = ""
                //    If stone textfield is empty, then it means 0 stones and X pounds
            } else if stone_textfield.text! == "" {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: "0", pound_value: s_pound_textfield.text!, to_unit: "pound")
                save_string = "0 st. and  \(value) lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            //    If s_pound is empty it means X stones and 0 pounds
            } else if s_pound_textfield.text! == "" {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: "0", to_unit: "pound")
                save_string = "\(stone_textfield.text!) st. and  0 lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            //    If both are not empty, then it works as normal
            } else {
                kilogram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "kilogram")
                gram_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "gram")
                ounce_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "ounce")
                pound_textfield.text = converterModel.convertStonePound(stone_value: stone_textfield.text!, pound_value: s_pound_textfield.text!, to_unit: "pound")
                save_string = "\(stone_textfield.text!) st. and  \(value) lbs = \(kilogram_textfield.text!) kg = \(gram_textfield.text!) g = \(ounce_textfield.text!) oz = \(pound_textfield.text!) lbs"
            }
            show_save_button(category: "weight")
        default:
            break
        }
    }
    
    //    When a button of the custom tab bar a the bottom of the view is triggered, this function triggers
    //    This function changes the apearing view depending on the selected button and highlight the selected tab bar button and validate the textfield values to show save button
    func selectCategory(category: String) {
        //    Innitially it hides all views
        length_view.isHidden = true
        speed_view.isHidden = true
        temperature_view.isHidden = true
        volume_view.isHidden = true
        weight_view.isHidden = true
        // Initially Hides the minus button
        minus_button.isHidden = true
        // Remove the all highlitings of the tab bar buttons
        length_selected.alpha = 0
        speed_selected.alpha = 0
        temerature_selected.alpha = 0
        volume_selected.alpha = 0
        weight_selected.alpha = 0
        // Then based on the category variable's value it shows the correct view, highlights the corresponding tab bar button and
        switch category {
        case "length":
            length_view.fadeIn(1.0, onCompletion: nil)
            length_selected.alpha = 1
            if Float(milimetre_textfield.text!) != nil && Float(centimetre_textfield.text!) != nil && Float(metre_textfield.text!) != nil && Float(inch_textfield.text!) != nil && Float(yard_textfield.text!) != nil && Float(milimetre_textfield.text!) != nil && !(Float(milimetre_textfield.text!) == 0 && Float(centimetre_textfield.text!) == 0 && Float(metre_textfield.text!) == 0 && Float(inch_textfield.text!) == 0 && Float(yard_textfield.text!) == 0 && Float(mile_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "speed":
            speed_view.fadeIn(1.0, onCompletion: nil)
            speed_selected.alpha = 1
            if Float(metres_per_second_textfield.text!) != nil && Float(miles_per_hour.text!) != nil && Float(neutrical_miles_per_hour_textfield.text!) != nil && !(Float(metres_per_second_textfield.text!) == 0 && Float(miles_per_hour.text!) == 0 && Float(neutrical_miles_per_hour_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "temperature":
            temperature_view.fadeIn(1.0, onCompletion: nil)
            temerature_selected.alpha = 1
            minus_button.isHidden = false
            if Float(celcius_textfield.text!) != nil && Float(fahrenheit_textfield.text!) != nil && Float(kelvin_textfield.text!) != nil && !(Float(celcius_textfield.text!) == 0 && Float(fahrenheit_textfield.text!) == 0 && Float(kelvin_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "volume":
            volume_view.fadeIn(1.0, onCompletion: nil)
            volume_selected.alpha = 1
            if Float(gallon_textfield.text!) != nil && Float(litre_textfield.text!) != nil && Float(uk_pint_textfield.text!) != nil && Float(fluid_ounce_textfield.text!) != nil && Float(millilitre_textfield.text!) != nil && !(Float(gallon_textfield.text!) == 0 && Float(litre_textfield.text!) == 0 && Float(uk_pint_textfield.text!) == 0 && Float(fluid_ounce_textfield.text!) == 0 && Float(millilitre_textfield.text!) == 0) {
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        case "weight":
            weight_view.fadeIn(1.0, onCompletion: nil)
            weight_selected.alpha = 1
            if Float(kilogram_textfield.text!) != nil && Float(gram_textfield.text!) != nil && Float(ounce_textfield.text!) != nil && Float(pound_textfield.text!) != nil && Float(stone_textfield.text!) != nil && Float(s_pound_textfield.text!) != nil && !(Float(kilogram_textfield.text!) == 0 && Float(gram_textfield.text!) == 0 && Float(ounce_textfield.text!) == 0 && Float(pound_textfield.text!) == 0 && (Float(stone_textfield.text!) == 0 && Float(stone_textfield.text!) == 0)){
                save_button.isHidden = false
            } else {
                save_button.isHidden = true
            }
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the history flag is true, it means history button is clicked and then the history view should open
        if historyFlag == true {
            let historyVC = segue.destination as! HistoryViewController
            historyVC.transitioningDelegate = self
            historyVC.modalPresentationStyle = .custom
            historyVC.historyType = category
        // If history flag is false it means physical constants button is clicked and the constants view should open
        } else {
            let constantVC = segue.destination as! ConstantViewController
            constantVC.transitioningDelegate = self
            constantVC.modalPresentationStyle = .custom
        }
    }
    
    //    Circle animation for the opening a new view (increasing circle sizes)
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        //    Opens the correct view based on the history flag value
        if historyFlag == true {
            //    The circles' center should be the clicked button's center
            transition.startingPoint = history.center
            //    Animation circles' color should be the new view's background color
            transition.circleColor = UIColor.init(displayP3Red: 24/255, green: 91/255, blue: 31/255, alpha: 1)
        } else {
            transition.startingPoint = constants.center
            transition.circleColor = UIColor.init(displayP3Red: 24/255, green: 91/255, blue: 31/255, alpha: 1)
        }
        return transition
    }
    
    //    Cirle animation for the closing of the view (decreasing circle sizes)
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        //    Consider the history flag to set the animated circle's center to the right button's center
        if historyFlag == true {
            //    Setting the center of the circles to the button related to the opened view
            transition.startingPoint = history.center
            //    Setting the circle's background color of the circle to the opened view's color
            transition.circleColor = UIColor.init(displayP3Red: 24/255, green: 91/255, blue: 31/255, alpha: 1)
        } else {
            transition.startingPoint = constants.center
            transition.circleColor = UIColor.init(displayP3Red: 24/255, green: 91/255, blue: 31/255, alpha: 1)
        }
        return transition
    }
    
    //    Auto dismissing success alert (without title)
    func fade_alert (message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        //    Setting duration to one secend
        let duration = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: duration){
            alert.dismiss(animated: true, completion: nil)
        }
    }
    //    Error message alert (with Okay button)
    func showAlert (title: String, message: String) {
        var alertController: UIAlertController?
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController!.addAction(okayAction)
        self.present(alertController!, animated:  true, completion: nil)
    }
}

extension UIView {
    //    Fade in animation to the category views.
    func fadeIn(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 1 },
                       completion: { (value: Bool) in
                        if let complete = onCompletion { complete() }
        }
        )
    }
    
    //    fade out animation to the category view
    func fadeOut(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 0 },
                       completion: { (value: Bool) in
                        self.isHidden = true
                        if let complete = onCompletion { complete() }
        }
        )
    }
    
}
