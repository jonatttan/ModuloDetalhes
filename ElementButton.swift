//
//  ElementButton.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 19/04/21.
//

import Foundation

extension CoinDetalheUIView {
    
    func configuraTituloBotao(_ idMoedaInterna: String?) -> String { // configurar aqui para setar e add se id diferente de vazio
        guard let id = idMoedaInterna else { return "ops..."}
        for moeda in moedasFavorito {
            if moeda == id {
               return "REMOVER"
            }
        }
        return "ADICIONAR"
    }
    func botao() {
        let botaoFavorito = UIButton()
        //botaoFavorito.setTitle(title, for: .normal)
        //botaoFavorito.setTitle("-\(title)-", for: .highlighted)
        botaoFavorito.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        botaoFavorito.backgroundColor = .corPrimaria()
        botaoFavorito.layer.borderColor = UIColor.white.cgColor
        botaoFavorito.layer.borderWidth = 1
        botaoFavorito.layer.cornerRadius = 7
        self.alinharBotao()
        botaoFavorito.addTarget(self, action: #selector(acaoFavoritar), for: .touchUpInside)
        self.buttonFavorito = botaoFavorito
    }
    func alinharBotao() {
        guard let button = self.buttonFavorito else { return }
        button.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewBotao, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewBotao, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: (ScreenSize.screenWidth / 2))
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: (ScreenSize.screenHeight / 8))
        viewBotao.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
}
