//
//  LoginViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

protocol LoginViewControllerDelegate {
    func exibeAlertaDelegate ()
    func direcionarParaHome()
}

class LoginViewController: UIViewController {
    
    var loginViewModel = LoginViewModel ()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBAction func entrarButton(_ sender: Any) {
        
        loginViewModel.userAuthentication(email: emailTextField.text, senha: senhaTextField.text)
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        performSegue(withIdentifier: "telaDeCadastro", sender: self)
    }
    
    override func viewDidLoad() {
        loginViewModel.delegate = self
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    
    func direcionarParaHome() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func exibeAlertaDelegate() {
        
        exibeAlerta(title: "Usuário ou senha incorretos", message: "Por gentileza confirmas as informações")
    }
    
    func exibeAlerta (title:String?, message: String?) {
        
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let acao = UIAlertAction(title: "Ok", style: .default)
        
        alerta.addAction(acao)
        
        present(alerta, animated: true)
    }
}
