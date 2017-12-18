//
//  MHMedicationBuliderViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/29/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHMedicationBuliderViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{

 
    
    var Dose:[String]?
    var Unit:[String]?
    var Route:[String]?
    var Frequency:[String]?
    var DoseValue:String?
    var UnitValue:String?
    var RouteValue:String?
    var FrequencyValue:String?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buliderLabel: UILabel!
    @IBOutlet weak var buliderSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       readPropertyList()
        buliderSegment.addTarget(self, action: #selector(self.action), for: .valueChanged)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func action(){
        self.tableView.reloadData()
    }
    
     func readPropertyList(){
        var resourceFileDictionary: Dictionary<String, AnyObject>?
    
    //Load content of Info.plist into resourceFileDictionary dictionary
    if let path = Bundle.main.path(forResource: "Dose", ofType: "plist") {
        resourceFileDictionary = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject>
    }
    
    if let resourceFileDictionaryContent = resourceFileDictionary {
        Dose = resourceFileDictionaryContent["Dose"] as? [String]
         Unit = resourceFileDictionaryContent["unit"] as? [String]
         Route = resourceFileDictionaryContent["Route"] as? [String]
         Frequency = resourceFileDictionaryContent["Frequency"] as? [String]

        }
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        
        if(buliderSegment.selectedSegmentIndex == 0){
            return (Dose?.count)!
        }else if (buliderSegment.selectedSegmentIndex == 1){
            return (Unit?.count)!
        }else if (buliderSegment.selectedSegmentIndex == 2){
            return (Route?.count)!
        }else if (buliderSegment.selectedSegmentIndex == 3){
            return (Frequency?.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationBulider")
        if(buliderSegment.selectedSegmentIndex == 0){
            cell?.textLabel?.text = Dose![indexPath.row]
        }else if (buliderSegment.selectedSegmentIndex == 1){
           cell?.textLabel?.text = Unit![indexPath.row]
        }else if (buliderSegment.selectedSegmentIndex == 2){
             cell?.textLabel?.text = Route![indexPath.row]
        }else if (buliderSegment.selectedSegmentIndex == 3){
          cell?.textLabel?.text = Frequency![indexPath.row]
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "show", sender: nil)
        
        switch buliderSegment.selectedSegmentIndex {
        case 0:
            DoseValue = Dose![indexPath.row]
            buliderLabel.text = DoseValue
            break
        case 1:
            UnitValue = Unit![indexPath.row]
            buliderLabel.text = buliderLabel.text! + " " + UnitValue!
            break
        case 2:
           RouteValue = Route![indexPath.row]
            buliderLabel.text = buliderLabel.text! + " " + RouteValue!
            break
        case 3:
            FrequencyValue = Frequency![indexPath.row]
              buliderLabel.text = buliderLabel.text! + " " + FrequencyValue!
            break
        case 4:
            DoseValue = Dose![indexPath.row]
            break
        case 5:
            DoseValue = Dose![indexPath.row]
            break
        default:
            break
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
