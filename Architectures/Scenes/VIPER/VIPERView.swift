//
//  VIPERView.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

import UIKit

final class VIPERView: UIView {
    enum Action {
        case close
        case reload
    }
    var actionHandler: (Action) -> Void = { _ in }

    var viewModel: VIPER.RootViewModel? {
        didSet {
            guard let viewModel else { return }
            titleLabel.text = viewModel.title
            countLabel.text = viewModel.count
        }
    }

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()

    private let countLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 12)
        return view
    }()

    private lazy var reloadButton: UIButton = {
        let view = UIButton()
        view.setTitle("Reload", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .orange
        view.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.actionHandler(.reload)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()

    private lazy var closeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.actionHandler(.close)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, countLabel, reloadButton, closeButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    init() {
        super.init(frame: .zero)
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
        stackView.pinToSuperview(left: 20, top: 20, right: 20, bottom: 50)
    }
}
