//
//  ConstantViewController.swift
//  Unit Converter
//
//  Created by Sami Udakara on 3/5/19.
//  Copyright © 2019 Sami Udakara. All rights reserved.
//

import UIKit

class ConstantViewController: UIViewController {

    @IBOutlet weak var eMassTitle: UILabel!
    @IBOutlet weak var eMassValue: UILabel!
    @IBOutlet weak var pMassTitle: UILabel!
    @IBOutlet weak var pMassValue: UILabel!
    @IBOutlet weak var nMassTitle: UILabel!
    @IBOutlet weak var nMassValue: UILabel!
    @IBOutlet weak var ePermTitle: UILabel!
    @IBOutlet weak var ePermValue: UILabel!
    @IBOutlet weak var mPermTitle: UILabel!
    @IBOutlet weak var mPermValue: UILabel!
    @IBOutlet weak var lightSpeedTitle: UILabel!
    @IBOutlet weak var lightSpeedValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    Creating font type to the titles
        let title:UIFont? = UIFont(name: "HelveticaNeue-Bold", size: 17)
        //    Creating the font type to the title's symbols
        let titleItalic:UIFont? = UIFont(name: "HelveticaNeue-BoldItalic", size: 17)
        //    Creating the font type to the title's symbole superscrit / subscript value
        let titleSub:UIFont? = UIFont(name: "HelveticaNeue-BoldItalic", size: 10)
        //    Creating font type to the values
        let font:UIFont? = UIFont(name: "Helvetica", size:12)
        //    Creating a font type to superscript / subscript values
        let subFont:UIFont? = UIFont(name: "Helvetica", size:8)
        
        //    Electron mass
        //    Stting title as a mutable string
        let eMass01:NSMutableAttributedString = NSMutableAttributedString(string: "Electron mass (me)", attributes: [.font:title!])
        //    Setting titles symbol's subscript value in current position and size
        eMass01.setAttributes([.font:titleSub!,.baselineOffset:-2], range: NSRange(location:16,length:1))
        //    Setting titles symbol value italic
        eMass01.setAttributes([.font:titleItalic!,.baselineOffset:0], range: NSRange(location:15,length:1))
        // Setting the mutable text to the correct textfield
        eMassTitle.attributedText = eMass01
        //    Creating the value as a mutable string
        let eMass02:NSMutableAttributedString = NSMutableAttributedString(string: "9.10938356 × 10-31 kilograms", attributes: [.font:font!])
        //    Setting the superscrit / subscript value by the loaction
        eMass02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:15,length:3))
        //    Setting the mutable text to the correct textfield
        eMassValue.attributedText = eMass02
        
//         Proton mass
        let pMass01:NSMutableAttributedString = NSMutableAttributedString(string: "Proton mass (mp)", attributes: [.font:title!])
        pMass01.setAttributes([.font:titleSub!,.baselineOffset:-2], range: NSRange(location:14,length:1))
        pMass01.setAttributes([.font:titleItalic!,.baselineOffset:0], range: NSRange(location:13,length:1))
        pMassTitle.attributedText = pMass01

        let pMass02:NSMutableAttributedString = NSMutableAttributedString(string: "1.6726219 × 10-27 kilograms", attributes: [.font:font!])
        pMass02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:14,length:3))
        pMassValue.attributedText = pMass02
        
//        Neutron mass
        let nMass01:NSMutableAttributedString = NSMutableAttributedString(string: "Neutron mass (mn)", attributes: [.font:title!])
        nMass01.setAttributes([.font:titleSub!,.baselineOffset:-2], range: NSRange(location:15,length:1))
        nMass01.setAttributes([.font:titleItalic!,.baselineOffset:0], range: NSRange(location:14,length:1))
        nMassTitle.attributedText = nMass01
        
        let nMass02:NSMutableAttributedString = NSMutableAttributedString(string: "1.674929 × 10-27 kilograms", attributes: [.font:font!])
        nMass02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:13,length:3))
        nMassValue.attributedText = nMass02
        
//        Electric permittivity
        let ePerm01:NSMutableAttributedString = NSMutableAttributedString(string: "Electric permittivity (ε0)", attributes: [.font:title!])
        ePerm01.setAttributes([.font:titleSub!,.baselineOffset:-2], range: NSRange(location:24,length:1))
        ePerm01.setAttributes([.font:titleItalic!,.baselineOffset:0], range: NSRange(location:23,length:1))
        ePermTitle.attributedText = ePerm01
        
        let ePerm02:NSMutableAttributedString = NSMutableAttributedString(string: "8.85 × 10−12 Fm-1", attributes: [.font:font!])
        ePerm02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:9,length:3))
        ePerm02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:15,length:2))
        ePermValue.attributedText = ePerm02
        
//        Magnetic permeability
        let mPerm01:NSMutableAttributedString = NSMutableAttributedString(string: "Magnetic permeability (μ0)", attributes: [.font:title!])
        mPerm01.setAttributes([.font:titleSub!,.baselineOffset:-2], range: NSRange(location:24,length:1))
        mPerm01.setAttributes([.font:titleItalic!,.baselineOffset:0], range: NSRange(location:23,length:1))
        mPermTitle.attributedText = mPerm01
        
        let mPerm02:NSMutableAttributedString = NSMutableAttributedString(string: "12.57 × 10−7 Hm-1", attributes: [.font:font!])
        mPerm02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:10,length:3))
        mPerm02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:15,length:2))
        mPermValue.attributedText = mPerm02
        
//        Speed of light in metres
        let lightSpeed01:NSMutableAttributedString = NSMutableAttributedString(string: "Speed of light in metres (c)", attributes: [.font:title!])
        lightSpeed01.setAttributes([.font:titleItalic!,.baselineOffset: 0], range: NSRange(location:26,length:1))
        lightSpeedTitle.attributedText = lightSpeed01
        
        let lightSpeed02:NSMutableAttributedString = NSMutableAttributedString(string: "2.99792458 × 108 ms-1", attributes: [.font:font!])
        lightSpeed02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:15,length:1))
        lightSpeed02.setAttributes([.font:subFont!,.baselineOffset:6], range: NSRange(location:19,length:2))
        lightSpeedValue.attributedText = lightSpeed02
    }
    
    //    Button to close the view
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
