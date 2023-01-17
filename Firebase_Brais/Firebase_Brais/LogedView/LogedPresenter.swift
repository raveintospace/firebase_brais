//
//  LogedPresenter.swift
//  Firebase_Brais
//
//  Created by Uri on 17/1/23.
//  
//

import Foundation

final class LogedPresenter: LogedPresenterProtocol  {
    
    // MARK: Properties
    weak var view: LogedViewProtocol?
    var interactor: LogedInteractorInputProtocol?
    var wireFrame: LogedWireFrameProtocol?
    var emailReceived: String?
    var providerReceived: ProviderType?
    
    func viewDidLoad() {
        view?.setupLogedView()
    }
}

extension LogedPresenter: LogedInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
