//
//  ViewController.swift
//  TP1_App
//
//  Created by Clémence Durupt on 07/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTodoFiltered.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        cell1.myTitre.text = myTodoFiltered[row].titre
        
        return cell1
    }
    
    
    
    @IBOutlet weak var myResearch: UITextField!
    @IBOutlet weak var my_table: UITableView!
    var myTodo : [MyTodo] = []
    var myTodoFiltered : [MyTodo] = []
    var myTitre : [String] = ["Courses","Sport","Sortie"]
    var myDesc : [String] = ["Pain, fromage","Basket", "Cinéma, théâtre"]
    var myDate : [Date] = [Date.init(timeIntervalSinceNow: 200000),Date.init(timeIntervalSinceNow: 500000),Date.init()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0...2 {
            let desc = myDesc[i]
            let titre = myTitre[i]
            let date = myDate[i]
            let td = MyTodo(desc: desc, titre: titre, date: date)
            myTodo.append(td)
            
        }
        myTodoFiltered = myTodo
        my_table.dataSource = self
        my_table.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = my_table.indexPathForSelectedRow!.row
            vc.myTodo = myTodoFiltered[row]
        }
    }
    
    
    @IBAction func creer(_ unwindSegue: UIStoryboardSegue){
        if let vc = unwindSegue.source as? AddViewController{
            if vc.myTodo != nil{
                
                myTodoFiltered.append(vc.myTodo!)
                myTodo = myTodoFiltered
                my_table.reloadData()
            }
        }
    }
    
    @IBAction func suppr(_ unwindSegue: UIStoryboardSegue){
        if unwindSegue.source is DetailViewController{
            let row = my_table.indexPathForSelectedRow!.row;
            myTodoFiltered.remove(at: row)
            myTodo = myTodoFiltered
            if my_table != nil{
                my_table.reloadData()
            }
        }
    }
    @IBAction func mySort(_ sender: Any) {
        myTodoFiltered.sort(by: {$0.date < $1.date})
        myTodo = myTodoFiltered
        my_table.reloadData()
    }
    @IBAction func mySearch(_ sender: Any) {
        if myResearch.text == "" {
            myTodoFiltered = myTodo
        }
        else {
            myTodoFiltered = myTodo.filter{$0.titre.contains(myResearch.text!)}
        }
        my_table.reloadData()
        
    }
    
    
    
}

