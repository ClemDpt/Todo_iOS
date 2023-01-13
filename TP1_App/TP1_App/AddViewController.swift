//
//  AddViewController.swift
//  TP1_App
//
//  Created by Clémence Durupt on 16/12/2022.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTodo = MyTodo(desc: "Description", titre: "Titre", date: Date.init())
    }
    
    @IBOutlet weak var inTitre: UITextField!
    @IBOutlet weak var inDesc: UITextField!
    @IBOutlet weak var inDate: UIDatePicker!
    
    @IBAction func updatedDesc(_ sender: Any) {
        myTodo?.desc = inDesc.text!
    }
    @IBAction func updatedTitre(_ sender: Any) {
        myTodo?.titre = inTitre.text!
    }
    @IBAction func updatedDate(_ sender: Any) {
        myTodo?.date = inDate.date
    }
    
    
    var myTodo : MyTodo?

}
