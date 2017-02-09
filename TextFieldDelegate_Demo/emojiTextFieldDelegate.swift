//
//  emojiTextFieldDelegate.swift
//  TextFieldDelegate_Demo
//
//  Created by Ammy Pandey on 09/02/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import Foundation
import UIKit

//Mark: emojiTextFieldDelegate: create class NSObject and UITextFieldDelegate

class emojiTextFieldDelegate: NSObject,UITextFieldDelegate{
    
    //Mark: After create the Class Go to ViewControllerFile create the delegates of emojiTextFieldDelegate and set the delegate with TextField
    
    //Mark: Properties
    var translations = [String: String]()
    
    
    //Mark : Intitializer
    
    override init(){
        super.init()
        translations["heart"] = "\u{0001F496}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"
        translations["smileFace"] = "\u{1F60A}"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var replaceEmoji = false
        var emojiStringRange: NSRange
        
        // The text field will be change if this change is accepted
        
        var newText = textField.text! as String
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        //Take string from dictionary and replace with Emoji
        
        for (emojiString, emoji) in translations{
            // serach word and replace with emoji 
            repeat{
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                
                // found
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replaceEmoji = true
                    
                }while emojiStringRange.location != NSNotFound
            }
        }
        
        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if replaceEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

}
