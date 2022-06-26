//
//  LoginViewController.swift
//  MovieApp
//
//  Created by MahyarShakouri on 9/7/1400 AP.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var usernameTextFieldvalid = false
    var passwordTextFieldvalid = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.backgroundColor = UIColor.init(red: 128/255, green: 102/255, blue: 56/255, alpha: 1.0)
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            if textField == self.usernameTextField {
                if updatedText.isEmpty {
                    usernameTextFieldvalid = false
                }
                else {
                    usernameTextFieldvalid = true
                    
                }
            }
            else if textField == self.passwordTextField{
                if updatedText.count > 5{
                    passwordTextFieldvalid = true
                }
                
                else {
                    passwordTextFieldvalid = false
                }
            }
        }
        if usernameTextFieldvalid && passwordTextFieldvalid {
            self.loginButton.backgroundColor = UIColor.init(red: 255/255, green: 162/255, blue: 5/255, alpha: 1.0)
        }
        else{
            self.loginButton.backgroundColor = UIColor.init(red: 128/255, green: 102/255, blue: 56/255, alpha: 1.0)
        }
        return true
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any){
        if (usernameTextField.text?.isEmpty ?? true) {
            self.errorLabel.text = "username is empty"
            return
        }
        if self.passwordTextFieldvalid == false{
            self.errorLabel.text = "Please enter the correct Password"
            return
        }
        self.errorLabel.text = ""
        UserDefaults.standard.set(usernameTextField.text! , forKey: "username")
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePage")
        self.navigationController?.show(vc!, sender: nil)
        
    }
}
