//
//  CoinDetalheUIView.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 15/04/21.
//

import UIKit

public struct ScreenSize {
    public static let screenHeight = UIScreen.main.bounds.height / 2
    public static let screenWidth = UIScreen.main.bounds.width
}

public class CoinDetalheUIView: UIView{
    
    //MARK: - Variáveis
    var favoritoDelegate: CoinDetalheDelegate?
    var actionFavorita: (() -> Void)?
    
    //MARK: - IBOutlets
    @IBOutlet weak var stackHeader: UIStackView!
    @IBOutlet weak var labelCoinName: UILabel!
    @IBOutlet weak var imageCoin: UIImageView!
    @IBOutlet weak var stackFavorito: UIStackView!
    
    
    //MARK: - Funções
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("--Sou Required Init")
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        layoutIfNeeded()
        print("--Sou Init")
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupUICell()
        print("--Sou awakeFromNib") // Executando
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupUIView()
        print("--Sou layoutSubviews") // Executando
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        print("--Sou Init do frame")
    }
    
    private func setupInit() {
        // Configs iniciais
        print("--Sou setupInit")
    }
    
    public func botao() -> UIButton{
        let botaoFavorito = UIButton()
        botaoFavorito.setTitle("Favoritar", for: .normal)
        botaoFavorito.setTitle(";)", for: .highlighted)
        botaoFavorito.frame.size = CGSize(width: (ScreenSize.screenWidth / 4), height: (ScreenSize.screenHeight / 8))
        botaoFavorito.backgroundColor = .gray
        botaoFavorito.tintColor = .yellow
        botaoFavorito.layer.borderColor = UIColor.yellow.cgColor
        botaoFavorito.layer.borderWidth = 1.5
        botaoFavorito.layer.cornerRadius = 5
        return botaoFavorito
    }
    
    public func setupUI(delegate: CoinDetalheDelegate) {
        self.favoritoDelegate = delegate
        print("--Sou setupUI")
    }
    
    private func setupUIView() {
        print("--Sou setupUIView")
    }
    
    private func setupUICell() {
        //
        let botaoZin = botao()
        stackFavorito.addSubview(botaoZin)
        stackFavorito.addConstraint(NSLayoutConstraint(item: botaoZin, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackFavorito, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        stackFavorito.addConstraint(NSLayoutConstraint(item: botaoZin, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackFavorito, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
        //Aqui definir a cor da Stack
    }
    @IBAction func btFavoritoAction(_ sender: UIButton) {
        if let action = self.actionFavorita {
            action()
        } else {
            self.favoritoDelegate?.favoritar()
        }
    }
}
