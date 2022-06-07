//
//  CadastroViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class CadastroViewController: UIViewController {
    
    private let cadastroViewModel = CadastroViewModel ()
    
    @IBOutlet weak var nomeDoUsuario: UITextField!
    
    @IBOutlet weak var cpfDoUsuario: UITextField!
    
    @IBOutlet weak var emailDoUsuario: UITextField!
    
    @IBOutlet weak var senhaDoUsuario: UITextField!
    
    @IBAction func cadastrarUsuario(_ sender: Any) {
        
        cadastroViewModel.registerNewUser(email: emailDoUsuario.text, senha: senhaDoUsuario.text, nome: nomeDoUsuario.text, cpf: cpfDoUsuario.text)
        
    }
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = false
        cadastroViewModel.delegate = self
        
    }
}


extension CadastroViewController: CadastroViewModelDelegate {
    
    func irParaHome() {
        
        performSegue(withIdentifier: "irParaHome", sender: self)
    }
    
    
    
    
}
