//
//  MVPViewController.swift
//  Architectures
//
//  Created by Oleg Prygunov on 08.08.2022.
//

import Foundation
import UIKit

final class MVPViewController: UIViewController {
    var presenter: MVPPresenterProtocol?

    private lazy var rootView = MVPView()

    override func loadView() {
        view = rootView
        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                presenter?.close()
            case .reload:
                presenter?.reload()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetch()
    }
}

extension MVPViewController: MVPViewProtocol {
    func fetch(_ viewModel: MVP.RootViewModel) {
        rootView.viewModel = viewModel
    }

    func reload(_ viewModel: MVP.RootViewModel) {
        rootView.viewModel = viewModel
    }

    func close() {
        navigationController?.popViewController(animated: true)
    }
}
