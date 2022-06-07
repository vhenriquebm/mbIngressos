//
//  InfoViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//


import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    let infoViewModel = InfoViewModel ()

    @IBOutlet weak var imagemDoEvento: UIImageView!
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    @IBOutlet weak var descricaoDoEvento: UILabel!
        
    @IBAction func adicionarAosFavoritos(_ sender: Any) {
        
        infoViewModel.salvarDadosDoEventoEmFavoritos()
        
        performSegue(withIdentifier: "adicionarAosFavoritos", sender: self)
    }
    
    @IBAction func comprarIngressoButton(_ sender: Any) {
        
        performSegue(withIdentifier: "comprarIngresso", sender: self)
    }
    
    override func viewDidLoad() {
        
        configureUI()
        
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let favoritosViewController = segue.destination as? FavoritosViewController {
            
            let favorito1 = FavoritosViewModel(novoEventoFavorito: infoViewModel.eventoInformacoes)
            
            favoritosViewController.favoritoViewModel = favorito1

            
        }
        
        if let efetuarCompras = segue.destination as? EfetuarCompraViewController {
            
            let compra = EfetuarCompraViewModel(informacoesParaCompra: infoViewModel.eventoInformacoes)
            
            efetuarCompras.efetuarCompraViewModel = compra
        }
    }
    
    func configureUI () {
        imagemDoEvento.image = UIImage(named: infoViewModel.eventoInformacoes?.imagem ?? "")
        nomeDoEvento.text = infoViewModel.eventoInformacoes?.nome
        dataDoEvento.text = infoViewModel.eventoInformacoes?.data
        descricaoDoEvento.text = infoViewModel.eventoInformacoes?.descricao
    }
}


