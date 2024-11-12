//
//  MVVMClosureViewModel.swift
//
//
//  Created by Oleg Prygunov on 09.08.2022.
//

import Foundation
import Combine

final class MVVMClosureViewModel: MVVMClosureViewModelProtocol {
    private var model: MVVMClosure.Model?

    func fetch(_ completion: @escaping (Result<MVVMClosure.RootViewModel?, AppError>) -> Void) {
        let response: MVVMClosure.Model = .init(title: "Test MVVM + Closure", count: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.model = response
            completion(.success(response.viewModel()))
        }
    }

    func reload(_ completion: (Result<MVVMClosure.RootViewModel, AppError>) -> Void) {
        model?.count += 1
        guard let model else { return }
        completion(.success(model.viewModel()))
    }

    func close(_ completion: () -> Void) {
        completion()
    }
}

extension MVVMClosure.Model {
    func viewModel() -> MVVMClosure.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}
