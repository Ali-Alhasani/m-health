//
//  MHTimesViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHTimesViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate {

    var dateToday : String = ""
    var doctorappointments = [Appointment]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorappointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")

        cell.textLabel?.text = doctorappointments[indexPath.row].patientName
        cell.detailTextLabel?.text = doctorappointments[indexPath.row].time
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "toPatientAppointment", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPatientAppointment" {
            let tabBarC : UITabBarController = segue.destination as! UITabBarController
            let navVc = tabBarC.viewControllers!.first as! UINavigationController
            let targetController = navVc.viewControllers.first as! MHPatientInfoViewController
//            let index = tableView.indexPathForSelectedItems?.first {
//                destine
//            }
            if let index = sender as? IndexPath {
                   targetController.socailId = self.doctorappointments[index.row].socialID
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
