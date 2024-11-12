//
//  MainView.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class MainView: UIView {
    enum Action {
        case selected(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    var viewModel: Main.RootViewModel? {
        didSet {
            guard let viewModel else { return }
            viewModel.items.enumerated().forEach { index, item in
                stackView.addArrangedSubview(createButton(item, index))
            }
        }
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContent()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContent() {
        backgroundColor = .white
        addSubview(stackView)
    }

    func setupLayout() {
        stackView.centerXAnchor ~= centerXAnchor
        stackView.leftAnchor <= leftAnchor + 10
        stackView.centerYAnchor ~= centerYAnchor
        stackView.topAnchor >= topAnchor + 50
    }

    private func createButton(_ title: String, _ index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self else { return }
                    self.actionHandler(.selected(index))
                }
            ),
            for: .touchUpInside
        )
        return button
    }
}
