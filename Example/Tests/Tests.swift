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
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    func testInteface() {
        func spec() {
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
    
}
