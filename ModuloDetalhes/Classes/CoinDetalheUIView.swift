//
//  CoinDetalheUIView.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 15/04/21.
//

import UIKit
import ModuloCommons
import Alamofire
import AlamofireImage

struct ScreenSize {
    static let screenHeight = UIScreen.main.bounds.height / 2
    static let screenWidth = UIScreen.main.bounds.width
}

public class CoinDetalheUIView: UIView {
    
    //MARK: - Variáveis
    var favoritoDelegate: CoinDetalheDelegate?
    var actionFavorita: (() -> Void)?
    var actionVoltar: (() -> Void)?
    var buttonFavorito: UIButton!
    public var idMoeda: String?
    public var seFavorito = false
    
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
    override public func awakeFromNib() {
        super.awakeFromNib()
        colorStack()
        colorFont()
        fontStyle()
        self.buttonFavorito = botao()
    }
    override public func layoutSubviews() { // Acionado no inicio e no retorno quando minimizado
        super.layoutSubviews()
        buttonFavorito.setTitle(self.configuraTituloBotao(self.seFavorito), for: .normal)
        self.viewBotao.addSubview(buttonFavorito)
    }
    public func setupUI(_ delegate: CoinDetalheDelegate) {
        self.favoritoDelegate = delegate
        guard let id = self.idMoeda else { return }
        InfoMoedaAPI().requestInfoMoedas(id: id) { (dadoRetorno) in
            let dado = dadoRetorno[0]
            self.setValues(dado)
            self.buttonFavorito = self.botao()
        }
    }
    private func setValues(_ dado: MoedaInfoElement) {
        guard let imagem = DataImage().requestImageUrl(dado.idIcon) else { return }
        self.imageCoin?.af.setImage(withURL: imagem)
        self.labelCoinName?.text = dado.assetID
        self.labelValorPrincipal?.text = dado.priceUsd.formatadorDolar(valor: dado.priceUsd)
        self.labelValorHora?.text = dado.volume1HrsUsd.formatadorDolar(valor: dado.volume1HrsUsd)
        self.labelValorMes?.text = dado.volume1DayUsd.formatadorDolar(valor: dado.volume1DayUsd)
        self.labelValorAno?.text = dado.volume1MthUsd.formatadorDolar(valor: dado.volume1MthUsd)
        // Setado mês, não consta ano na struct
    }
    @objc func acaoFavoritar() {
        guard let id = self.idMoeda else { return }
        if let action = self.actionFavorita {
            action()
        } else {
            self.favoritoDelegate?.favoritar(id, self.seFavorito)
            self.seFavorito = !self.seFavorito
            setTitleRuntime()
        }
    }
    @IBAction func bttnVoltar(_ sender: UIButton) {
        if let actionReturn = self.actionVoltar {
            actionReturn()
        } else {
            self.favoritoDelegate?.voltar()
        }
    }
    
}
