//
//  ViewController.swift
//  SimpleStorage
//
//  Created by Yonghyeon on 6/7/26.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self

        if let value = UDM.shared.defaults.value(forKey: "name") as? String {
            label.text = value
        }
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UDM.shared.defaults.setValue(textField.text, forKey: "name")
        textField.resignFirstResponder()

        return true
    }

}

class UDM {

    static let shared = UDM()
    let defaults = UserDefaults(suiteName: "com.yonghyeon.SimpleStorage")!

    func getName() -> String {
        return ""
    }

}
