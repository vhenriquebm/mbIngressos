//
//  LoginViewModel.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 06/06/22.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    
let authentication = Auth.auth()
    
    var delegate: LoginViewControllerDelegate?

    
  
    
    
    
    func userAuthentication (email: String?, senha: String?) {
      
        authentication.signIn(withEmail: email ?? "", password: senha ?? "") { resultado, erro in
        
            if resultado == nil {
                
                print ("Erro ao logar")
                
                self.delegate?.exibeAlertaDelegate()
                
                return
            }
            
            if erro == nil {
                
                self.delegate?.direcionarParaHome()
                print("Sucesso ao logar")
                
            }
            
            
        }
        
        
    }
    
    

    
    
    
}
