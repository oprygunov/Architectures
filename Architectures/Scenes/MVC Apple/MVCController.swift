//
//  MVCController.swift
//
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import UIKit

final class MVCController: UIViewController {
    private var model: MVC.Model?
    private lazy var rootView = MVCView()

    override func loadView() {
        view = rootView

        rootView.actionHandler = { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                close()
            case .reload:
                reload()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
}

extension MVCController: MVCControllerProtocol {
    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            //запрос в сеть
            let response: MVC.Model = .init(title: "Test MVC", count: 0)
            self?.model = response
            self?.rootView.viewModel = self?.model?.viewModel()
        }
    }
    
    func close() {
        navigationController?.popViewController(animated: true)
    }
    
    func reload() {
        self.model?.count += 1
        DispatchQueue.main.async { [weak self] in
            self?.rootView.viewModel = self?.model?.viewModel()
        }
    }
}

extension MVC.Model {
    func viewModel() -> MVC.RootViewModel {
        return .init(
            title: title,
            count: "Count reload: \(count)"
        )
    }
}
