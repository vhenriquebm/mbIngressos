//
//  FavoritosTableViewCell.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class FavoritosTableViewCell: UITableViewCell {

    @IBOutlet weak var descricaoDoEvento: UILabel!
    
    @IBOutlet weak var imagemFavoritos: UIImageView!
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
