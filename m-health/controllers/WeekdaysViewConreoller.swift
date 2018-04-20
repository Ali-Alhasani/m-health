//
//  weekdaysViewConreoller.swift
//  
//
//  Created by ahmad altaweel on 8/17/2559 BE.
//
//

import UIKit
import CoreData

class WeekdaysViewConreoller:UIViewController,
UITableViewDataSource, UITableViewDelegate {
    private var days = [
        "SUN", "MON", "TUE", "WED",
        "THU", "FRI", "SAT",
        ]
    var lastSelectedIndexPath:IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    var checked : Int = -1
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SessionManager.loadCalender()
        lastSelectedIndexPath = IndexPath(row: SessionManager.shared.weekEndDay-1, section: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.accessoryType = (lastSelectedIndexPath?.row == indexPath.row) ? .checkmark : .none
        //  cell!.accessoryType = (wd-1 == indexPath.row) ? .Checkmark : .None
        
        
        cell?.textLabel?.text = days[indexPath.row]
        //cell?.textLabel?.font = UIFont .boldSystemFontOfSize(50)
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        
        
        if indexPath.row != lastSelectedIndexPath?.row {
            if let lastSelectedIndexPath = lastSelectedIndexPath {
                let oldCell = tableView.cellForRow(at: lastSelectedIndexPath)
                oldCell?.accessoryType = .none
                
            }
            
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            
            lastSelectedIndexPath = indexPath
        }
        
        changeDay(day: (lastSelectedIndexPath?.row)!+1)
        
    }
    
    func changeDay(day:Int) {
        
        SessionManager.shared.weekEndDay = day
        SessionManager.saveCalender()
        wd = day
        print(scr)
        print(wd)
    }
    
}
