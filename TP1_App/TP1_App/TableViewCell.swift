//
//  TableViewCell.swift
//  TP1_App
//
//  Created by Clémence Durupt on 07/11/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var myTitre: UILabel!
    @IBAction func myMarker(_ sender: AnyObject) {
        if sender.titleLabel?.text == "Fait"{
            sender.setTitle("À faire", for: .normal)
            
        }
        else{
            sender.setTitle("Fait", for: .normal)
            
        }
    }
    
    @IBAction func myDetails(_ sender: Any) {
    }
    
}
