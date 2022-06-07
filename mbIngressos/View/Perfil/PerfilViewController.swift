//
//  PerfilViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit


class PerfilViewController: UIViewController {
    
    private let perfilViewModel = PerfilViewModel ()
    
    @IBOutlet weak var nomeDoUsuario: UILabel!
    
    @IBOutlet weak var cpfDoUsuario: UILabel!
    
    @IBOutlet weak var emailDoUsuario: UILabel!
    
    override func viewDidLoad() {
        
        perfilViewModel.fetchUserData()
        perfilViewModel.delegate = self
    }
}

extension PerfilViewController: PerfilViewModelDelegate {
    
    func showUserData(nome: String, email: String, cpf: String) {
        nomeDoUsuario.text = nome
        emailDoUsuario.text = email
        cpfDoUsuario.text = cpf
    }
}
