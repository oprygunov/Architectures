//
//  MainViewController.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: MainRoutingLogic?

    private lazy var rootView = MainView()

    override func loadView() {
        view = rootView
        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .selected(let index):
                self.interactor?.request(Main.Selected.Request(index: index))
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.request(Main.Fetch.Request())
    }
}

// MARK: Implementation of Viewing methods. Update view model or call router.
extension MainViewController: MainDisplayLogic {
    func display(_ viewModel: Main.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: Main.Selected.ViewModel) {
        switch viewModel.route {
        case .mvp:
            router?.showMVP()
        case .mvcApple:
            router?.showMVCApple()
        case .mvcTraditional:
            router?.showMVCTraditional()
        case .mvvmClosure:
            router?.showMVVMClosure()
        case .mvvmCombine:
            router?.showMVVMCombine()
        case .mvvmCoordinator:
            router?.showMVVMCoordinator()
        case .viper:
            router?.showVIPER()
        case .cleanSwift:
            router?.showCleanSwift()
        }
    }
}
