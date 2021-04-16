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

    @IBOutlet weak var stackMain: UIStackView!
    
    let body = CoinDetalheUIView.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoinDetalheUIView().setupUI(delegate: self)
        stackMain.addArrangedSubview(body)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Não reenderiza no DidLoad, tenta aqui no DidApear ou um IBAction
    }
}

extension ViewController: CoinDetalheDelegate {
    func favoritar() {
        // Ação que vc quiser
    }
}
