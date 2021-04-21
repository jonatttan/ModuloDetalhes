//
//  DadosChamadaApi.swift
//  FBSnapshotTestCase
//
//  Created by Jaqueline Bittencourt Santos on 16/04/21.
//

import Foundation
import UIKit
import Alamofire

public struct DadosChamadaApi {
    public static let urlListaMoedas = "https://rest.coinapi.io/v1/assets/"
    public static let urlImagem = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/"
//    public static let urlListaMoedas = "https://282f4580-2c94-4065-8554-3397e262c39f.mock.pstmn.io/primeiratela/"
    public static let headers: HTTPHeaders = [
        "X-CoinAPI-Key": "FC08A1F5-7823-40C8-BC82-B4BE39E12796",
        "Accept": "application/json"
    ]
}
