//
//  Detalhes.swift
//  ModuloDetalhes_Tests
//
//  Created by Jonattan Moises Sousa on 26/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import ModuloDetalhes

class DetalhesTests: QuickSpec {
    let mensagem = XCTestExpectation(description: "manooo")
    override func spec() {
        describe("CoinDetalheUIView") {
            
            var view: CoinDetalheUIView!
            
            beforeEach {
                // view = Bundle.main.loadNibNamed("CoinDetalheUIView", owner: nil, options: nil) as! CoinDetalheUIView
                view = CoinDetalheUIView.fromNib()
                //self.wait(for: [self.mensagem], timeout: 2.30)
            }
            it("Coin View UI Spec") {
//                expect(view) == recordSnapshot()
                expect(view) == snapshot()
            }
        }
    }
}
