//
//  Service.swift
//  ingressosMB
//
//  Created by Vitor Henrique Barreiro Marinho on 31/05/22.
//

import Foundation
import UIKit

class Service {
    
    private let listaDeEventos:[Evento] = [
        
        Evento(nome: "Empreender", tipo: "Empresa", descricao: "teste", data: "10/08/2022", imagem: UIImage(named: "evento01") ?? UIImage ()),
        Evento(nome: "Imersão Digital", tipo: "Universidade", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "20/07/2022", imagem: UIImage(named: "evento02") ?? UIImage ()),
        Evento(nome: "Empreender", tipo: "Empresa", descricao: "teste", data: "17/09/2022", imagem: UIImage(named: "evento03") ?? UIImage ()),
        Evento(nome: "Feira de ciências MB University", tipo: "Universidade", descricao: "teste", data: "teste", imagem: UIImage(named: "evento04") ?? UIImage ()),
        Evento(nome: "Empreender", tipo: "Empresa", descricao: "teste", data: "15/08/2022", imagem: UIImage(named: "evento05") ?? UIImage ())
       
    ]
    
    
    func retornaListaDeEventos () -> [Evento] {
        
        return listaDeEventos
    }
    
    
    
    
    
}
