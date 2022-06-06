//
//  ComprasTableViewCell.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 03/06/22.
//

import UIKit

class ComprasTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    @IBOutlet weak var valorDoIngresso: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
