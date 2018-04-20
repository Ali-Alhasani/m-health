//
//  MHDoctorHomeViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit
import ISTimeline
class MHDoctorHomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var doctorAvaterImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorSpecialistLabel: UILabel!
    @IBOutlet weak var doctorClinicNameLabel: UILabel!
    @IBOutlet weak var doctorAddressLabel: UILabel!
    @IBOutlet weak var shortAgandaTable: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeline: ISTimeline!
    
    var tmp = ["Ahmed Selman","Ismail Aziza", "Shareef Sersawi" , "Amr Saidam"]
    var tmp2 =  ["12:30", "13:15", "13:30", "15:00"]
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
       
        timeline.backgroundColor = .white
        timeline.bubbleColor = .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        timeline.titleColor = .black
        timeline.descriptionColor = .darkText
        timeline.pointDiameter = 10.0
        timeline.lineWidth = 3.0
        timeline.bubbleRadius = 6.0
        timeline.contentInset = UIEdgeInsetsMake(10.0, 20.0, 20.0, 20.0)

        for i in 0...3 {
        let point = ISPoint(title: tmp2[i])
        point.description = tmp[i]
        point.lineColor = .red
        point.fill = true
        point.touchUpInside =
                { (point:ISPoint) in
                    print(point.title)
            }
        timeline.points.append(point)
        }
      
    
//
//        let black = UIColor.black
//        let green = UIColor.init(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
//
//
//
//        let myPoints = [
//            ISPoint(title: "06:46 AM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", pointColor: black, lineColor: black, touchUpInside: touchAction, fill: false),
//            ISPoint(title: "07:00 AM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.", pointColor: black, lineColor: black, touchUpInside: touchAction, fill: false),
//            ISPoint(title: "07:30 AM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", pointColor: black, lineColor: black, touchUpInside: touchAction, fill: false),
//            ISPoint(title: "08:00 AM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.", pointColor: green, lineColor: green, touchUpInside: touchAction, fill: true),
//            ISPoint(title: "11:30 AM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", touchUpInside: touchAction),
//            ISPoint(title: "02:30 PM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", touchUpInside: touchAction),
//            ISPoint(title: "05:00 PM", description: "Lorem ipsum dolor sit amet.", touchUpInside: touchAction),
//            ISPoint(title: "08:15 PM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", touchUpInside: touchAction),
//            ISPoint(title: "11:45 PM", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.", touchUpInside: touchAction)
//        ]
//
//        timeline.contentInset = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
//        timeline.points = myPoints
//
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Appointments for today"
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell1")
        cell.textLabel?.text =  tmp[indexPath.row]
        cell.detailTextLabel?.text =  tmp2[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "DiagnosisStoryboard", bundle: nil)
//        let mainPage = mainStoryBoard.instantiateViewController(withIdentifier: "pTabBar") as! UITabBarController
//        let navVc = mainPage.viewControllers!.first as! UINavigationController
//        let targetController = navVc.viewControllers.first as! MHPatientInfoViewController
//        let patients = allPatients[indexPath.row]
//        targetController.socailId = patients.socialId!
//        targetController.patientName = patients.firstName! + " " + patients.lastName!
//        targetController.gender = patients.gender!
//        targetController.birthday = patients.dob!
//        self.present(mainPage, animated: true, completion:nil)
//
//    }
//
    
    
    
    func load(){

        DataClient.shared.getdoctorPorfile(completed: { (_ name,_ address,_ clinicName,_ bio) in
            self.doctorNameLabel.text = name
            self.doctorSpecialistLabel.text = bio
            self.doctorClinicNameLabel.text = clinicName
            self.doctorAddressLabel.text = address
            
        }) { (_ error) in
            let alert = UIAlertController(title: "Alert", message:error.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
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
