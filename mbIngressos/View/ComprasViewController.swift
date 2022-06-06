//
//  ComprasViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 03/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ComprasViewController: UIViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        print (ListaDecompras)
        tabelaDeCompras
            .reloadData()
    }
    
    var ListaDecompras: [Dictionary<String, Any>] = [
    ]
    
    
    let fireStore = Firestore.firestore()
    let authentication = Auth.auth()
    var novaCompra: Evento?

    
    
    @IBOutlet weak var tabelaDeCompras: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recuperarCompras()
        configureUI()
        
    }
    

    func configureUI () {
        
        tabelaDeCompras.delegate = self
        tabelaDeCompras.dataSource = self
        
    }

}


extension ComprasViewController: UITableViewDelegate {
    
    
}






extension ComprasViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        ListaDecompras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeCompras.dequeueReusableCell(withIdentifier: "celulaDeCompras", for: indexPath) as? ComprasTableViewCell {
            let indice = indexPath.row
            let compra = ListaDecompras[indice]
            let nome = compra["nomeDoEvento"] as! String
            let data = compra["dataDoEvento"] as! String
            let valorIngresso = compra["valorDoIngresso"] as! String
            
            cell.nomeDoEvento.text = nome
            cell.dataDoEvento.text = data
            cell.valorDoIngresso.text = valorIngresso

            
           return cell
            
        }
        
        
        
        return UITableViewCell ()
    }
    
    
    
    
    func recuperarCompras () {
        
        guard let idDoUsuario = authentication.currentUser?.uid else {return}
        
        fireStore.collection("compras").document(idDoUsuario).collection("compras_usuario").getDocuments
        {   snapshotResult, erro in
            
            if let snapshot = snapshotResult {
                
                for document in snapshot.documents {
                    
                    let dados = document.data()
                    self.ListaDecompras.append(dados)
                    
                    
                    
                    
                }
    
    
    
}

        }

    }
    
    
}
