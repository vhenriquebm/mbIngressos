//
//  InfoViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import Foundation

import Foundation
import UIKit


protocol AdicionarFavoritosDelegate {
    func adicionarAosFavorito(evento: Evento?)
}
    

class InfoViewController: UIViewController {
    
   
    @IBAction func comprarIngressoButton(_ sender: Any) {
        
    performSegue(withIdentifier: "comprarIngresso", sender: self)
    
    }
    
    
    @IBOutlet weak var imagemDoEvento: UIImageView!
    
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    
    @IBOutlet weak var descricaoDoEvento: UILabel!
    
    var delegate: AdicionarFavoritosDelegate?
    
    var eventoInformacoes:Evento?
    
    @IBAction func adicionarAosFavoritos(_ sender: Any) {
        
        delegate?.adicionarAosFavorito(evento: eventoInformacoes)
        
        performSegue(withIdentifier: "adicionarAosFavoritos", sender: self)
        
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let favoritos = segue.destination as? FavoritosViewController {
        
            favoritos.novoEventoFavorito = eventoInformacoes
                
        }
            
        }
        
    
    override func viewDidLoad() {
        
        imagemDoEvento.image = eventoInformacoes?.imagem
        nomeDoEvento.text = eventoInformacoes?.nome
        dataDoEvento.text = eventoInformacoes?.data
        descricaoDoEvento.text = eventoInformacoes?.descricao
        
    }
}


