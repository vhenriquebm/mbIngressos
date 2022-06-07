//
//  HomeViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 02/06/22.
//

import UIKit
import FirebaseAuth

protocol HomeViewControllerDelegate {
    func direcionarUsuarioDeslogado()
}

class HomeViewController: UIViewController {
    let authentication = Auth.auth()

    @IBOutlet weak var tabelaDeEventos: UITableView!
    
    let eventoViewModel = EventoViewModel ()
    
    @IBAction func entrarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "telaDeLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventoViewModel.consultarStatusLoginDoUsuario()
        
        eventoViewModel.homeDelegate = self
        
        do {
           try  authentication.signOut()
            print ("usuario deslogado")
            
          
            
        }
        
        catch {
            
        }
    }
    
    
    @IBAction func botaoDeSair(_ sender: Any) {
        eventoViewModel.logOutDoUsuario()
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
            
            infoView?.infoViewModel.eventoInformacoes = lista[row]
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
            
            cell.imagemDoEvento.image = UIImage(named: lista[indice].imagem)
            cell.nomeDoEvento.text = lista[indice].nome
            cell.dataDoEvento.text = lista[indice].data
            return cell
        }
        
        return UITableViewCell ()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 240
    }
    
}


extension HomeViewController: HomeViewControllerDelegate {
    
    func direcionarUsuarioDeslogado() {
        performSegue(withIdentifier: "telaDeLogin", sender: self)
    }
    
    
    
    
}
