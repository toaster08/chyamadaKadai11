//
//  SelectPrefectureViewController.swift
//  chyamadaKadai11
//
//  Created by toaster on 2021/09/08.
//

import UIKit

final class SelectPrefectureViewController: UIViewController {
    let nibCellName = "PrefectureTableViewCell"
    let nibId = "Cell"

    @IBOutlet private weak var prefectureTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: nibCellName, bundle: nil)
            prefectureTableView.register(nib, forCellReuseIdentifier: nibId)
        }
    }

    private var prefectures: [Prefecture] = []
    private(set) var selectedPrefecture: Prefecture?

    override func viewDidLoad() {
        super.viewDidLoad()
        prefectureTableView.delegate = self
        prefectureTableView.dataSource = self

        let apiClient: APIClientProtocol = APIClientMock()

        apiClient.getPrefecture { result in
            switch result {
            case .success(let prefectures):
                DispatchQueue.main.async { [weak self] in
                    self?.prefectures = prefectures
                    self?.prefectureTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SelectPrefectureViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = prefectureTableView.dequeueReusableCell(withIdentifier: nibId, for: indexPath)
                as? PrefectureTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }

        let prefecture = prefectures[indexPath.row]
        cell.configure(prefecture: prefecture, row: indexPath.row)
        return cell
    }
}

extension SelectPrefectureViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPrefecture = prefectures[indexPath.row]
        performSegue(withIdentifier: "exitDone", sender: nil)
    }
}
