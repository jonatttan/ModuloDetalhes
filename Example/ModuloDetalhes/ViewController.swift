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
    public var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("--Sou viewDidLoad da ViewController")
//        CoinDetalheUIView().setupUI(self, "BTC")
        id = body.setupUI(self, "BTC")
        stackMain.addArrangedSubview(body)
    }
}

extension ViewController: CoinDetalheDelegate {
    func favoritar(_ id: String) {
        print("============\(id)================")
    }
    

}
