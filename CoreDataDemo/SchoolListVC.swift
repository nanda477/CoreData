//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import UIKit

class SchoolListVC: UIViewController {

    @IBOutlet weak var schoolListView: UITableView!
    var sschools : [School] = []
    var scoolData: School?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        sschools = DBManager.sharedManager.fetchContext(entity: School.self) as! [School]
        schoolListView.reloadData()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showstudentListID" {
            let vc = segue.destination as! StudentListVC
            vc.schoolData = scoolData
        }
    }

}

extension SchoolListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sschools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell")
        let sch = sschools[indexPath.row]
        cell?.textLabel?.text = sch.name
        cell?.detailTextLabel?.text = (sch.address ?? "") + " : \(sch.estd)"
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        scoolData = sschools[indexPath.row]
        performSegue(withIdentifier: "showstudentListID", sender: nil)
    }
    
}

