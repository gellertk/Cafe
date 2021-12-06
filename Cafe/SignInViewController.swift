//
//  ViewController.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 28.11.2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblValidationMessage: UILabel!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var imgPasswordEye: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPasswordEye.image = UIImage(named: "openedEye")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgPasswordEye.addGestureRecognizer(tapGestureRecognizer)
       
        signInButton.layer.cornerRadius = 12
        
        for case let textField as UITextField in self.view.subviews {
            textField.addOnlyBottomBorder()
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if imgPasswordEye.image == UIImage(named: "openedEye") {
            imgPasswordEye.image = UIImage(named: "closedEye")
            txtPassword.isSecureTextEntry = false
        } else {
            imgPasswordEye.image = UIImage(named: "openedEye")
            txtPassword.isSecureTextEntry = true
        }
        
        //if imgPasswordEye.image = UIImage(named: "closedEye")
    }
    
    @IBAction func loginUser(_ sender: UIButton) {

        guard let email = txtEmail.text, txtEmail.text?.count != 0 else {
            wrongLogin("Enter correct email")
            return
        }
        if isValidEmail(emailID: email) {
            guard let _ = txtPassword.text, txtPassword.text?.count != 0 else {
                wrongLogin("Enter correct password")
                return
            }
//            if let newVC = storyboard?.instantiateViewController(withIdentifier: "RegistationViewController") {
//                navigationController?.pushViewController(newVC, animated: true)
//            }
        } else {
            wrongLogin("Email is not valid")
        }
    }
    
    func wrongLogin( _ message: String) {
        lblValidationMessage.text = message
        lblValidationMessage.isHidden = false
        buttonSignIn.shake()
    }

}
    


