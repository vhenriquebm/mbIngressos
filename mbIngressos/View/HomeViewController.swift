//
//  HomeViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    let authentication = Auth.auth()
    
    @IBAction func entrarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "telaDeLogin", sender: self)
    }
    
    
    @IBOutlet weak var tabelaDeEventos: UITableView!
    
    let eventoViewModel = EventoViewModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        authentication.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
            print ("usuario logado")
                self.performSegue(withIdentifier: "usuarioLogado", sender: self)
                
            } else {
                
                print ( "Erro ao logar")
            }
            
            
        }
       
    }
    
    
 
    
    func configureUI () {
        title = "Home"
        tabelaDeEventos.delegate = self
        tabelaDeEventos.dataSource = self
    }
}


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "infoView", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let infoView = segue.destination as? InfoViewController? {
            
            let lista = eventoViewModel.retornarEventos()
            guard let row = tabelaDeEventos.indexPathForSelectedRow?.row else {return}

            infoView?.eventoInformacoes = lista[row]
        }
        
        
    }
    
    
}


extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        eventoViewModel.retornarEventos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeEventos.dequeueReusableCell(withIdentifier: "eventoCell", for: indexPath) as? EventoTableViewCell {
            
            let indice = indexPath.row
            let lista = eventoViewModel.retornarEventos()
            
            cell.imagemDoEvento.image = lista[indice].imagem
            cell.nomeDoEvento.text = lista[indice].nome
            cell.dataDoEvento.text = lista[indice].data
            
            return cell
        }
        
        return UITableViewCell ()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
}
