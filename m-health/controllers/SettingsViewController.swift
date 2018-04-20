//
//  settingsViewController.swift
//  ClinicPlus
//
//  Created by ahmad altaweel on 7/27/2559 BE.
//  Copyright © 2559 BE com.ali. All rights reserved.
//

import UIKit
var scr:Int = 1
var wd:Int = 1
class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var weekday: UILabel!
    @IBOutlet weak var scrollDirLable: UILabel!

   
    private var days = [
        "SUN", "MON", "TUE", "WED",
        "THU", "FRI", "SAT",
        ]
    
    var itemPicker: UIPickerView! = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        SessionManager.loadCalender()
            scr = SessionManager.shared.scroll
            wd = SessionManager.shared.weekEndDay
            print(scr)
            print(wd)

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lableNameCalendar()
        self.tableView.tableFooterView = UIView()
        
    }
    
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.section)
        print(indexPath.row)
        
        if indexPath.section == 3 && indexPath.row == 0{
            SessionManager.clearSessionManager()
            let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDel.logout()
        }else if indexPath.section == 2 && indexPath.row == 1 {
            //Create the AlertController and add Its action like button in Actionsheet
            let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "Option to select", preferredStyle: .actionSheet)
            
            let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetControllerIOS8.addAction(cancelActionButton)
            
            let saveActionButton: UIAlertAction = UIAlertAction(title: "Vertical", style: .default)
            { action -> Void in
                print("Vertical")
                self.scrollDirLable.text = "Vertical"
                self.changeScroll(x: 1)
                
            }
            actionSheetControllerIOS8.addAction(saveActionButton)
            
            let deleteActionButton: UIAlertAction = UIAlertAction(title: "Horizontal", style: .default)
            { action -> Void in
                print("Horizontal")
                self.scrollDirLable.text = "Horizontal"
                self.changeScroll(x: 2)
            }
            actionSheetControllerIOS8.addAction(deleteActionButton)
            self.present(actionSheetControllerIOS8, animated: true, completion: nil)
        }
        
    }
    
    
    
    
   
    func changeScroll(x:Int) {
        
        SessionManager.shared.scroll = x
        SessionManager.saveCalender()
    }
    
    
    func lableNameCalendar()  {
        if scr == 2 {
            self.scrollDirLable.text = "Horizontal"
            
        }else{
            self.scrollDirLable.text = "Vertical"
            
        }
        
        weekday.text = days[wd-1]
    }
    
    
    
}
