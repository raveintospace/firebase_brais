//
//  HomePresenter.swift
//  Firebase_Brais
//
//  Created by Uri on 14/1/23.
//  
//

import Foundation

final class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        view?.setupHomeView()
    }
    
    func showLogedView(with email: String, provider: ProviderType) {
        wireFrame?.presentLogedView(from: view!, withEmail: email, withProvider: provider)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
