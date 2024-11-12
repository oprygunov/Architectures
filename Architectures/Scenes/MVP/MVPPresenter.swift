//
//  MVPPresenter.swift
//  Architectures
//
//  Created by Oleg Prygunov on 08.08.2022.
//

import Foundation

final class MVPPresenter: MVPPresenterProtocol {
    weak var view: MVPViewProtocol?
    private var model: MVP.Model?

    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            //запрос в сеть
            let response: MVP.Model = .init(title: "Test MVP", count: 0)
            self?.model = response
            self?.view?.fetch(response.viewModel())
        }
    }

    func reload() {
        model?.count += 1
        guard let model else { return }
        DispatchQueue.main.async { [weak self] in
            self?.view?.reload(model.viewModel())
        }
    }

    func close() {
        view?.close()
    }
}

extension MVP.Model {
    func viewModel() -> MVP.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}
