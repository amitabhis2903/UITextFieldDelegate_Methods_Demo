//
//  ColorizeTextFieldDelegate.swift
//  TextFieldDelegate_Demo
//
//  Created by Ammy Pandey on 09/02/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import Foundation
import UIKit

//Mark: ColorizeTextFieldDelegate: Create class NSObject and UITextFieldDelegate


class ColorizeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    //Mark: After create the Class Go to ViewControllerFile create the delegates of ColorizeTextFieldDelegate and set the delegate with TextField
    
    //Mark: Set Properties
    
    let colors: [String: UIColor] = [
        "red": UIColor.red,
        "orange": UIColor.orange,
        "blue": UIColor.blue,
        "green": UIColor.green,
        "yellow": UIColor.yellow,
        "brown": UIColor.brown,
        "black": UIColor.black,
        "cyan": UIColor.cyan,
        "white": UIColor.white,
        "purple": UIColor.purple,
        "magenta": UIColor.magenta
    ]
    
    //Find color word and set the text color
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var colorsInTheText = [UIColor]()
        
        // Construct if the text in text field if change accepted
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        //Search in each dictionary pull out a string to search
        for(key, color) in self.colors{
            
            if newText.range(of: key, options: .caseInsensitive).location != NSNotFound{
                colorsInTheText.append(color)
            }
        }
        
        //If found any colour and bend the color and set them in text
        
        if colorsInTheText.count > 0 {
            textField.textColor = self.blendColorArray(colorsInTheText)
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    //make function to blend the colors
    func blendColorArray(_ colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](repeating: 0.0, count: 4)
        
        for color in colors {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            colorComponents[0] += red
            colorComponents[1] += green
            colorComponents[2] += blue
            colorComponents[3] += alpha
        }
        
        for i in 0...colorComponents.count - 1 {
            colorComponents[i] /= CGFloat(colors.count)
        }
        
        return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
    }
}
