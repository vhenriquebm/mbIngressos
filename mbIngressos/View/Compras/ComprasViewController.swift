//
//  ComprasViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 03/06/22.
//

import UIKit



class ComprasViewController: UIViewController{
    
    private let comprasViewModel = ComprasViewModel()
    
    @IBOutlet weak var tabelaDeCompras: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI () {
        tabelaDeCompras.dataSource = self
        tabelaDeCompras.delegate = self
        comprasViewModel.recuperarCompras {
            self.tabelaDeCompras.reloadData()
        }
        
    }
}

extension ComprasViewController: UITableViewDelegate{
}

extension ComprasViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comprasViewModel.ListaDecompras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelaDeCompras.dequeueReusableCell(withIdentifier: "celulaDeCompras", for: indexPath) as? ComprasTableViewCell {
            
            let indice = indexPath.row
            let compra = comprasViewModel.ListaDecompras[indice]
            
            let nome = compra["nomeDoEvento"] as! String
            let data = compra["dataDoEvento"] as! String
            let valorIngresso = compra["valorDoIngresso"] as! String
            
            cell.nomeDoEvento.text = nome
            cell.dataDoEvento.text = data
            cell.valorDoIngresso.text = valorIngresso
            
            return cell
        }
        return UITableViewCell ()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}






