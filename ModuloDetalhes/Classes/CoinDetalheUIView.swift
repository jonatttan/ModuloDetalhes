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

struct ColorDefault {
    public static let fontColor = UIColor.white
    public static let headColor = UIColor.systemGreen
    public static let footerColor = UIColor.black
}

public struct DadosDetalhes {
    public var coinNome = ""
    public var coinImage: UIImage?
    public var coinValorPrincipal = ""
    public var coinFavorite = ""
    public var coinUltimaHora = ""
    public var coinUltimoMes = ""
    public var coinUltimoAno = ""
}

public class CoinDetalheUIView: UIView{
    
    //MARK: - Variáveis
    var favoritoDelegate: CoinDetalheDelegate?
    var actionFavorita: (() -> Void)?
    let dados = DadosDetalhes(coinNome: "Bitcoin", coinImage: nil, coinValorPrincipal: "25.000,00", coinFavorite: "1", coinUltimaHora: "25.500,00", coinUltimoMes: "25.300,00", coinUltimoAno: "24.000,00")  // Teste
    //MARK: - IBOutlets
    // First Stack
    @IBOutlet weak var stackHeader: UIStackView!
    @IBOutlet weak var labelCoinName: UILabel!
    @IBOutlet weak var imageCoin: UIImageView!
    @IBOutlet weak var labelValorPrincipal: UILabel!
    @IBOutlet weak var stackFavorito: UIStackView!
    // Second Stack
    @IBOutlet weak var stackFooter: UIStackView!
    @IBOutlet weak var lbStaticVolumesNegociados: UILabel!
    @IBOutlet weak var lbStaticUltimaHora: UILabel!
    @IBOutlet weak var lbStaticUltimoMes: UILabel!
    @IBOutlet weak var lsStaticUltimoAno: UILabel!
    @IBOutlet weak var labelValorHora: UILabel!
    @IBOutlet weak var labelValorMes: UILabel!
    @IBOutlet weak var labelValorAno: UILabel!
    
    
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
        // Necessário para configuração de renderização
        alignButton()
        colorStack()
        colorFont()
        fontStyle()
        setValues(dados)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupUIView()
        print("--Sou layoutSubviews") // Executando
        // Necessário para configuração de renderização
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
        botaoFavorito.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    private func alignButton() {
        let botaoZin = botao()
        stackFavorito.addSubview(botaoZin)
        stackFavorito.addConstraint(NSLayoutConstraint(item: botaoZin, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackFavorito, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        stackFavorito.addConstraint(NSLayoutConstraint(item: botaoZin, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackFavorito, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
    }
    
    private func colorStack() {
        self.stackHeader.backgroundColor = ColorDefault.headColor
        self.stackFooter.backgroundColor = ColorDefault.footerColor
    }
    
    private func fontStyle() {
        self.labelValorPrincipal.font = UIFont.systemFont(ofSize: 30, weight: .light)
    }
    
    private func colorFont() {
        self.labelCoinName.textColor = ColorDefault.fontColor
        self.labelValorPrincipal.textColor = ColorDefault.fontColor
        self.lbStaticVolumesNegociados.textColor = ColorDefault.fontColor
        self.lbStaticUltimaHora.textColor = ColorDefault.fontColor
        self.lbStaticUltimoMes.textColor = ColorDefault.fontColor
        self.lsStaticUltimoAno.textColor = ColorDefault.fontColor
        self.labelValorHora.textColor = ColorDefault.fontColor
        self.labelValorMes.textColor = ColorDefault.fontColor
        self.labelValorAno.textColor = ColorDefault.fontColor
    }
    
    private func setValues(_ dados: DadosDetalhes) {
        self.labelCoinName.text = dados.coinNome
        self.labelValorPrincipal.text = "$ \(dados.coinValorPrincipal)"
        self.labelValorHora.text = "$ \(dados.coinUltimaHora)"
        self.labelValorMes.text = "$ \(dados.coinUltimoMes)"
        self.labelValorAno.text = "$ \(dados.coinUltimoAno)"
        
    }
    private func setupUICell() {
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
