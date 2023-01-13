//
//  DetailViewController.swift
//  TP1_App
//
//  Created by Clémence Durupt on 16/12/2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo_temp = myTodo{
            myDescription.text = todo_temp.desc
            myTitre.text = todo_temp.titre
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YY"
            myDate.text = dateFormatter.string(from: todo_temp.date)
        }
        else{
            myDescription.text = "Description de la Todo"
            myTitre.text = "Erreur, ToDo invalide"
            myDate.text = "Date de la Todo"
        }
    }
    
    
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitre: UILabel!
    @IBOutlet weak var myDate: UILabel!
    
    var myTodo : MyTodo?

}
