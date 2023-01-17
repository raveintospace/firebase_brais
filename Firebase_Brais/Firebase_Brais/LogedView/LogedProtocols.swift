//
//  LogedProtocols.swift
//  Firebase_Brais
//
//  Created by Uri on 17/1/23.
//  
//

import Foundation
import UIKit

protocol LogedViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LogedPresenterProtocol? { get set }
    func setupLogedView()
}

protocol LogedWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createLogedModule(email: String, provider: ProviderType) -> UIViewController
}

protocol LogedPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LogedViewProtocol? { get set }
    var interactor: LogedInteractorInputProtocol? { get set }
    var wireFrame: LogedWireFrameProtocol? { get set }
    var emailReceived: String? { get set }
    var providerReceived: ProviderType? { get set }
    
    func viewDidLoad()
}

protocol LogedInteractorOutputProtocol {
// INTERACTOR -> PRESENTER
}

protocol LogedInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LogedInteractorOutputProtocol? { get set }
    var localDatamanager: LogedLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: LogedRemoteDataManagerInputProtocol? { get set }
}

protocol LogedDataManagerInputProtocol {
    // INTERACTOR -> DATAMANAGER
}

protocol LogedRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: LogedRemoteDataManagerOutputProtocol? { get set }
}

protocol LogedRemoteDataManagerOutputProtocol {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol LogedLocalDataManagerInputProtocol {
    // INTERACTOR -> LOCALDATAMANAGER
}
