//
//  MHAllDurgsViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/30/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit



protocol AllDurgsViewControllerDelegate: class {
    
    func AllDurgsViewController(_ controller: MHAllDurgsViewController, didFinishAdding item: [Drugs])
    
}

class MHAllDurgsViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
     weak var delegate: AllDurgsViewControllerDelegate?
    
    var allDurgs = [Drugs]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
    
        return allDurgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationBulider")
        cell?.textLabel?.text = allDurgs[indexPath.row].name
        return cell!
    }
    
    
    @IBAction func doneAction(_ sender: Any) {
        delegate?.AllDurgsViewController(self, didFinishAdding: allDurgs)
    }
    
     @IBAction func unwindFromAddVC2(_ sender: UIStoryboardSegue){
        if sender.source is MHAddMedicationViewController {
            if let senderVC = sender.source as? MHAddMedicationViewController {
                
                allDurgs.append(senderVC.durgs)
            tableView.reloadData()
            }
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
