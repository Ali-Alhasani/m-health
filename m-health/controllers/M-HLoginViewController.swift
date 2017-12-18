//
//  M-HLoginViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 1/12/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class M_HLoginViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func loginAction(_ sender: Any) {
        if(userNameText.text!.isEmpty || passwordText.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "Please provide a username, and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else{
            let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
            spiningActivity.label.text = "Sending"
            spiningActivity.detailsLabel.text = "Please Wait"
            Connect.shared.login(userName: userNameText.text!, password: passwordText.text!, completed: { (_ name, _ email, _ token) in
                 MBProgressHUD.hide(for: self.view, animated: true)
                UserDefaults.standard.set(token, forKey: "token")
                UserDefaults.standard.synchronize()
                self.login()
            }, failed: { (_ error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                let alert = UIAlertController(title: "Alert", message:error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            })
        }

       
    }
    
    func login(){
        let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.loginUser()
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    
}
