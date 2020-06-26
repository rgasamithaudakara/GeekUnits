//  ConverterModel.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/11/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import Foundation

class ConverterModel {
//    Length converter functions
//    Millimetre
    func convertMilimetre(value: String, to_unit: String) -> String {
        switch to_unit {
        case "centimetre":
            return "\(round(10000 * Float(value)! / 10) / 10000)"
        case "metre":
            return "\(round(10000 * Float(value)! / 1000) / 10000)"
        case "inch":
            return "\(round(10000 * Float(value)! / 25.4) / 10000)"
        case "yard":
            return "\(round(10000 * Float(value)! / 914.4) / 10000)"
        case "mile":
            return "\(round(10000 * Float(value)! / 1609344) / 10000)"
        default:
            return ""
        }
    }
//    Centimetre
    func convertCentimetre(value: String, to_unit: String) -> String {
        switch to_unit {
        case "millimetre":
            return "\(round(10000 * Float(value)! * 10)/10000)"
        case "metre":
            return "\(round(10000 * Float(value)! / 100)/10000)"
        case "inch":
            return "\(round(10000 * Float(value)! / 2.54)/10000)"
        case "yard":
            return "\(round(10000 * Float(value)! / 91.44)/10000)"
        case "mile":
            return "\(round(10000 * Float(value)! / 160934.4)/10000)"
        default:
            return ""
        }
    }
//    Metre
    func convertMetre(value: String, to_unit: String) -> String {
        switch to_unit {
        case "millimetre":
            return "\(round(10000 * Float(value)! * 1000)/10000)"
        case "centimetre":
            return "\(round(10000 * Float(value)! * 100)/10000)"
        case "inch":
            return "\(round(10000 * Float(value)! / 0.0254)/10000)"
        case "yard":
            return "\(round(10000 * Float(value)! / 0.9144)/10000)"
        case "mile":
            return "\(round(10000 * Float(value)! / 1609.344)/10000)"
        default:
            return ""
        }
    }
//    Inch
    func convertInch(value: String, to_unit: String) -> String {
        switch to_unit {
        case "millimetre":
            return "\(round(10000 * Float(value)! * 25.4)/10000)"
        case "centimetre":
            return "\(round(10000 * Float(value)! * 2.54)/10000)"
        case "metre":
            return "\(round(10000 * Float(value)! * 0.0254)/10000)"
        case "yard":
            return "\(round(10000 * Float(value)! / 36)/10000)"
        case "mile":
            return "\(round(10000 * Float(value)! / 63360)/10000)"
        default:
            return ""
        }
    }
//    Yard
    func convertYard(value: String, to_unit: String) -> String {
        switch to_unit {
        case "millimetre":
            return "\(round(10000 * Float(value)! * 914.4)/10000)"
        case "centimetre":
            return "\(round(10000 * Float(value)! * 91.44)/10000)"
        case "metre":
            return "\(round(10000 * Float(value)! *  0.9144)/10000)"
        case "inch":
            return "\(round(10000 * Float(value)! * 36)/10000)"
        case "mile":
            return "\(round(10000 * Float(value)! / 1760)/10000)"
        default:
            return ""
        }
    }
//    Mile
    func convertMile(value: String, to_unit: String) -> String {
        switch to_unit {
        case "millimetre":
            return "\(round(10000 * Float(value)! * 1609344)/10000)"
        case "centimetre":
            return "\(round(10000 * Float(value)! * 160934.4)/10000)"
        case "metre":
            return "\(round(10000 * Float(value)! * 1609.344)/10000)"
        case "inch":
            return "\(round(10000 * Float(value)! * 63360)/10000)"
        case "yard":
            return "\(round(10000 * Float(value)! * 1760)/10000)"
        default:
            return ""
        }
    }
//    Speed converters
    func convertMetresPerSecond(value: String, to_unit: String) -> String {
        switch to_unit {
        case "mile/h":
            return "\(round(10000 * Float(value)! * 2.23694)/10000)"
        case "neutrical mile/h":
            return "\(round(10000 * Float(value)! * 1.94384)/10000)"
        default:
            return ""
        }
    }
    
    func convertMilesPerHour(value: String, to_unit: String) -> String {
        switch to_unit {
        case "metre/s":
            return "\(round(10000 * Float(value)! / 2.237)/10000)"
        case "neutrical mile/h":
            return "\(round(10000 * Float(value)! * 0.868976)/10000)"
        default:
            return ""
        }
    }
    
    func convertNeutricalMilesPerHour(value: String, to_unit: String) -> String {
        switch to_unit {
        case "metre/s":
            return "\(round(10000 * Float(value)! / 1.944)/10000)"
        case "mile/h":
            return "\(round(10000 * Float(value)! * 1.151)/10000)"
        default:
            return ""
        }
    }
//    Temperature converters
    func convertCelcius(value: String, to_unit: String) -> String {
        switch to_unit {
        case "fahrenheit":
            return "\(round(10000 * ((Float(value)! * 1.8) + 32))/10000)"
        case "kelvin":
            return "\(round(10000 * (Float(value)! + 273.15))/10000)"
        default:
            return ""
        }
    }
    
    func convertFahrenheit(value: String, to_unit: String) -> String {
        switch to_unit {
        case "celcius":
            return "\(round(10000 * ((Float(value)! - 32) * 5/9))/10000)"
        case "kelvin":
            return "\(round(10000 * (((Float(value)! - 32) * 5/9) + 273.15))/10000)"
        default:
            return ""
        }
    }
    
    func convertKelvin(value: String, to_unit: String) -> String {
        switch to_unit {
        case "celcius":
            return "\(round(10000 * (Float(value)! - 273.15))/10000)"
        case "fahrenheit":
            return "\(round(10000 * (((Float(value)! - 273.15) * 1.8) + 32))/10000)"
        default:
            return ""
        }
    }
//    Volume converters
    func convertGallon(value: String, to_unit: String) -> String {
        switch to_unit {
        case "litre":
            return "\(round(10000 * Float(value)! * 3.78541)/10000)"
        case "uk pint":
            return "\(round(10000 * Float(value)! * 6.661)/10000)"
        case "fluid ounce":
            return "\(round(10000 * Float(value)! * 128)/10000)"
        case "millilitre":
            return "\(round(10000 * Float(value)! * 3785.412)/10000)"
        default:
            return ""
        }
    }
    
    func convertLitre(value: String, to_unit: String) -> String {
        switch to_unit {
        case "gallon":
            return "\(round(10000 * Float(value)! / 3.785)/10000)"
        case "uk pint":
            return "\(round(10000 * Float(value)! * 1.75975)/10000)"
        case "fluid ounce":
            return "\(round(10000 * Float(value)! * 33.814)/10000)"
        case "millilitre":
            return "\(round(10000 * Float(value)! * 1000)/10000)"
        default:
            return ""
        }
    }
    
    func convertUkPint(value: String, to_unit: String) -> String {
        switch to_unit {
        case "gallon":
            return "\(round(10000 * Float(value)! / 6.661)/10000)"
        case "litre":
            return "\(round(10000 * Float(value)! / 1.76)/10000)"
        case "fluid ounce":
            return "\(round(10000 * Float(value)! * 19.2152)/10000)"
        case "millilitre":
            return "\(round(10000 * Float(value)! * 568.2612852322)/10000)"
        default:
            return ""
        }
    }
    
    func convertFluidOunce(value: String, to_unit: String) -> String {
        switch to_unit {
        case "gallon":
            return "\(round(10000 * Float(value)! / 128)/10000)"
        case "litre":
            return "\(round(10000 * Float(value)! / 33.814)/10000)"
        case "uk pint":
            return "\(round(10000 * Float(value)! / 19.215)/10000)"
        case "millilitre":
            return "\(round(10000 * Float(value)! * 29.5735)/10000)"
        default:
            return ""
        }
    }

    func convertMillilitre(value: String, to_unit: String) -> String {
        switch to_unit {
        case "gallon":
            return "\(round(10000 * Float(value)! / 3785.412)/10000)"
        case "litre":
            return "\(round(10000 * Float(value)! / 1000)/10000)"
        case "uk pint":
            return "\(round(10000 * Float(value)! / 568.261)/10000)"
        case "fluid ounce":
            return "\(round(10000 * Float(value)! / 29.574)/10000)"
        default:
            return ""
        }
    }
//    Weight converters
    func convertKilogram (value: String, to_unit: String) -> String {
        switch to_unit {
        case "gram":
            return "\(round(10000 * Float(value)! * 1000)/10000)"
        case "ounce":
            return "\(round(10000 * Float(value)! * 35.274)/10000)"
        case "pound":
            return "\(round(10000 * Float(value)! * 2.20462)/10000)"
        case "stone":
            return "\(round(Float(value)! * 2.20462 / 14))"
        case "s pound":
            return "\(round(10000 * Float(round(10000 * Float(value)! * 2.20462)/10000).truncatingRemainder(dividingBy: 14))/10000)"
        default:
            return ""
        }
    }
    
    func convertGram (value: String, to_unit: String) -> String {
        switch to_unit {
        case "kilogram":
            return "\(round(10000 * Float(value)! / 1000)/10000)"
        case "ounce":
            return "\(round(10000 * Float(value)! / 28.35)/10000)"
        case "pound":
            return "\(round(10000 * Float(value)! / 453.592)/10000)"
        case "stone":
            return "\(round(Float(value)! / 6350.293))"
        case "s pound":
            return "\(round(10000 * Float(round(10000 * Float(value)! / 453.592)/10000).truncatingRemainder(dividingBy: 14))/10000)"
        default:
            return ""
        }
    }
    
    func convertOunce (value: String, to_unit: String) -> String {
        switch to_unit {
        case "kilogram":
            return "\(round(10000 * Float(value)! /  35.274) / 10000)"
        case "gram":
            return "\(round(10000 * Float(value)! * 28.3495) / 10000)"
        case "pound":
            return "\(round(10000 * Float(value)! / 16) / 10000)"
        case "stone":
            return "\(round(Float(value)! / 224))"
        case "s pound":
            return "\(round(10000 * Float(round(10000 * Float(value)! / 16) / 10000).truncatingRemainder(dividingBy: 14))/10000)"
        default:
            return ""
        }
    }
    
    func convertPound (value: String, to_unit: String) -> String {
        switch to_unit {
        case "kilogram":
            return "\(round(10000 * Float(value)! / 2.205) / 10000)"
        case "gram":
            return "\(round(10000 * Float(value)! * 453.592) / 10000)"
        case "ounce":
            return "\(round(10000 * Float(value)! * 16) / 10000)"
        case "stone":
            return "\(round(Float(value)! / 14))"
        case "s pound":
            return "\(round(10000 * (Float(value)!.truncatingRemainder(dividingBy: 14))) / 10000)"
        default:
            return ""
        }
    }

    func convertStonePound (stone_value: String, pound_value: String, to_unit: String) -> String {
        let value = "\((Float(stone_value)! * 14) + Float(pound_value)!)"
        switch to_unit {
        case "kilogram":
            return "\(round(10000 * Float(value)! * 0.453592) / 10000)"
        case "gram":
            return "\(round(10000 * Float(value)! * 453.592) / 10000)"
        case "ounce":
            return "\(round(10000 * Float(value)! * 16) / 10000)"
        case "pound":
            return "\(round(10000 * Float(value)!) / 10000)"
        default:
            return ""
        }
    }
    
}
