//
//  PlayWithAlphaNumVC.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Naga Lakshmi on 9/13/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstStrTF.isEnabled = false

        secondStrTF.isEnabled = false

        self.stringAndPatternBTN[0].isEnabled = false

        stringAndPatternBTN[1].isEnabled = false

        optionSWCH[0].isOn = false

        optionSWCH[1].isOn = false

        numbersStepper[0].isEnabled = false

        numbersStepper[1].isEnabled = false

                    

                    

                    messageTV.text = ""

                self.headerLBL.text = String(format: "%@\nPlay with AlphaNumerics™️", "\u{0c38}\u{0c4d}\u{0c35}\u{0c3e}\u{0c17}\u{0c24}\u{0c02}")
        
    }
    
    @IBOutlet weak var headerLBL: UILabel!
    
    @IBOutlet weak var firstNumLBL: UILabel!
    
    @IBOutlet weak var secondNumLBL: UILabel!
    
    @IBOutlet weak var firstStrTF: UITextField!
    
    @IBOutlet weak var secondStrTF: UITextField!
    
    @IBOutlet var optionSWCH: [UISwitch]!
    
    
    @IBAction func numberSWCH(_ sender: UISwitch) {
        if sender.isOn {

                    numbersStepper[0].isEnabled = true

                    numbersStepper[1].isEnabled = true

                    stringAndPatternBTN[0].isEnabled = true

                    } else {

                    numbersStepper[0].isEnabled = false

                    numbersStepper[1].isEnabled = false

                    stringAndPatternBTN[0].isEnabled = false

                    }
    }
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        if sender.isOn {

                    firstStrTF.isEnabled = true

                    secondStrTF.isEnabled = true

                    stringAndPatternBTN[1].isEnabled = true

                    } else {

                        firstStrTF.isEnabled = false

                        secondStrTF.isEnabled = false

                        stringAndPatternBTN[1].isEnabled = false

                    }
    }
    
    @IBOutlet var numbersStepper: [UIStepper]!
    var x = ""

    var y = ""
    
    @IBAction func firstNumStepper(_ sender: UIStepper) {
        x = "\(Int32(numbersStepper[0].value))"
        firstNumLBL.text = x
    }
    
    @IBAction func secondNumStepper(_ sender: UIStepper) {
        y = "\(Int32(numbersStepper[1].value))"
        secondNumLBL.text = y
    }
    
    @IBOutlet weak var messageTV: UITextView!
    
    @IBOutlet var stringAndPatternBTN: [UIButton]!
    
    @IBAction func generatePattern(_ sender: UIButton) {
        var row=0
                var col=0
                if let text = self.firstNumLBL.text, let value = Int(text) {
                        row=value
                    }
                if let text1 = self.secondNumLBL.text, let value1 = Int(text1) {
                        col=value1
                    }
                
                //MessageTV.text="Hello"
                messageTV.text=""
                
                if(row==0 && col==0){
                    messageTV.text="First Number is Invalid. Please provide a value greater than zero"
                }
                else if(row==0 && col>0){
                    messageTV.text="First Number is Invalid. Please provide a value greater than zero"
                }
                else if(row>0 && col==0){
                    messageTV.text="Second Number is Invalid. Please provide a value greater than zero"
                }
                else{
                    for num in (1...row){
                        for cols in (1...col){
                            if( num==1 || num==row){
                                messageTV.text+=String("❄️ ")
                            }
                            else if (cols==1 || cols==col){
                                messageTV.text+=String("❄️ ")
                            }
                            else{
                                
                                
                                if(num==cols){
                                    messageTV.text+=String("🎅 ")
                                }
                                else if((num+cols)%2==0){
                                    messageTV.text+=String("🎅 ")
                                }
                                else{
                                    messageTV.text+=String("🌲 ")
                                }
                                
                            }
                            // MessageTV.text+=String("🌲 ")
                        }
                        messageTV.text+="\n"
                    }
                    
                }
    }
    @IBAction func manipulateStrings(_ sender: UIButton) {
        if let text1 = firstStrTF.text, let text2 = secondStrTF.text {

                            // Concatenate the text from both text fields

                            let combinedText = text1 + text2

                            var vowelcount=0

                            let vowels: Set<Character> = Set("aeiouAEIOU")

                            for char in combinedText{

                                if vowels.contains(char) {

                                            vowelcount += 1

                                        }

                                

                            }

                            let consonantcount = combinedText.count-vowelcount

                            var uniqueCharacters = Set<Character>()

                            for z in combinedText {

                                    uniqueCharacters.insert(z)

                                }

                            var reversed = ""

                            for y in combinedText{

                                reversed = String(y) + reversed

                            }

                            

                            messageTV.text = "concatenation of two strings result in \(combinedText) \n No of vowels in \(combinedText) is \(vowelcount) \n No of consonants in \(combinedText) is \(consonantcount) \n Number of unique characters in \(combinedText) are \(uniqueCharacters.count) \n The reversal of \(combinedText) results in \(reversed)"

                        }

                        else{

                            messageTV.text="message cannot be empty"

                        }

    }
    @IBAction func onReset(_ sender: UIButton) {
        firstStrTF.isEnabled = false

        secondStrTF.isEnabled = false

        stringAndPatternBTN[0].isEnabled = false

        stringAndPatternBTN[1].isEnabled = false

        numbersStepper[0].isEnabled = false

        numbersStepper[1].isEnabled = false
        messageTV.text=""
        
    }
    
}
