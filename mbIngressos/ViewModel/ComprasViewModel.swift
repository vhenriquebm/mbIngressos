//
//  ComprasViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ComprasViewModel {
    
    let fireStore = Firestore.firestore()
    let authentication = Auth.auth()
    var ListaDecompras: [Dictionary<String, Any>] = []
    
    func recuperarCompras (completion: @escaping() -> Void) {
        
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            completion()
        })
        }
    }
    
    
    

    
    

