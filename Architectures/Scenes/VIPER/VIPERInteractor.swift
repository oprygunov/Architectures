//
//  VIPERInteractor.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

import UIKit

final class VIPERInteractor {
    weak var output: VIPERInteractorOutputProtocol?
    private var model: VIPER.Model?
}

extension VIPERInteractor: VIPERInteractorInputProtocol {
    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            //запрос в сеть
            let response: VIPER.Model = .init(title: "Test VIPER", count: 0)
            self?.model = response
            self?.output?.received(result: .success(response))
        }
    }
    
    func reload() {
        model?.count += 1
        guard let model else { return }
        DispatchQueue.main.async { [weak self] in
            self?.output?.received(result: .success(model))
        }
    }
}
