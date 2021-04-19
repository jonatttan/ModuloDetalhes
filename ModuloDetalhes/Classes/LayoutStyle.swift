//
//  LayoutStyle.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 19/04/21.
//

import Foundation

extension CoinDetalheUIView {
    
    func colorStack() {
        self.stackHeader.backgroundColor = UIColor.corPrimaria()
        self.stackFooter.backgroundColor = UIColor.corSecundaria()
        self.viewBotao.backgroundColor = UIColor.corPrimaria()
    }
    func fontStyle() {
        self.labelValorPrincipal?.font = UIFont.systemFont(ofSize: 30, weight: .light)
    }
    func colorFont() {
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
    
}
