//
//  PrefectureTableViewCell.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/08.
//

import UIKit

final class PrefectureTableViewCell: UITableViewCell {
    static let NibCELLNAME = "PrefectureTableViewCell"
    static let NibID = "Cell"

    @IBOutlet private weak var prefectureNameLabel: UILabel!

    func configure(prefecture: Prefecture, row: Int) {
        prefectureNameLabel.text = prefecture.name
    }
}

/*Feedback
 　CELLに関することはViewにまとめる
 　CELLのNameやIdに関しては定数化しておくことで目的が分かりやすい
 　またその命名規則はスネークケースで複数の単語が合わさる場合には_アンダーバーで区切られる
 　が、これはSwiftLintではviolationとして弾かれる

 　通常の定数Letはインスタンスプロパティであるため直接参照できないが
 staticとすることで型に紐づくタイププロパティとなり直接参照することができる
 */
