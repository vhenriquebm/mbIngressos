//
//  InfoViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class InfoViewModel {
    
    var eventoInformacoes:Evento?
    
    let authentication = Auth.auth()
    
    let fireStore = Firestore.firestore()
        
    func salvarDadosDoEventoEmFavoritos () {
        
        let usuarioID = authentication.currentUser?.uid
        
        if let idUsuario = usuarioID {
            
            self.fireStore.collection("favoritos").document(idUsuario).collection("favoritos_usuario").addDocument(data: [
                "id": idUsuario,
                "nomeDoEvento": eventoInformacoes?.nome ?? "",
                "dataDoEvento":eventoInformacoes?.data ?? "",
                "descricaoDoEvento": eventoInformacoes?.descricao ?? "",
            ])
        }
    }
}


