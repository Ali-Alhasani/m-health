//
//  MHDoctorTimeLineViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit
import FSCalendar

class MHDoctorTimeLineViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    var dateSelectd = ""
    var date = Date()
    var doctorappointments = [Appointment]()
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SessionManager.loadCalender()
        load()
        print(doctorappointments)
        view.addSubview(calendar)
        
        //        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        //        calendar.dataSource = self
        //        calendar.delegate = self
        //
        //        self.calendar = calendar
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.addSubview(calendar)
        if SessionManager.shared.scroll == 2 {
        calendar.scrollDirection = .horizontal
        }else {
             calendar.scrollDirection = .vertical
         
        }
        
        calendar.firstWeekday = UInt(SessionManager.shared.weekEndDay)
      
        
        
        
        //alendar.firstWeekday = UInt(wd)
        
        
    }
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func minimumDate(for calendar: FSCalendar) -> Date {
        return calendar.date(withYear: (calendar.year(of: date)-1), month: calendar.month(of: date), day:  calendar.day(of: date))
        
    }
    //    func maximumDate(for calendar: FSCalendar) -> Date {
    //        return calendar.date(withYear: (calendar.year(of: date)-1), month: calendar.month(of: date), day:  calendar.day(of: date))
    //
    //    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        //let day: Int! = calendar.day(of: date)
        let day = self.formatter.string(from: date)
        for item in doctorappointments {
            let date = item.date
            
            if(day == date){
                //            if( day == (item as AnyObject).value("Date")! as! String){
                return 1
                
            }
        }
        
        return 0
        //return day % 5 == 0 ? day/5 : 0;
    }
    
    
    
    var datesWithEvent:[NSDate] = []
    func calendar(_ calendar: FSCalendar, hasEventFor date: Date) -> Bool {
        return datesWithEvent.contains(date as NSDate)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        NSLog("calendar did select date \(formatter.string(from: date))")
        dateSelectd = formatter.string(from: date)
        self.performSegue(withIdentifier: "showTime", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showTime") {
            let sendVC: MHTimesViewController = segue.destination as! MHTimesViewController
            sendVC.dateToday = dateSelectd
            sendVC.doctorappointments = doctorappointments
        }
    }
    
    
    
    
    func load(){
        DataClient.shared.getDoctorAppointments(flag: 3, completed: { (_ doctorappointments) in
            self.doctorappointments = doctorappointments
        }) { (_ error) in
            let alert = UIAlertController(title: "Alert", message: error.message, preferredStyle: .alert)
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
