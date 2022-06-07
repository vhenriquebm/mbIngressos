//
//  EventoViewModel.swift
//  ingressosMB
//
//  Created by Vitor Henrique Barreiro Marinho on 31/05/22.
//

import Foundation
import FirebaseAuth


protocol ConsultarStatusDoUsuarioDelegate {
    func consultarStatusLoginDoUsuario ()
}

class EventoViewModel {
    
    var delegate: ConsultarStatusDoUsuarioDelegate?
    
    var homeDelegate:HomeViewControllerDelegate?
    
    
    func logOutDoUsuario() {
        
        do {
           try  authentication.signOut()
            print ("usuario deslogado")
            
            homeDelegate?.direcionarUsuarioDeslogado()
            
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
    
    
    
    func consultarStatusLoginDoUsuario () {
        
        authentication.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
               
                
            } else {
                
                self.homeDelegate?.direcionarUsuarioDeslogado()
            }
        }
    }
}



