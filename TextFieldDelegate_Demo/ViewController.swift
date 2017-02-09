//
//  ViewController.swift
//  TextFieldDelegate_Demo
//
//  Created by Ammy Pandey on 09/02/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

//Mark : Take TextField Protocol For Implementing Delegate Method

class ViewController: UIViewController,UITextFieldDelegate {
    
    //Mark: Create Outelet Of All The UI Element Properties And Connect with
    
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var chrachterCountLabel: UILabel!
    
//Mark: Create the delegate and class file by importing UIKit in emoji and colorize swift file.
    
    //Mark: After create class and delegate now create the refrence of deletagte with deegate files and set the textfield with them delegates.
    
    
    
    //Mark: Create TextField Delegate Objects
    let emojiDelgate = EmojiTextFieldDelegate()
    let colorizeDelegate = ColorizeTextFieldDelegate()
    
    
    //Mark: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Mark: Set the label hidden
        self.chrachterCountLabel.isHidden = true
        
        //Mark: Set the three Delegate
        self.textField1.delegate = emojiDelgate
        self.textField2.delegate = colorizeDelegate
        self.textField3.delegate = self
        
        
    }
    //Mark: TextFieldDelegate Method
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // create a variable 
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        //hide the label if textField empty
        self.chrachterCountLabel.isHidden = (newText.length == 0)
        // count the chrachter
        self.chrachterCountLabel.text = String(newText.length)

        return true
    }

}
