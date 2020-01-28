//
//  AddStudentVC.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import UIKit

class AddStudentVC: UIViewController {

    var schoolDataFor: School? = nil
    
    @IBOutlet weak var sName: UITextField!
    @IBOutlet weak var sRollNo: UITextField!
    @IBOutlet weak var sPhno: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func saveAction(_ sender: Any) {
        
        let newStudent = Student(context: DBManager.sharedManager.context)
        newStudent.name = sName.text!
        newStudent.rollno = Int16(sRollNo.text!) ?? 0
        newStudent.phno = Int16(sPhno.text!) ?? 0
        newStudent.single = schoolDataFor
        
        DBManager.sharedManager.saveContext()
        
    }
}
