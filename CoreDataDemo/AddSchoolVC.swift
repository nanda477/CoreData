//
//  AddSchoolVC.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import UIKit

class AddSchoolVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var estd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func saveAction(_ sender: Any) {
        
        let newSchool = School(context: DBManager.sharedManager.context)
        newSchool.name = name.text!
        newSchool.address = address.text!
        newSchool.estd = Int16(estd.text!) ?? 0
    
        DBManager.sharedManager.saveContext()
        
    }
}
