//
//  CadastroViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var nomeDoUsuario: UITextField!
    
    @IBOutlet weak var cpfDoUsuario: UITextField!
    
    @IBOutlet weak var emailDoUsuario: UITextField!
    
    @IBOutlet weak var senhaDoUsuario: UITextField!
    
    let authentication = Auth.auth() //errado
    let fireStore = Firestore.firestore()  // errado
    
    
    
    @IBAction func cadastrarUsuario(_ sender: Any) {
        
        guard let email = emailDoUsuario.text, let senha = senhaDoUsuario.text, let nome = nomeDoUsuario.text, let cpf = cpfDoUsuario.text else {return} 
        
        
        authentication.createUser(withEmail: email, password: senha) { resultado, erro in

           if erro == nil {
               print ("Sucesso ao cadastrar o usuário")
               
               if let idUsuario = resultado?.user.uid {
                   
                   
                   self.fireStore.collection("usuarios").document(idUsuario).setData([
                    
                    "id": idUsuario,
                    "nome": nome,
                    "email":email,
                    "cpf":cpf
                       
                   ])
                   
                    }
                       
               
            }

            if resultado == nil {

                print("Por gentileza informar os dados para cadastro")
          }



       }
        
        
            
        }
    
        
        
        

    override func viewDidLoad() {
        
       
        
        
        
    }
    
    
    
    
    
    
}
