//
//  VIPERViewController.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

import Foundation
import UIKit

final class VIPERViewController: UIViewController {
    var presenter: VIPERPresenterInputProtocol?

    private lazy var rootView = VIPERView()

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

extension VIPERViewController: VIPERPresenterOutputProtocol {
    func setViewModel(_ viewModel: VIPER.RootViewModel) {
        rootView.viewModel = viewModel
    }
    
    func showError(_ error: String) {
        showError(error: error)
    }
}
