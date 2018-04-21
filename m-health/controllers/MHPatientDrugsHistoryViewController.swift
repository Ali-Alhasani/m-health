//
//  MHPatientDrugsHistoryViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 4/20/18.
//  Copyright © 2018 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHPatientDrugsHistoryViewController: UIViewController {

    var allDurgs = [Drugs]()
    var socialId:String?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return allDurgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationBulider")
        cell?.textLabel?.text = allDurgs[indexPath.row].name
        return cell!
    }
    
    
    
    func load(){
        DataClient.shared.getPatientDrugs(patientSocialId: socialId!, completed: { (_ drugs) in
            self.allDurgs = drugs
            self.tableView.reloadData()
        }) { (_ error) in
            
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
