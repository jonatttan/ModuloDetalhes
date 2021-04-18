//
//  DadosChamadaApi.swift
//  FBSnapshotTestCase
//
//  Created by Jaqueline Bittencourt Santos on 16/04/21.
//

import Foundation
import UIKit
import Alamofire

struct DadosChamadaApi {
    static let urlListaMoedas = "https://rest-sandbox.coinapi.io/v1/assets/"
    static let headers: HTTPHeaders = [
        "X-CoinAPI-Key": "FC08A1F5-7823-40C8-BC82-B4BE39E12796",
        "Accept": "application/json"
    ]
}
