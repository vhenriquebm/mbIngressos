//
//  EfetuarCompraViewController.swift
//  mbIngressos
//
//  Created by Vitor Henrique Barreiro Marinho on 03/06/22.
//

import UIKit


class EfetuarCompraViewController: UIViewController {
    
    var efetuarCompraViewModel: EfetuarCompraViewModel?
    
    @IBOutlet weak var nomeDoEvento: UILabel!
    
    @IBOutlet weak var valorDoIngresso: UILabel!
    
    @IBOutlet weak var dataDoEvento: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func comprarButton(_ sender: Any) {
        
        efetuarCompraViewModel?.salvarDadosDaCompra()
        
        exibeAlerta(title: "Compra efetuada com sucesso!", message: "Tudo esta em ordem")
    }
    
    func configureUI () {
        nomeDoEvento.text = efetuarCompraViewModel?.getInformacoesParaCompraNome
        valorDoIngresso.text = efetuarCompraViewModel?.getInformacoesParaValorDoIngresso
        dataDoEvento.text = efetuarCompraViewModel?.getInformacoesDataDoEvento
    }
    
    func exibeAlerta (title:String?, message: String?) {
        
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acao = UIAlertAction(title: "Ok", style: .default) { irParaTelaPrincipal in
            self.navigationController?.popViewController(animated: true)
        }
        alerta.addAction(acao)
        present(alerta, animated: true)
    }
}
