//
//  InfoViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//


import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage


class InfoViewController: UIViewController {
    
    var eventoInformacoes:Evento?
    
    @IBOutlet weak var imagemDoEvento: UIImageView!
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    @IBOutlet weak var descricaoDoEvento: UILabel!
    
    let authentication = Auth.auth()
    
    let fireStore = Firestore.firestore()
    
    let storage = Storage.storage()
    
    
    
    
    
    @IBAction func adicionarAosFavoritos(_ sender: Any) {
        
        salvarDadosDoEventoEmFavoritos()
        salvarImagemDoEventoEmFavoritos()
        
        performSegue(withIdentifier: "adicionarAosFavoritos", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let favoritos = segue.destination as? FavoritosViewController {
            
            favoritos.novoEventoFavorito = eventoInformacoes
            
        }
        
        
        if let efetuarCompras = segue.destination as? EfetuarCompraViewController {
            
            efetuarCompras.informacoesParaCompra = eventoInformacoes
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        imagemDoEvento.image = UIImage(named: eventoInformacoes?.imagem ?? "")
        nomeDoEvento.text = eventoInformacoes?.nome
        dataDoEvento.text = eventoInformacoes?.data
        descricaoDoEvento.text = eventoInformacoes?.descricao
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    
    
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
    
    
    func salvarImagemDoEventoEmFavoritos () {
        
        let imagemParaTeste = #imageLiteral(resourceName: "evento01")
        let imagemId = NSUUID().uuidString
        
        let armazenamento = storage.reference().child("imagens1")
        
            if let imagemDados = imagemParaTeste.jpegData(compressionQuality: 0.3) {
                
         
                armazenamento.child("imagens_favoritos1").child("\(imagemId).jpeg").putData(imagemDados, metadata: nil) { metaData, erro in
                    
                    if erro == nil {
                        
                        print ("Sucesso ao carregar a imagem")
                    } else {
                        
                        print ("Erro ao carregar a imagem:\(erro!)")
                    }
                    
                }
                
            }
            
            
        
        
        
        //let selectedImage = UIImage(named: eventoInformacoes?.imagem ?? "")
        
    }
    
    
    
    
    
    
    
    @IBAction func comprarIngressoButton(_ sender: Any) {
        
        print("botao funcionando")
        
        performSegue(withIdentifier: "comprarIngresso", sender: self)
    }
    
    
    
    
    
    
}


