//
//  FavoritosViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FavoritosViewModel {
    
    let authentication = Auth.auth()
    let fireStore = Firestore.firestore()
    
    private let novoEventoFavorito: Evento?
    
    init(novoEventoFavorito: Evento?) {
        
        self.novoEventoFavorito = novoEventoFavorito
    }
    
    var favoritos: [Dictionary<String, Any>] = []
    
    func AtualizarFavoritos (completion: @escaping () -> Void) {
        
        guard let idDoUsuario = authentication.currentUser?.uid else {return}
        
        fireStore.collection("favoritos").document(idDoUsuario).collection("favoritos_usuario").getDocuments
        {   snapshotResult, erro in
            
            if let snapshot = snapshotResult {
                
                for document in snapshot.documents {
                    
                    let dados = document.data()
                    self.favoritos.append(dados)
                }
                
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            completion()
        })
    }
}
