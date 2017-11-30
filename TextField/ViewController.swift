//
//  ViewController.swift
//  TextField
//
//  Created by Vansa Pha on 11/30/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let toArray = textField.text?.components(separatedBy: ",")
        let cleanNumericString = toArray!.joined(separator: "")
        let dotCount = cleanNumericString.components(separatedBy: ".")
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        var length = isBackSpace != -92 ? (cleanNumericString.count + 1) : (cleanNumericString.count - 1)
        if string == "." {
            if length == 1 {
                return false
            }
            var temp = 0
            length -= 1
            for ch in cleanNumericString {
                if ch == "." {
                    temp += 1
                }
            }
            if temp == 1 {
                if string == "." {
                    return false
                }
            }
        }else {
            if isBackSpace != -92 {
                if dotCount.count > 1 {
                    if dotCount[1].count == 0 {
                        length -= 2
                    } else if dotCount[1].count == 1 {
                        length -= 3
                    } else if dotCount[1].count == 2 {
                        return false
                    }
                }
            }else {
                if dotCount.count > 1 {
                    if dotCount[1].count == 0 {
                        length -= 0
                    } else if dotCount[1].count == 1 {
                        length -= 1
                    } else if dotCount[1].count == 2 {
                        length -= 2
                    }
                }
            }
        }
        print("length: ", length, cleanNumericString)
        var textString = ""
        if length == 4 {
            textString = "\(cleanNumericString[0..<1]),\(cleanNumericString[1..<cleanNumericString.count])"
        }else if length == 5 {
            textString = "\(cleanNumericString[0..<2]),\(cleanNumericString[2..<cleanNumericString.count])"
        }else if length == 6 {
            textString = "\(cleanNumericString[0..<3]),\(cleanNumericString[3..<cleanNumericString.count])"
        }else if length == 7 {
            textString = "\(cleanNumericString[0..<1]),\(cleanNumericString[1..<4]),\(cleanNumericString[4..<cleanNumericString.count])"
        }else if length == 8 {
            textString = "\(cleanNumericString[0..<2]),\(cleanNumericString[2..<5]),\(cleanNumericString[5..<cleanNumericString.count])"
        }else if length == 9 {
            textString = "\(cleanNumericString[0..<3]),\(cleanNumericString[3..<6]),\(cleanNumericString[6..<cleanNumericString.count])"
        }else if length == 10 {
            textString = "\(cleanNumericString[0..<1]),\(cleanNumericString[1..<4]),\(cleanNumericString[4..<7]),\(cleanNumericString[7..<cleanNumericString.count])"
        }else if length == 11 {
           textString = "\(cleanNumericString[0..<2]),\(cleanNumericString[2..<5]),\(cleanNumericString[5..<8]),\(cleanNumericString[8..<cleanNumericString.count])"
        }else if length == 12 {
            textString = "\(cleanNumericString[0..<3]),\(cleanNumericString[3..<6]),\(cleanNumericString[6..<9]),\(cleanNumericString[9..<cleanNumericString.count])"
        }else if length == 13 {
            textString = "\(cleanNumericString[0..<1]),\(cleanNumericString[1..<4]),\(cleanNumericString[4..<7]),\(cleanNumericString[7..<10]),\(cleanNumericString[10..<cleanNumericString.count])"
        }else if length == 14 {
            textString = "\(cleanNumericString[0..<2]),\(cleanNumericString[2..<5]),\(cleanNumericString[5..<8]),\(cleanNumericString[8..<11]),\(cleanNumericString[11..<cleanNumericString.count])"
        }else if length == 15 {
            textString = "\(cleanNumericString[0..<3]),\(cleanNumericString[3..<6]),\(cleanNumericString[6..<9]),\(cleanNumericString[9..<12]),\(cleanNumericString[12..<cleanNumericString.count])"
        }else {
            if length > 15 {
                length = 15
                return false
            }
            textString = cleanNumericString
        }
        let textAttr = NSString(string: textString)
        print("me ", textAttr, textString)
        textField.text = textString
        return true
    }
    
}
extension String {
    func characterAtIndex(_ i: Int) -> Character? {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

