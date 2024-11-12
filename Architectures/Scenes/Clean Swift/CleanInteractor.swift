//
//  CleanInteractor.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class CleanInteractor {
    private let presenter: CleanPresentingLogic
    private let worker: CleanWorkingLogic

    private var model: Clean.Model?

    // MARK: Initialization
    init(presenter: CleanPresentingLogic, worker: CleanWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: Implementation of Business logic methods
extension CleanInteractor: CleanBusinessLogic {
    func request(_ request: Clean.Fetch.Request) {
        worker.fetch { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case .success(let model):
                    self.model = model
                    self.presenter.present(Clean.Fetch.Response(model: model))
                case .failure(let error):
                    self.presenter.present(Clean.Fetch.Response(error: error))
                }
            }
        }
    }

    func request(_ request: Clean.Reload.Request) {
        model?.count += 1
        guard let model else { return }
        presenter.present(Clean.Reload.Response(model: model))
    }

    func request(_ request: Clean.Close.Request) {
        presenter.present(Clean.Close.Response())
    }
}

// MARK: Implementation of Data Store for interacting with other scenes
extension CleanInteractor: CleanDataStore {}
