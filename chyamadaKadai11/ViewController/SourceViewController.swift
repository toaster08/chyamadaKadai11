//
//  ViewController.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/07.
//

import UIKit

protocol APIClientProtocol {
    func getPrefecture(completion: @escaping ((Result<[Prefecture], Error>) -> Void))
}

final class SourceViewController: UIViewController {
    @IBOutlet private var prefectureNameLabel: UILabel!

    @IBAction private func exit(segue: UIStoryboardSegue) { }

    @IBAction private func exitDone(segue: UIStoryboardSegue) {
        guard let sourceViewController = segue.source as? SelectPrefectureViewController,
              let selectedPrefecture = sourceViewController.selectedPrefecture else { return }

        configure(prefecture: selectedPrefecture)
    }

    private func configure(prefecture: Prefecture) {
        prefectureNameLabel.text = prefecture.name
    }
}
