//
//  CleanViewController.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class CleanViewController: UIViewController {
    var interactor: CleanBusinessLogic?
    var router: CleanRoutingLogic?

    private lazy var rootView = CleanView()

    override func loadView() {
        view = rootView
        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                self.interactor?.request(Clean.Close.Request())
            case .reload:
                self.interactor?.request(Clean.Reload.Request())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.request(Clean.Fetch.Request())
    }
}

// MARK: Implementation of Viewing methods. Update view model or call router.
extension CleanViewController: CleanDisplayLogic {
    func display(_ viewModel: Clean.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: Clean.Reload.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: Clean.Close.ViewModel) {
        router?.close()
    }
}
