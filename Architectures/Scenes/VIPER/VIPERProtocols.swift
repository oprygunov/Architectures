//
//  VIPERProtocols.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

protocol VIPERPresenterInputProtocol: AnyObject {
    func fetch()
    func reload()
    func close()
}

protocol VIPERInteractorInputProtocol: AnyObject {
    func fetch()
    func reload()
}

protocol VIPERInteractorOutputProtocol: AnyObject {
    func received(result: Result<VIPER.Model, AppError>)
}

protocol VIPERPresenterOutputProtocol: AnyObject {
    func setViewModel(_ viewModel: VIPER.RootViewModel)
    func showError(_ error: String)
}

protocol VIPERRouterProtocol: AnyObject {
    func close()
}


