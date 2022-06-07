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
        
        Evento(nome: "Empreender", tipo: "Empresa", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "10/08/2022", imagem: "evento01", valorIngresso: "R$ 20,00"),
        
        Evento(nome: "Imersão Digital", tipo: "Universidade", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "20/07/2022", imagem: "evento02", valorIngresso: "R$ 35,00"),
        
        Evento(nome: "Encontro Tecnologico", tipo: "Empresa", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "17/09/2022", imagem: "evento03", valorIngresso: "R$ 50,00"),
        
        Evento(nome: "Feira de ciências MB University", tipo: "Universidade", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "17/09/2022", imagem:  "evento04", valorIngresso: "R$ 75,00"),
        
        Evento(nome: "Eu programo Tu programas!", tipo: "Empresa", descricao: "A MB University irá realizar um curso de 60 horas, com a intenção de ensinar os fundamentos básicos da Internet para pessoas com dificuldades de acesso a internet", data: "15/08/2022", imagem:  "evento05", valorIngresso: "R$ 15,00")
    ]
    
    func retornaListaDeEventos () -> [Evento] {
        
        return listaDeEventos
    }
}
