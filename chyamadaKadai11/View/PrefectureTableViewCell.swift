//
//  PrefectureTableViewCell.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/08.
//

import UIKit

final class PrefectureTableViewCell: UITableViewCell {
    static let nibCellName = "PrefectureTableViewCell"
    static let nibId = "Cell"

    @IBOutlet private weak var prefectureNameLabel: UILabel!

    func configure(prefecture: Prefecture, row: Int) {
        prefectureNameLabel.text = prefecture.name
    }
}
