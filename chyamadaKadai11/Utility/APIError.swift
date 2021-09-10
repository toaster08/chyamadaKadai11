//
//  APIError.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/10.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case invalidURL
    case invalidResponse
    case converting
    case unknown

    var description: String {
        switch self {
        case .invalidURL: return "無効なURLです"
        case .invalidResponse: return "無効なレスポンスです"
        case .converting:return "変換できません"
        case .unknown: return "不明なエラーです"
        }
    }
}
