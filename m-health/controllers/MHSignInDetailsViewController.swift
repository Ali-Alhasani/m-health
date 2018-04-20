//
//  MHSignInDetailsViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 1/24/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHSignInDetailsViewController: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if(usernameText.text!.isEmpty || passwordText.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "Please provide a username, and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else{
            userInfo.userName = usernameText.text!
            userInfo.password = passwordText.text!
            let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
            spiningActivity.label.text = "Sending"
            spiningActivity.detailsLabel.text = "Please Wait"
            DataClient.shared.registerdoctor(first_name: userInfo.firstName!, middle_name: userInfo.middleName!, last_name: userInfo.lastName!, password: userInfo.password!, email: userInfo.userName!, bio: userInfo.bio!, specilist: userInfo.specialist!, phone: ClincInfo.phone!, mobile: userInfo.mobile!, completed: {
                DataClient.shared.registerclinic(name: ClincInfo.clincName!, mobile: ClincInfo.mobile!, address: ClincInfo.address!, completed: {
                    //do something
                      MBProgressHUD.hide(for: self.view, animated: true)
                    //self.dismiss(animated: true)
                    self.performSegue(withIdentifier: "returnToLogin", sender: self)

                }, failed: { (_ error) in
                    MBProgressHUD.hide(for: self.view, animated: true)
                    let alert = UIAlertController(title: "Alert", message:error.message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                })
            }, failed: { (_ error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                let alert = UIAlertController(title: "Alert", message:error.message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            })
           
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
