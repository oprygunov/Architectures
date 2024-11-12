//
//  MainInteractor.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class MainInteractor {
    private let presenter: MainPresentingLogic
    private let worker: MainWorkingLogic

    private var model: Main.Model?

    // MARK: Initialization
    init(presenter: MainPresentingLogic, worker: MainWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: Implementation of Business logic methods
extension MainInteractor: MainBusinessLogic {
    func request(_ request: Main.Fetch.Request) {
        worker.fetch { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case .success(let model):
                    self.model = model
                    self.presenter.present(Main.Fetch.Response(model: model))
                case .failure(let error):
                    self.presenter.present(Main.Fetch.Response(error: error))
                }
            }
        }
    }

    func request(_ request: Main.Selected.Request) {
        guard let route = model?.items[request.index] else { return }
        presenter.present(Main.Selected.Response(route: route))
    }
}

// MARK: Implementation of Data Store for interacting with other scenes
extension MainInteractor: MainDataStore {}
