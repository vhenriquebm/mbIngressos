//
//  CadastroViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var nomeDoUsuario: UITextField!
    
    @IBOutlet weak var cpfDoUsuario: UITextField!
    
    @IBOutlet weak var emailDoUsuario: UITextField!
    
    @IBOutlet weak var senhaDoUsuario: UITextField!
    
 
    
    @IBAction func cadastrarUsuario(_ sender: Any) {
        
        guard let email = emailDoUsuario.text, let senha = senhaDoUsuario.text else {return}
        
        
//        authentication.createUser(withEmail: email, password: senha) { resultado, erro in
//
//            if erro == nil {
//                print ("Sucesso ao cadastrar o usuário")
//
//            }
//
//            if resultado == nil {
//
//                print("Por gentileza informar os dados para cadastro")
//            }
//
//
//
//        }
        
        
            
        }
    
        
        
        
        

    
  
    
    
    
    
    override func viewDidLoad() {
        
       
        
        
        
    }
    
    
    
    
    
    
}
