//
//  PerfilViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class PerfilViewController: UIViewController {
    
    let fireStore = Firestore.firestore()
    let authentication = Auth.auth()
    
    @IBOutlet weak var nomeDoUsuario: UILabel!
    
    @IBOutlet weak var cpfDoUsuario: UILabel!
    
    @IBOutlet weak var emailDoUsuario: UILabel!
    
    override func viewDidLoad() {
        
        recuperarDadosDoUsuario()
        
    }
    
    
    func recuperarDadosDoUsuario () {
        
        guard let idDoUsuario = authentication.currentUser?.uid else {return}

        let usariosReferencia = fireStore.collection("usuarios").document(idDoUsuario)
      
        
        usariosReferencia.getDocument { snapshot, erro in
            
            if let dados = snapshot?.data() {
                
                let nome = dados["nome"] as? String
                let email = dados["email"] as? String
                let cpf = dados["cpf"] as? String

                self.nomeDoUsuario.text = nome
                self.emailDoUsuario.text = email
                self.cpfDoUsuario.text = cpf

                
                
                print (nome!)
                print (email!)
                print (cpf!)

                
            }
            
        }
    }
    
    
    
    
    
    
}
