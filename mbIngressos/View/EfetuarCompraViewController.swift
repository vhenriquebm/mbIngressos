//
//  EfetuarCompraViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 03/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class EfetuarCompraViewController: UIViewController {
    
    var informacoesParaCompra:Evento?
    let authentication = Auth.auth()
    let fireStore = Firestore.firestore()
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    
    @IBOutlet weak var valorDoIngresso: UILabel!
    
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeDoEvento.text = informacoesParaCompra?.nome
        valorDoIngresso.text = informacoesParaCompra?.valorIngresso
        dataDoEvento.text = informacoesParaCompra?.data

    }
    

    
    
    @IBAction func comprarButton(_ sender: Any) {
        
       salvarDadosDaCompra()
        
        exibeAlerta(title: "Compra efetuada com sucesso!", message: "Tudo esta em ordem")
        
        performSegue(withIdentifier: "adicionarCompras", sender: self)
        
    }
    
    
    
    
    func exibeAlerta (title:String?, message: String?) {
        
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let acao = UIAlertAction(title: "Ok", style: .default)
        
        alerta.addAction(acao)
        
        present(alerta, animated: true)
        
    }

    
    
    
    
    func salvarDadosDaCompra () {
        
     
        
        let usuarioID = authentication.currentUser?.uid
        
        if let idUsuario = usuarioID {
            
            self.fireStore.collection("compras").document(idUsuario).collection("compras_usuario").addDocument(data: [
                "id": idUsuario,
                "nomeDoEvento": informacoesParaCompra?.nome ?? "",
                "dataDoEvento":informacoesParaCompra?.data ?? "",
                "valorDoIngresso": informacoesParaCompra?.valorIngresso ?? "",
            ])
        }
        
    }
    
    
    
    
    
    
}
