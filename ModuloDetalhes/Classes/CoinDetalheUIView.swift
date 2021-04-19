//
//  CoinDetalheUIView.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 15/04/21.
//

import UIKit
import ModuloCommons

public struct ScreenSize {
    public static let screenHeight = UIScreen.main.bounds.height / 2
    public static let screenWidth = UIScreen.main.bounds.width
}

public class CoinDetalheUIView: UIView{
    
    //MARK: - Variáveis
    var favoritoDelegate: CoinDetalheDelegate?
    var actionFavorita: (() -> Void)?
    var buttonFavorito: UIButton?
    var idMoeda: String?
    var moedasFavorito = ["XLM", "LTC", "DASH", "AMP", "BAT"]
    //var dadosTeste: MoedaInfoElement?
    //MARK: - IBOutlets
    // First Stack
    @IBOutlet weak var stackHeader: UIStackView!
    @IBOutlet weak var labelCoinName: UILabel?
    @IBOutlet weak var imageCoin: UIImageView?
    @IBOutlet weak var labelValorPrincipal: UILabel?
    @IBOutlet weak var stackFavorito: UIStackView!
    @IBOutlet weak var viewBotao: UIView!
    
    // Second Stack
    @IBOutlet weak var stackFooter: UIStackView!
    @IBOutlet weak var lbStaticVolumesNegociados: UILabel!
    @IBOutlet weak var lbStaticUltimaHora: UILabel!
    @IBOutlet weak var lbStaticUltimoMes: UILabel!
    @IBOutlet weak var lsStaticUltimoAno: UILabel!
    @IBOutlet weak var labelValorHora: UILabel?
    @IBOutlet weak var labelValorMes: UILabel?
    @IBOutlet weak var labelValorAno: UILabel?
    
    
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
        colorStack()
        colorFont()
        fontStyle()
//        setValues(dados)
        self.buttonFavorito = botao()
        buttonAdd(buttonFavorito)
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
        botaoFavorito.setTitle("ADICIONAR", for: .normal)
        botaoFavorito.setTitle("REMOVER", for: .highlighted)
        botaoFavorito.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        botaoFavorito.frame.size = CGSize(width: (ScreenSize.screenWidth / 2), height: (ScreenSize.screenHeight / 8))
        botaoFavorito.backgroundColor = .corPrimaria()
//        botaoFavorito.tintColor = .yellow
        botaoFavorito.layer.borderColor = UIColor.white.cgColor
        botaoFavorito.layer.borderWidth = 1
        botaoFavorito.layer.cornerRadius = 7
//        botaoFavorito.addTarget(self, action: #selector(acaoFavoritar), for: .touchUpOutside)
//        botaoFavorito.center = self.center
        self.alinharBotao()
        return botaoFavorito
    }
    
    public func setupUI(_ delegate: CoinDetalheDelegate, _ id: String) -> String{
        self.favoritoDelegate = delegate
        InfoMoedaAPI().requestInfoMoedas(id: id) { (dadoRetorno) in
            let dado = dadoRetorno[0]
            self.idMoeda = dado.assetID
            self.setValues(dado)
            let favorito = self.verSeFavorito(id)
            self.botao()
        }
        print("--Sou setupUI")
        return self.idMoeda ?? ""
    }
    
    private func setupUIView() {
        print("--Sou setupUIView")
    }
    
    private func buttonAdd(_ button: UIButton?) {
        if let bttn:UIButton = button {
            bttn.addTarget(self, action: #selector(acaoFavoritar), for: .touchUpInside)
            self.viewBotao.addSubview(bttn)
        }
    }
    
    func verSeFavorito(_ id: String) -> Int{
        for moeda in self.moedasFavorito {
            if moeda == id {
                return 1
            }
        }
        return 0
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
    
    private func colorStack() {
        self.stackHeader.backgroundColor = UIColor.corPrimaria()
        self.stackFooter.backgroundColor = UIColor.corSecundaria()
        self.viewBotao.backgroundColor = UIColor.corPrimaria()
    }
    
    private func fontStyle() {
        self.labelValorPrincipal?.font = UIFont.systemFont(ofSize: 30, weight: .light)
    }
    
    private func colorFont() {
        self.labelCoinName?.textColor = UIColor.corTexto()
        self.labelValorPrincipal?.textColor = UIColor.corTexto()
        self.lbStaticVolumesNegociados.textColor = UIColor.corTexto()
        self.lbStaticUltimaHora.textColor = UIColor.corTexto()
        self.lbStaticUltimoMes.textColor = UIColor.corTexto()
        self.lsStaticUltimoAno.textColor = UIColor.corTexto()
        self.labelValorHora?.textColor = UIColor.corTexto()
        self.labelValorMes?.textColor = UIColor.corTexto()
        self.labelValorAno?.textColor = UIColor.corTexto()
    }
    
    private func setValues(_ dado: MoedaInfoElement) {
        self.labelCoinName?.text = dado.assetID
        self.labelValorPrincipal?.text = dado.priceUsd.formatadorDolar(valor: dado.priceUsd)
        self.labelValorHora?.text = dado.volume1HrsUsd.formatadorDolar(valor: dado.volume1HrsUsd)
        self.labelValorMes?.text = dado.volume1DayUsd.formatadorDolar(valor: dado.volume1DayUsd)
        self.labelValorAno?.text = dado.volume1MthUsd.formatadorDolar(valor: dado.volume1MthUsd) // Setado mês, não consta ano na struct
        
    }
    private func setupUICell() {
        //Aqui definir a cor da Stack
        
    }
    @objc func acaoFavoritar() {
        guard let id = idMoeda else { return }
        if let action = self.actionFavorita {
            action()
        } else {
            self.favoritoDelegate?.favoritar(id)
        }
    }
}
