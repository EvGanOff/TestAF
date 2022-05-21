//
//  URLConfiration.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/13/22.
//

import Foundation

enum MarvelAccount {
    static let timestamp = Date.timeIntervalSinceReferenceDate
    static let serverURL = "https://gateway.marvel.com:443"
    static let requestURL = "/v1/public/characters"
    static let publicKey = "830eadcfb11613a488cc4415277ea198"
    static let privateKey = "a795fbbc1f083e9a3f9000ba2b03198a02d3143a"
}

class URLConfiration {
    func getURL() -> String {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gateway.marvel.com"
        urlComponents.path = "/v1/public/characters"
        urlComponents.queryItems = [ // add item for special herous
            URLQueryItem(name: "ts", value: String(MarvelAccount.timestamp)),
            URLQueryItem(name: "apikey", value: MarvelAccount.publicKey),
            URLQueryItem(name: "hash", value: (String(MarvelAccount.timestamp) + MarvelAccount.privateKey + MarvelAccount.publicKey).MD5())]
        
        return urlComponents.url?.absoluteString ?? "something was wrong"
    }
}
