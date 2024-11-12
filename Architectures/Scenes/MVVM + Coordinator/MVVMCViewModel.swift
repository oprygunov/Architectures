//
//  MVVMCViewModel.swift
//
//
//  Created by Oleg Prygunov on 16.08.2022.
//

import Foundation
import Combine

final class MVVMCViewModel: MVVMCViewModelProtocol {
    private var model: MVVMC.Model?

    func fetch(_ completion: @escaping (Result<MVVMC.RootViewModel?, AppError>) -> Void) {
        let response: MVVMC.Model = .init(title: "Test MVVM + Coordinator", count: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.model = response
            completion(.success(response.viewModel()))
        }
    }

    func reload(_ completion: (Result<MVVMC.RootViewModel, AppError>) -> Void) {
        model?.count += 1
        guard let model else { return }
        completion(.success(model.viewModel()))
    }

    func close(_ completion: () -> Void) {
        completion()
    }
}

extension MVVMC.Model {
    func viewModel() -> MVVMC.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}
