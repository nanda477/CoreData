//
//  StudentListVC.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import UIKit

class StudentListVC: UIViewController {

    var schoolData: School? = nil
    var sstudents: [Student] = []
    @IBOutlet weak var studentListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//1
//        if let data = DBManager.sharedManager.fetchContext(entity: Student.self) as? [Student] {
//             sstudents = data
//        }
        
    //2
       
//        if let data = schoolData?.many {
//            sstudents.removeAll()
//            for idata in data {
//
//                sstudents.append(idata as! Student)
//            }
//        }

//3
        if let data = DBManager.sharedManager.fetchPredicate(entity: Student.self, compareStr: "single.name", predicate: schoolData?.name ?? "") as? [Student] {
            sstudents = data
        }
        
        studentListView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addstudentID" {
            
            let vc = segue.destination as! AddStudentVC
            vc.schoolDataFor = schoolData
        }
    }

}

extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sstudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentlCell")
        cell?.textLabel?.text = sstudents[indexPath.row].name
        cell?.detailTextLabel?.text = "Phno: \(sstudents[indexPath.row].phno)" + ": Roll NO: \(sstudents[indexPath.row].rollno)"
        return cell ?? UITableViewCell()
    }
    
    
}
