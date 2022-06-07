//
//  CadastroViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


protocol CadastroViewModelDelegate {
    
    func irParaHome()
}

class CadastroViewModel {
    
    let authentication = Auth.auth()
    let fireStore = Firestore.firestore()
    var delegate:CadastroViewModelDelegate?
    
    func registerNewUser (email: String?, senha: String?, nome: String?, cpf: String?) {
        
        guard let email = email, let senha = senha, let nome = nome, let cpf = cpf else { return}
        
        
        authentication.createUser(withEmail: email, password: senha) { resultado, erro in

           if erro == nil {
               print ("Sucesso ao cadastrar o usuário")
               
               
               self.delegate?.irParaHome()
                            
               if let idUsuario = resultado?.user.uid {
                   
                   
                   self.fireStore.collection("usuarios").document(idUsuario).setData([
                    
                    "id": idUsuario,
                    "nome": nome,
                    "email":email,
                    "cpf":cpf
                       
                   ])
                   
                    }
                       
               
           } else {
               print ("erro ao cadastras o usuario")
           }

            if resultado == nil {

                print("Por gentileza informar os dados para cadastro")
          }



       }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
