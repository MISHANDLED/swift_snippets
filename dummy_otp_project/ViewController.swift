//
//  ViewController.swift
//  dummy_otp_project
//
//  Created by Devansh Mohata on 04/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var otpTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpTextField.textContentType = .oneTimeCode
        otpTextField.keyboardType = .numberPad
        
        NotificationCenter.default.addObserver(self,selector:#selector(self.keyboardDidShow), name: UITextField.textDidChangeNotification, object: otpTextField)
        
    }
    
    @objc func keyboardDidShow(notifcation: NSNotification) {
        if otpTextField.text?.count == 4 {
            buttonContinue.isEnabled = true
            buttonLogin(buttonContinue)
        } else {
            buttonContinue.isEnabled = false
        }
    }
    
    @IBAction func buttonLogin(_ sender: UIButton) {
     let mainStoryboardId : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let StartVC = mainStoryboardId.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
     self.navigationController?.pushViewController(StartVC, animated: true)
     }
    
}

