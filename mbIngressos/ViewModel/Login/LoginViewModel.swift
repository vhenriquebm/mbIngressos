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
                
                self.delegate?.exibeAlertaDelegate()
                
                return
            }
            
        }
    }
    
    func verificaStatusLogindoUsuario () {
        authentication.addStateDidChangeListener { autenticacao, usuario in
            
            if usuario != nil {
                
                self.delegate?.direcionarParaHome()
            }
        }
    }
}
