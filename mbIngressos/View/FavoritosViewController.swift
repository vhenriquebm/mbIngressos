//
//  FavoritosViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FavoritosViewController: UIViewController {
    
    var favoritos: [Dictionary<String, Any>] = [
    ]

    
    let authentication = Auth.auth()
    let fireStore = Firestore.firestore()
    
    @IBOutlet weak var tabelaDeFavoritos: UITableView!
    
    var novoEventoFavorito:Evento?

    var listaDeFavoritos:[Evento] = []
    
    func qualquer () {

        guard let evento = novoEventoFavorito else {return}
        
        listaDeFavoritos.append(evento)
    }
    
    
    override func viewDidLoad() {
        recuperaFavoritos()
        configureUI()
        qualquer()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      
        
        
    }
    
   
    
    
    

    
    
    func recuperaFavoritos () {
        
        guard let idDoUsuario = authentication.currentUser?.uid else {return}
        
        fireStore.collection("favoritos").document(idDoUsuario).collection("favoritos_usuario").getDocuments
        {   snapshotResult, erro in
            
            if let snapshot = snapshotResult {
                
                for document in snapshot.documents {
                    
                    let dados = document.data()
                    self.favoritos.append(dados)
                    
                    
                    
                    
                }
                
                self.tabelaDeFavoritos.reloadData()
            }
            
            
            
            
        }
        
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
        
        return favoritos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeFavoritos.dequeueReusableCell(withIdentifier:"celulaDeFavoritos", for: indexPath) as? FavoritosTableViewCell {
            
            let indice = indexPath.row
            let favorito = favoritos[indice]
            let nome = favorito["nomeDoEvento"] as! String
            let data = favorito["dataDoEvento"] as! String
            let descricao = favorito["descricaoDoEvento"] as! String
            
            cell.nomeDoEvento.text = nome
            cell.dataDoEvento.text = data
            cell.descricaoDoEvento.text = descricao
            //cell.dataDoEvento.text = listaDeFavoritos[indice].data
           // cell.imagemFavoritos.image = listaDeFavoritos[indice].imagem


            
            
            return cell

            
        }

        return UITableViewCell()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
}


