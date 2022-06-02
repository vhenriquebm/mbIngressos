//
//  FavoritosViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    @IBOutlet weak var tabelaDeFavoritos: UITableView!
    
    var novoEventoFavorito:Evento?

    var listaDeFavoritos:[Evento] = []
    
    func qualquer () {

        guard let evento = novoEventoFavorito else {return}
        
        listaDeFavoritos.append(evento)
        
        print (listaDeFavoritos)
    }
    
    
    override func viewDidLoad() {
        
        configureUI()

        qualquer()
    }
    
    func configureUI () {
        
        tabelaDeFavoritos.delegate = self
        tabelaDeFavoritos.dataSource = self
    }
    
}


extension FavoritosViewController: UITableViewDelegate {
    
}

extension FavoritosViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaDeFavoritos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeFavoritos.dequeueReusableCell(withIdentifier:"celulaDeFavoritos", for: indexPath) as? FavoritosTableViewCell {
            
            let indice = indexPath.row
            
            cell.nomeDoEvento.text = listaDeFavoritos[indice].nome
            cell.dataDoEvento.text = listaDeFavoritos[indice].data
            cell.imagemFavoritos.image = listaDeFavoritos[indice].imagem


            
            
            return cell

            
        }

        return UITableViewCell()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
}

extension FavoritosViewController: AdicionarFavoritosDelegate {
    
    func adicionarAosFavorito(evento: Evento?) {
        
        listaDeFavoritos.append(evento!)
        
        tabelaDeFavoritos.reloadData()
        
    }
    
}
