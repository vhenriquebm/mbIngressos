//
//  EventoViewModel.swift
//  ingressosMB
//
//  Created by Vitor Henrique Barreiro Marinho on 31/05/22.
//

import Foundation
import FirebaseAuth


protocol EventoViewModelDelegate {
    
    func direcionarParaLogin ()
}

class EventoViewModel {

    var delegate: EventoViewModelDelegate?
    
    
    func logOutDoUsuario() {
        
        do {
           try  authentication.signOut()
            delegate?.direcionarParaLogin()
        }
        catch {
        }

}
    
    
    let authentication = Auth.auth()
    var evento: Evento?
    let servico = Service ()
    
    
    func retornarEventos () -> [Evento] {
        
        return servico.retornaListaDeEventos()
    }
    
    
    
  
}



