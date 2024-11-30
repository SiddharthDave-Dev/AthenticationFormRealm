//
//  UserNameViewController.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import UIKit
import RealmSwift

class UserNameViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userdtl: Results<SignUp>!
    
    let uirealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.userdtl = uirealm.objects(SignUp.self)
    }
    
    @IBAction func didLogoutTap(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        let loginvc = storyboard?.instantiateViewController(withIdentifier: "loginpage") ?? UIViewController()
        
        navigationController?.pushViewController(loginvc, animated: true)
    }
    @IBAction func didDeleteTap(_ sender: Any) {
        
        try! uirealm.write{ () -> Void in
            uirealm.deleteAll()
        }
        tableView.reloadData()
    }
}

extension UserNameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdtl?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
       
        cell.userLbl.text = userdtl[indexPath.row].suuser
        
        cell.emailLbl.text = userdtl[indexPath.row].suemail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        

        if editingStyle == .delete {
            try! uirealm.write{ () -> Void in
                uirealm.delete(userdtl[indexPath.row])
            }
            tableView.reloadData()
        }
    }
}
