//
//  PrefectureModel.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/08.
//

import Foundation

struct Prefecture: Decodable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name = "prefName"
    }
}
