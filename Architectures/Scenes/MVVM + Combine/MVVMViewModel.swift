//
//  MVVMViewModel.swift
//
//
//  Created by Oleg Prygunov on 10.08.2022.
//

import Foundation
import Combine

final class MVVMViewModel: MVVMViewModelProtocol {
    private var model: MVVM.Model?

    func fetch() -> AnyPublisher<MVVM.RootViewModel?, AppError> {
        let response: MVVM.Model = .init(title: "Test MVVM + Combine", count: 0)
        model = response
        let publisher = Future<MVVM.RootViewModel?, AppError> { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(response.viewModel()))
            }
        }.eraseToAnyPublisher()
        return publisher
    }

    func reload() -> AnyPublisher<MVVM.RootViewModel, Never> {
        guard var model else { return Empty<MVVM.RootViewModel, Never>().eraseToAnyPublisher() }
        model.count += 1
        self.model = model
        let publisher = Just(model.viewModel())
            .eraseToAnyPublisher()
        return publisher
    }

    func close() -> AnyPublisher<Void, Never> {
        return Just(()).eraseToAnyPublisher()
    }
}

extension MVVM.Model {
    func viewModel() -> MVVM.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}

