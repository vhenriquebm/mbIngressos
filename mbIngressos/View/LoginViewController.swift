//
//  LoginViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBAction func entrarButton(_ sender: Any) {
    }
    
    
    @IBAction func cadastrarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "telaDeCadastro", sender: self)
        
        
        
    }
    
    override func viewDidLoad() {
        
    }
    
    
    
}
