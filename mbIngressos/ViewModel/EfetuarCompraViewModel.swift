//
//  EfetuarCompraViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EfetuarCompraViewModel {
    
    let authentication = Auth.auth()
    let fireStore = Firestore.firestore()
    
    private let informacoesParaCompra:Evento?

    init(informacoesParaCompra: Evento?){
        
        self.informacoesParaCompra = informacoesParaCompra
    }
    
    
    var getInformacoesParaCompraNome: String {
        
        return informacoesParaCompra?.nome ?? ""
    }
    
    var getInformacoesParaValorDoIngresso: String {
        
        return informacoesParaCompra?.valorIngresso ?? ""
    }
    
    var getInformacoesDataDoEvento: String {
        
        return informacoesParaCompra?.data ?? ""
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
