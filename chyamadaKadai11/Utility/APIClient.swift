//
//  APIClient.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/08.
//

import Foundation

final class APIClientMock: APIClientProtocol {
    func getPrefecture(completion: @escaping ((Result<[Prefecture], Error>) -> Void)) {
        let result: [Prefecture] = [
            Prefecture(name: "北海道"),
            Prefecture(name: "東京"),
            Prefecture(name: "沖縄")
        ]

        completion(.success(result))
    }
}

final class APIClient: APIClientProtocol {
    func getPrefecture(completion: @escaping ((Result<[Prefecture], Error>) -> Void)) {
        let urlString = "ここに実際のURLを記入する"
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.addValue("APIキーを入力する", forHTTPHeaderField: "X-API-KEY" )
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil { return }

            guard let data = data else {
                completion(.failure(APIError.invalidResponse))
                return
            }

            guard let result = try? JSONDecoder().decode(PrefectureModel.self, from: data) else {
                completion(.failure(APIError.converting))
                return
            }

            completion(.success(result.prefecture))
        }
        task.resume()
    }
}

private struct PrefectureModel: Decodable {
    var prefecture: [Prefecture] = []

    enum CodingKeys: String, CodingKey {
        case prefecture = "result"
    }
}
