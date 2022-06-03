//
//  LoginViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    let authentication = Auth.auth()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBAction func entrarButton(_ sender: Any) {
        
        guard let email = emailTextField.text, let senha = senhaTextField.text else {return}
        
        authentication.signIn(withEmail: email, password: senha) { resultado, erro in
        
            if resultado == nil {
                
                self.exibeAlerta(title: "Usuário ou senha incorretos", message: "Por gentileza confirmas as informações")
                
            }
            
            if erro == nil {
                
                print("Sucesso ao logar")
                
            }
            
            
        }
        
        
        
    }
    
    
    func exibeAlerta (title:String?, message: String?) {
        
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let acao = UIAlertAction(title: "Ok", style: .default)
        
        alerta.addAction(acao)
        
        present(alerta, animated: true)
        
    }
    
    
    
    
    
    
    @IBAction func cadastrarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "telaDeCadastro", sender: self)
        
        
        
    }
    
    override func viewDidLoad() {
        
    }
    
    
    
}
