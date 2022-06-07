//
//  FavoritosViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    var favoritoViewModel = FavoritosViewModel(novoEventoFavorito: nil)

    @IBOutlet weak var tabelaDeFavoritos: UITableView!
    
    override func viewDidLoad() {
        configureFavoriteTable()
       
        
    }
    
    func configureFavoriteTable() {
        tabelaDeFavoritos.delegate = self
        tabelaDeFavoritos.dataSource = self
        favoritoViewModel.AtualizarFavoritos {
            self.tabelaDeFavoritos.reloadData()
        }
    }
    
}

extension FavoritosViewController: UITableViewDelegate {    
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritoViewModel.favoritos.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeFavoritos.dequeueReusableCell(withIdentifier:"celulaDeFavoritos", for: indexPath) as? FavoritosTableViewCell {
            
            let indice = indexPath.row
            let favorito = favoritoViewModel.favoritos[indice]
            
            let nome = favorito["nomeDoEvento"] as! String
            let data = favorito["dataDoEvento"] as! String
            let descricao = favorito["descricaoDoEvento"] as! String
            
            cell.nomeDoEvento.text = nome
            cell.dataDoEvento.text = data
            cell.descricaoDoEvento.text = descricao
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

