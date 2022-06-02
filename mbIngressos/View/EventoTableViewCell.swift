//
//  EventoTableViewCell.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class EventoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagemDoEvento: UIImageView!
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    @IBOutlet weak var dataDoEvento: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        imagemDoEvento.layer.cornerRadius = 5
        
        imagemDoEvento.clipsToBounds = true
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
