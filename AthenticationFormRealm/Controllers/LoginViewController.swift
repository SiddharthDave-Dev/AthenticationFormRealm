//
//  ViewController.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import UIKit
import RealmSwift

let uirealm = try! Realm()

class LoginViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var login: Results<SignUp>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true

        if UserDefaults.standard.bool(forKey: "isLoggedIn") == true {
            let vc = storyboard?.instantiateViewController(withIdentifier: "username")  as! UserNameViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        myView.layer.cornerRadius = 10
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor.blue.cgColor
        
        self.login = uirealm.objects(SignUp.self)
        
    }
    
    @IBAction func didSignUpTap(_ sender: Any) {
        
        let signupvc = storyboard?.instantiateViewController(withIdentifier: "signupPage") ?? UIViewController()
        
        
        navigationController?.pushViewController(signupvc, animated: true)
        
        
    }
    
    @IBAction func didLoginTapped(_ sender: Any) {
        
        
        if usernameTF.text == "" || passwordTF.text == "" {
            
            let alert = UIAlertController(title: "OOPS!!", message:  "Plz Enter username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            
        } else {
            
            if (login.filter("suuser = %@",usernameTF.text ?? "").first != nil)  {
                
                if (login.filter("suuser = %@ AND supassword = %@", usernameTF.text ?? "",passwordTF.text ?? "").first != nil) {
                    
                    guard let vc = storyboard?.instantiateViewController(withIdentifier: "username")  as? UserNameViewController else {
                        return
                    }
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
//                    vc.modalPresentationStyle = .fullScreen
                    navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    
                    let alert = UIAlertController(title: "OOPS!!", message:  "UserName or Password do not match", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                    present(alert, animated: true)
                }
            } else {
                
                let alert = UIAlertController(title: "OOPS!!", message:  "User do not exist plz sigup first!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
            }
        }
        
//        authen.suuser = usernameTF.text ?? ""
//        authen.supassword = passwordTF.text ?? ""
        
        
        
        
    }
}

