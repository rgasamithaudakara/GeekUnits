//
//  HistoryViewController.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/4/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    // Highlighters for custom tab bar buttons
    @IBOutlet weak var length_selected: UIImageView!
    @IBOutlet weak var speed_selected: UIImageView!
    @IBOutlet weak var temperature_selected: UIImageView!
    @IBOutlet weak var volume_selected: UIImageView!
    @IBOutlet weak var weight_selected: UIImageView!
    //    Five labels for history
    @IBOutlet weak var history_label_1: UILabel!
    @IBOutlet weak var history_label_2: UILabel!
    @IBOutlet weak var history_label_3: UILabel!
    @IBOutlet weak var history_label_4: UILabel!
    @IBOutlet weak var history_label_5: UILabel!
    //    Four separators to saparate five history items
    @IBOutlet weak var line_01: UILabel!
    @IBOutlet weak var line_02: UILabel!
    @IBOutlet weak var line_03: UILabel!
    @IBOutlet weak var line_04: UILabel!
    //    Message to appear when the istory count is 0
    @IBOutlet weak var history_empty_message: UIImageView!
    //    This array contains the history values of the chosen category to appear
    var visible_history = [""]
    //    Selected hitory type
    var historyType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    Innitialy hides the four separator lines
        line_01.isHidden = true
        line_02.isHidden = true
        line_03.isHidden = true
        line_04.isHidden = true
        
        //    To show the coresponding history to the chosen category of the convertor view
        selectCategory(category: historyType)
    }
    
    //    To close the history view
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    // Custom tab bar buttons
    @IBAction func lengthButton(_ sender: Any) {
        selectCategory(category: "length")
    }
    @IBAction func speedButton(_ sender: Any) {
        selectCategory(category: "speed")
    }
    @IBAction func temperatureButton(_ sender: Any) {
        selectCategory(category: "temperature")
    }
    @IBAction func volumeButton(_ sender: Any) {
        selectCategory(category: "volume")
    }
    @IBAction func weightButton(_ sender: Any) {
        selectCategory(category: "weight")
    }
    
    //    This function triggers when a custom tab bar button is toucked
    //    This shows the history of the chosen category in side the labels
    //    This highlights the selected tab bar button related to the category
    func selectCategory(category: String) {
        // Initialy removes all highlightings of the category buttons
        length_selected.alpha = 0
        speed_selected.alpha = 0
        temperature_selected.alpha = 0
        volume_selected.alpha = 0
        weight_selected.alpha = 0
        //    Then it sets the history history list and highlights the tab bar button depending on the category parameter value
        //    If the history is empty it show the empty message
        switch category {
        case "length":
            length_selected.alpha = 1
            //    If the selected categories array is  existing in userdefaults the data is set to the visible array here
            if UserDefaults.standard.array(forKey: "length_history") != nil {
                visible_history = UserDefaults.standard.array(forKey: "length_history") as! [String]
                history_empty_message.alpha = 0
            //    If the selected catergory's array is not existing in userdefaults visible array is initialized with ""
            } else {
                visible_history = [""]
                history_empty_message.alpha = 1
            }
            printHistory(visible_history: visible_history)
            
        case "speed":
            speed_selected.alpha = 1
            if UserDefaults.standard.array(forKey: "speed_history") != nil {
                visible_history = UserDefaults.standard.array(forKey: "speed_history") as! [String]
                history_empty_message.alpha = 0
            } else {
                visible_history = [""]
                history_empty_message.alpha = 1
            }
            printHistory(visible_history: visible_history)
            
        case "temperature":
            temperature_selected.alpha = 1
            if UserDefaults.standard.array(forKey: "temperature_history") != nil {
                visible_history = UserDefaults.standard.array(forKey: "temperature_history") as! [String]
                history_empty_message.alpha = 0
            } else {
                visible_history = [""]
                history_empty_message.alpha = 1
            }
            printHistory(visible_history: visible_history)
 
        case "volume":
            volume_selected.alpha = 1
            if UserDefaults.standard.array(forKey: "volume_history") != nil {
                visible_history = UserDefaults.standard.array(forKey: "volume_history") as! [String]
                history_empty_message.alpha = 0
            } else {
                visible_history = [""]
                history_empty_message.alpha = 1
            }
            printHistory(visible_history: visible_history)

        case "weight":
            weight_selected.alpha = 1
            if UserDefaults.standard.array(forKey: "weight_history") != nil {
                visible_history = UserDefaults.standard.array(forKey: "weight_history") as! [String]
                history_empty_message.alpha = 0
            } else {
                visible_history = [""]
                history_empty_message.alpha = 1
            }
            printHistory(visible_history: visible_history)

        default:
            break
        }
    }
    
    //    This function shows the history and seperators into the labels
    func printHistory (visible_history: [String]) {
        //    Sets the values to the history_lisr arrray
        var history_list = visible_history
        //    Empty all labels and hide all seperator lines
        history_label_1.text = ""
        history_label_2.text = ""
        history_label_3.text = ""
        history_label_4.text = ""
        history_label_5.text = ""
        line_01.isHidden = true
        line_02.isHidden = true
        line_03.isHidden = true
        line_04.isHidden = true
        //    Shows the history items inthe textfields
        if visible_history.count == 5 {
            //    Since when the array is created empty value is added to initialize, if first value is empty, then it has to be removed
            if visible_history[0] == "" {
                history_list.removeFirst()
                history_label_1.text = history_list[3]
                line_01.isHidden = false
                history_label_2.text = history_list[2]
                line_02.isHidden = false
                history_label_3.text = history_list[1]
                 line_03.isHidden = false
                history_label_4.text = history_list[0]
            } else {
                history_label_1.text = history_list[4]
                line_01.isHidden = false
                history_label_2.text = history_list[3]
                line_02.isHidden = false
                history_label_3.text = history_list[2]
                 line_03.isHidden = false
                history_label_4.text = history_list[1]
                line_04.isHidden = false
                history_label_5.text = history_list[0]
            }
        } else if visible_history.count == 4 {
            //    Since when the array is created empty value is added to initialize, if first value is empty, then it has to be removed
            if visible_history[0] == "" {
                history_list.removeFirst()
                history_label_1.text = history_list[2]
                line_01.isHidden = false
                history_label_2.text = history_list[1]
                line_02.isHidden = false
                history_label_3.text = history_list[0]
            } else {
                history_label_1.text = history_list[3]
                line_01.isHidden = false
                history_label_2.text = history_list[2]
                line_02.isHidden = false
                history_label_3.text = history_list[1]
                 line_03.isHidden = false
                history_label_4.text = history_list[0]
            }
        } else if visible_history.count == 3 {
            //    Since when the array is created empty value is added to initialize, if first value is empty, then it has to be removed
            if visible_history[0] == "" {
                history_list.removeFirst()
                history_label_1.text = history_list[1]
                line_01.isHidden = false
                history_label_2.text = history_list[0]
            } else {
                history_label_1.text = history_list[2]
                line_01.isHidden = false
                history_label_2.text = history_list[1]
                line_02.isHidden = false
                history_label_3.text = history_list[0]
            }
        } else if visible_history.count == 2 {
            //    Since when the array is created empty value is added to initialize, if first value is empty, then it has to be removed
            if visible_history[0] == "" {
                history_list.removeFirst()
                history_label_1.text = history_list[0]
            } else {
                history_label_1.text = history_list[1]
                line_01.isHidden = false
                history_label_2.text = history_list[0]
            }
        } else if visible_history.count == 1 {
            //    Since when the array is created empty value is added to initialize, if first value is empty, then it has to be removed
            if visible_history[0] != "" {
                history_label_1.text = history_list[0]
            }
        }
    }
    
}
