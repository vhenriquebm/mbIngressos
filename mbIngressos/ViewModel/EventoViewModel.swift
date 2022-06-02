//
//  EventoViewModel.swift
//  ingressosMB
//
//  Created by Vitor Henrique Barreiro Marinho on 31/05/22.
//

import Foundation

class EventoViewModel {
    
    var evento: Evento?
    let servico = Service ()
    

    func retornarEventos () -> [Evento] {
        
        return servico.retornaListaDeEventos()
    }
    
    
    
}
