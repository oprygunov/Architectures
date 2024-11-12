//
//  MVPProtocols.swift
//  Architectures
//
//  Created by Oleg Prygunov on 08.08.2022.
//

protocol MVPPresenterProtocol: AnyObject {
    func fetch()
    func reload()
    func close()
}

protocol MVPViewProtocol: AnyObject {
    func fetch(_ viewModel: MVP.RootViewModel)
    func reload(_ viewModel: MVP.RootViewModel)
    func close()
}
