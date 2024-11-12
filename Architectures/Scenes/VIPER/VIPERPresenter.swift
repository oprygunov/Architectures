//
//  VIPERPresenter.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

final class VIPERPresenter {
    var interactor: VIPERInteractorInputProtocol?
    weak var output: VIPERPresenterOutputProtocol?
    var router: VIPERRouterProtocol?
}

extension VIPERPresenter: VIPERPresenterInputProtocol {
    func fetch() {
        interactor?.fetch()
    }
    
    func reload() {
        interactor?.reload()
    }
    
    func close() {
        router?.close()
    }
}

extension VIPERPresenter: VIPERInteractorOutputProtocol {
    func received(result: Result<VIPER.Model, AppError>) {
        switch result {
        case .success(let model):
            output?.setViewModel(model.viewModel())
        case .failure(let error):
            output?.showError(error.localizedDescription)
        }
    }
}

extension VIPER.Model {
    func viewModel() -> VIPER.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}

