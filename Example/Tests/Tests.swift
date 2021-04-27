import XCTest
import ModuloDetalhes
import Quick
import Nimble
import Nimble_Snapshots


class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testInteface() {
        func spec() {
            describe("CoinDetalheUIView") {
                var view: CoinDetalheUIView!
                beforeEach {
                    view = CoinDetalheUIView.fromNib()
                }
                it("Coin View UI Spec") {
    //                expect(view) == recordSnapshot()
                    expect(view) == snapshot()
                }
            }
        }
    }
    func testSeRetornaTituloRemover() {
        let titulo = CoinDetalheUIView().configuraTituloBotao(true)
        XCTAssertEqual("REMOVER", titulo)
    }
    func testSeRetornaTituloAdicionar() {
        let titulo = CoinDetalheUIView().configuraTituloBotao(false)
        XCTAssertEqual("ADICIONAR" , titulo)
    }
}
