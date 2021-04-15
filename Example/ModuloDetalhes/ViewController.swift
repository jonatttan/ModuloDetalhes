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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        super.viewDidLoad()
        let head = CoinDetalheUIView.fromNib()
        head.setupUI(delegate: self)
        stackMain.addArrangedSubview(head)
    }

}

extension ViewController: CoinDetalheDelegate {
    func favoritar() {
        // Ação que vc quiser
    }
}
