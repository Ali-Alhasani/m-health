//
//  settingsViewController.swift
//  ClinicPlus
//
//  Created by ahmad altaweel on 7/27/2559 BE.
//  Copyright © 2559 BE com.ali. All rights reserved.
//

import UIKit
import CoreData
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
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Calendar")
        
        do {
            let objects = try context.executeFetchRequest(request)
            
            scr = objects[0].valueForKey("scroll")as? Int ?? 0
            wd = objects[0].valueForKey("weekday")as? Int ?? 0
            print(scr)
            print(wd)
            
            
        } catch {
            // Error thrown from executeFetchRequest()
            print("There was an error in executeFetchRequest(): \(error)")
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        lableNameCalendar()
        self.tableView.tableFooterView = UIView()
        
    }
    
    
    override func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.section)
        print(indexPath.row)
        
        if indexPath.section == 3 && indexPath.row == 0{
            NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
            NSUserDefaults.standardUserDefaults().synchronize()
            deleteIncidents()
            
            
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let signInPage:ViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = signInPage
        }else if indexPath.section == 2 && indexPath.row == 1 {
            //Create the AlertController and add Its action like button in Actionsheet
            let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "Option to select", preferredStyle: .ActionSheet)
            
            let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetControllerIOS8.addAction(cancelActionButton)
            
            let saveActionButton: UIAlertAction = UIAlertAction(title: "Vertical", style: .Default)
            { action -> Void in
                print("Vertical")
                self.scrollDirLable.text = "Vertical"
                self.changeScroll(1)
                
            }
            actionSheetControllerIOS8.addAction(saveActionButton)
            
            let deleteActionButton: UIAlertAction = UIAlertAction(title: "Horizontal", style: .Default)
            { action -> Void in
                print("Horizontal")
                self.scrollDirLable.text = "Horizontal"
                self.changeScroll(2)
            }
            actionSheetControllerIOS8.addAction(deleteActionButton)
            self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    func deleteIncidents() {
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Doctor")
        request.includesPropertyValues = false
        
        do {
            let incidents = try context.executeFetchRequest(request) as! [NSManagedObject]
            
            if incidents.count > 0 {
                
                for result: AnyObject in incidents{
                    context.deleteObject(result as! NSManagedObject)
                    print("NSManagedObject has been Deleted")
                }
                try context.save()
            }
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    func changeScroll(x:Int) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Calendar")
        
        do {
            let objects = try context.executeFetchRequest(request)
            if objects.count != 0{
                let theLine:NSManagedObject! = objects.first as? NSManagedObject
                
                theLine.setValue(x, forKey: "scroll")
                theLine.setValue(wd, forKey: "weekday")
                
                
            }
        }  catch {
            // Error thrown from executeFetchRequest()
            print("There was an error in executeFetchRequest(): \(error)")
        }
        
        appDelegate.saveContext()
        scr = x
        print(scr)
        print(wd)
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
