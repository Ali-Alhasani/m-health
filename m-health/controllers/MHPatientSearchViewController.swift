
//
//  MHPatientSearchViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHPatientSearchViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allPatients = [Patients]()
    var refreshControl = UIRefreshControl()
    var dateFormatter = DateFormatter()
    
    var searchActive : Bool = false
    var searchNotFound : Bool = false
    
    var filtered:[Patients] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Search Patients"
        
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.black
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        refreshControl.addTarget(self, action: #selector(self.PullRefresh), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refreshControl)
        
        load()
        // Do any additional setup after loading the view.
    }
    
    @objc func PullRefresh()
    {
        DispatchQueue.main.async {
            let now = NSDate()
            let updateString = "last update was" + self.dateFormatter.string(from: now as Date)
            
            self.refreshControl.attributedTitle = NSAttributedString(string: updateString)
            self.load()
            
            if self.refreshControl.isRefreshing
            {
                self.refreshControl.endRefreshing()
            }
            
            return
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        if isFiltering() {
            return filtered.count
        }
        return allPatients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell1")
        let patients: Patients
        if isFiltering() {
            patients = filtered[indexPath.row]
        }else{
            patients = allPatients[indexPath.row]
        }
        cell.textLabel?.text = patients.firstName! + " " + patients.lastName!
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "DiagnosisStoryboard", bundle: nil)
        let mainPage = mainStoryBoard.instantiateViewController(withIdentifier: "pTabBar") as! UITabBarController
        let navVc = mainPage.viewControllers!.first as! UINavigationController
        let targetController = navVc.viewControllers.first as! MHPatientInfoViewController
        let patients: Patients
        if isFiltering() {
            patients = filtered[indexPath.row]
        }else{
            patients = allPatients[indexPath.row]
        }
        targetController.socailId = patients.socialId!
        targetController.patientName = patients.firstName! + " " + patients.lastName!
        targetController.gender = patients.gender!
        targetController.birthday = patients.dob!
        self.present(mainPage, animated: true, completion:nil)
        
    }
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return self.searchBar.text?.isEmpty ?? true
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func isFiltering() -> Bool {
        return searchActive && !searchBarIsEmpty()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = allPatients.filter({( patient : Patients) -> Bool in
            return ((patient.firstName?.lowercased().contains(searchText.lowercased()))! || (patient.lastName?.lowercased().contains(searchText.lowercased()))!)
        })
        tableView.reloadData()
    }
    
    
    func load(){
        Connect.shared.allpatients( completed: { (_ allPatients) in
            self.allPatients = allPatients
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (_ error) in
            let alert = UIAlertController(title: "Alert", message:error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
    }
    
    
}

