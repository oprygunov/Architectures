//
//  MVVMClosureViewController.swift
//
//
//  Created by Oleg Prygunov on 09.08.2022.
//

import Foundation
import UIKit
import Combine

final class MVVMClosureViewController: UIViewController {
    var viewModel: MVVMClosureViewModelProtocol?

    private lazy var rootView = MVVMClosureView()

    override func loadView() {
        view = rootView

        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                viewModel?.close { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
            case .reload:
                viewModel?.reload { [weak self] result in
                    DispatchQueue.main.async { [weak self] in
                        switch result {
                        case .success(let viewModel):
                            self?.rootView.viewModel = viewModel
                        case .failure(let error):
                            self?.showError(error: error.localizedDescription)
                        }
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetch{ [weak self] result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let viewModel):
                    self?.rootView.viewModel = viewModel
                case .failure(let error):
                    self?.showError(error: error.localizedDescription)
                }
            }
        }
    }
}
