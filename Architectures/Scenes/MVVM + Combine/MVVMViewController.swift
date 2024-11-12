//
//  MVVMViewController.swift
//
//
//  Created by Oleg Prygunov on 10.08.2022.
//

import Foundation
import UIKit
import Combine

final class MVVMViewController: UIViewController {
    var viewModel: MVVMViewModelProtocol?
    
    private var cancellables: Set<AnyCancellable> = []

    private lazy var rootView = MVVMView()

    override func loadView() {
        view = rootView

        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                viewModel?
                    .close()
                    .receive(on: DispatchQueue.main)
                    .sink(
                        receiveValue: { [weak self] in
                            self?.navigationController?.popViewController(animated: true)
                        }
                    )
                    .store(in: &cancellables)
            case .reload:
                viewModel?
                    .reload()
                    .receive(on: DispatchQueue.main)
                    .sink(receiveValue: { [weak self] viewModel in
                        self?.rootView.viewModel = viewModel
                    })
                    .store(in: &cancellables)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?
            .fetch()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case let .failure(error) = completion {
                        self?.showError(error: error.localizedDescription)
                    }
                }, receiveValue: { [weak self] viewModel in
                    self?.rootView.viewModel = viewModel
                }
            )
            .store(in: &cancellables)
    }
}
