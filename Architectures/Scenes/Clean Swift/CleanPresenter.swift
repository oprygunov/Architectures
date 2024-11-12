//
//  CleanPresenter.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

final class CleanPresenter {
    weak var view: CleanDisplayLogic?

    // MARK: Initialization
    init(view: CleanDisplayLogic) {
        self.view = view
    }
}

// MARK: Implementation of Presenting methods
extension CleanPresenter: CleanPresentingLogic {
    func present(_ response: Clean.Fetch.Response) {
        view?.display(
            Clean.Fetch.ViewModel(
                root: response.model?.viewModel() ?? .init(title: "", count: ""),
                error: response.error?.localizedDescription
            )
        )
    }

    func present(_ response: Clean.Reload.Response) {
        view?.display(
            Clean.Reload.ViewModel(
                root: response.model.viewModel()
            )
        )
    }

    func present(_ response: Clean.Close.Response) {
        view?.display(
            Clean.Close.ViewModel()
        )
    }
}

// MARK: Models to ViewModel conversion
private extension Clean.Model {
    func viewModel() -> Clean.RootViewModel {
        .init(title: title, count: "Count reload: \(count)")
    }
}
