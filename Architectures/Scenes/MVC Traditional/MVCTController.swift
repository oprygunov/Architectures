//
//  MVCTController.swift
//
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import UIKit

final class MVCTController: UIViewController {
    private var model: MVCT.Model?
    private lazy var rootView = MVCTView()

    override func loadView() {
        view = rootView
        rootView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }

    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            //запрос в сеть
            let response: MVCT.Model = .init(title: "Test MVC", count: 0)
            self?.model = response
            self?.updateView()
        }
    }

    func updateView() {
        guard let model else { return }
        rootView.set(title: model.title, count: "Count reload: \(model.count)")
    }
}

extension MVCTController: MVCTViewDelegate {
    func didPressReload() {
        model?.count += 1
        updateView()
    }
    
    func didPressClose() {
        navigationController?.popViewController(animated: true)
    }
}
