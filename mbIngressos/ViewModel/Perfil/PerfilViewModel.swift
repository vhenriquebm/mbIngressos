//
//  PerfilViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


protocol PerfilViewModelDelegate {
    func showUserData (nome: String, email: String, cpf: String)
}

class PerfilViewModel {
    
    let fireStore = Firestore.firestore()
    let authentication = Auth.auth()
    var delegate: PerfilViewModelDelegate?
    
    func fetchUserData () {
        
        guard let idDoUsuario = authentication.currentUser?.uid else {return}

        let usariosReferencia = fireStore.collection("usuarios").document(idDoUsuario)
        
        usariosReferencia.getDocument { snapshot, erro in
            
            if let dados = snapshot?.data() {
                let nome = dados["nome"] as? String
                let email = dados["email"] as? String
                let cpf = dados["cpf"] as? String
                
                self.delegate?.showUserData(nome: nome ?? "", email: email ?? "", cpf: cpf ?? "")
            }
        }
    }
}
