//
//  MainPresenter.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

final class MainPresenter {
    weak var view: MainDisplayLogic?

    // MARK: Initialization
    init(view: MainDisplayLogic) {
        self.view = view
    }
}

// MARK: Implementation of Presenting methods
extension MainPresenter: MainPresentingLogic {
    func present(_ response: Main.Fetch.Response) {
        view?.display(
            Main.Fetch.ViewModel(
                root: response.model?.viewModel() ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }

    func present(_ response: Main.Selected.Response) {
        view?.display(
            Main.Selected.ViewModel(
                route: response.route
            )
        )
    }
}

// MARK: Models to ViewModel conversion
private extension Main.Model {
    func viewModel() -> Main.RootViewModel {
        .init(
            items: items.map { item in
                return item.mappingNameArchitecture()
            }
        )
    }
}

private extension  Main.RootViewModel {
    static var empty: Main.RootViewModel = .init(items: [])
}

private extension Main.Architecture {
    func mappingNameArchitecture() -> String {
        switch self {
        case .mvp:
            return "MVP"
        case .mvcApple:
            return "MVC (Apple)"
        case .mvcTraditional:
            return "MVC Traditional"
        case .mvvmClosure:
            return "MVVM (Closure)"
        case .mvvmCombine:
            return "MVVM (Combine)"
        case .mvvmCoordinator:
            return "MVVM (Coordinator)"
        case .viper:
            return "VIPER"
        case .cleanSwift:
            return "Clean Swift"
        }
    }
}
