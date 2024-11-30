//
//  SignupViewController.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import UIKit
import RealmSwift

class SignupViewController: UIViewController {
    
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    
    let uirealm = try! Realm()
    
    var signUpDtl: Results<SignUp>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.layer.cornerRadius = 10
        signUpView.layer.borderWidth = 1
        signUpView.layer.borderColor = UIColor.blue.cgColor
        
        self.signUpDtl = uirealm.objects(SignUp.self)
    }
    
    
    @IBAction func didLoginTap(_ sender: Any) {

        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didsignUpTap(_ sender: Any) {
        let signAuthen = SignUp()
        
        if let enteredEmail = email.text, enteredEmail.isEmail {
            signAuthen.suemail = enteredEmail
        }else {
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        if let enteredPhNO = contactNumber.text, enteredPhNO.isValidPhone {
            signAuthen.suphno = enteredPhNO
        }else {
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid phone number.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        if let enteredpassword = password.text, enteredpassword.isPasswordValid {
            signAuthen.supassword = enteredpassword
        }else {
            let alert = UIAlertController(title: "Invalid Email", message: "Password must be contain 1UpperLetter,uniquesymbol,number,length 8.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        signAuthen.suuser = username.text ?? ""
        signAuthen.suconfirmpassword = confirmPassword.text ?? ""
        
        if signAuthen.suemail == "" || signAuthen.suuser == "" || signAuthen.suphno == "" || signAuthen.supassword == "" || signAuthen.suconfirmpassword == "" {
            let alert = UIAlertController(title: "OOPS!!", message:  "Plz Enter username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        } else {
            
            let existingUser = signUpDtl.filter("suuser = %@ AND suemail = %@", signAuthen.suuser,signAuthen.suemail).first
            
            if existingUser != nil {
                email.text = ""
                username.text = ""
                contactNumber.text = ""
                password.text = ""
                confirmPassword.text = ""
                let alert = UIAlertController(title: "OOPS!!", message:  "Username and Email already exists", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
            } else {
                if password.text != confirmPassword.text {
                    email.text = ""
                    username.text = ""
                    contactNumber.text = ""
                    password.text = ""
                    confirmPassword.text = ""
                    let alert = UIAlertController(title: "OOPS!!", message:  "Password and confirm Password do not matched", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                    present(alert, animated: true)
                } else {
                    
                    try! uirealm.write { () -> Void in
//                        uirealm.deleteAll()
                        uirealm.add(signAuthen)
                    }
                    email.text = ""
                    username.text = ""
                    contactNumber.text = ""
                    password.text = ""
                    confirmPassword.text = ""
                }
            }
        }
        
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "username")  as? UserNameViewController else {
            return
        }
//        vc.modalPresentationStyle = .fullScreen
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        navigationController?.pushViewController(vc, animated: true)

    }
    
}
