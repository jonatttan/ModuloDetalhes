//
//  CoinDetalheUIView.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 15/04/21.
//

import UIKit

public struct Teste {
    let valorTeste = 10
}

public protocol CoinDetalheDelegate: class {
    func favoritar()
}

public class CoinDetalheUIView: UIView {
    var favoritoDelegate: CoinDetalheDelegate?
    var actionFavorita: (() -> Void)?

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        layoutIfNeeded()
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupUICell()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupUIView()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setupInit() {
        // Configs iniciais
    }
    
    public func setupUI(delegate: CoinDetalheDelegate) {
        self.favoritoDelegate = delegate

    }
    
    private func setupUIView() {
        //
    }
    
    private func setupUICell() {
        //
    }

}
