//
//  ViewController.swift
//  ModuloDetalhes
//
//  Created by jonatttan on 04/15/2021.
//  Copyright (c) 2021 jonatttan. All rights reserved.
//

import Foundation
import UIKit
import ModuloDetalhes

class ViewController: UIViewController {
    
    // XLM LTC DASH AMP BAT
    @IBOutlet weak var stackMain: UIStackView!
    let body = CoinDetalheUIView.fromNib()
    var favorito = false
    public var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataScreen.idMoeda = "ETH"
        DataScreen.seFavorito = self.favorito
        body.setupUI(self)
        stackMain.addArrangedSubview(body)
    }
}

extension ViewController: CoinDetalheDelegate {
    func voltar() {
        self.dismiss(animated: true, completion: nil)
    }
    func favoritar(_ id: String, _ acao: Bool) {
        print("============\(id)================")
    }
}
