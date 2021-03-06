//
//  emojidel.swift
//  TextFieldDelegate_Demo
//
//  Created by Ammy Pandey on 09/02/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import Foundation
import UIKit

// MARK: - EmojiTextFieldDelegate : NSObject, UITextFieldDelegate

class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    // MARK: Properties
    
    var translations = [String : String]()
    
    // MARK: Initializer
    
    override init() {
        super.init()
        
        translations["heart"] = "\u{2764}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"
        translations["smile"] = "\u{1F60A}"
        translations["kiss"] = "\u{1F618}"
        translations["bus"] = "\u{1F68C}"
        translations["bicycle"] = "\u{1F6B2}"
        translations["eyes"] = "\u{1F440}"
        translations["nose"] = "\u{1F443}"
        translations["ears"] = "\u{1F442}"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        
        for (emojiString, emoji) in translations {
            
            // Search for all occurances of key (ie. "dog"), and replace with emoji (ie. 🐶)
            repeat {
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                
                // found one
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replacedAnEmoji = true
                }
                
            } while emojiStringRange.location != NSNotFound
        }
        
        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if replacedAnEmoji {
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
