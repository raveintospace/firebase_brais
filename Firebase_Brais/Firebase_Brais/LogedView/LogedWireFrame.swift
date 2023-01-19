//
//  LogedWireFrame.swift
//  Firebase_Brais
//  https://youtu.be/UFpzBJfAtFw - minut 13 - dijous 19
//  Created by Uri on 17/1/23.
//  
//

import Foundation
import UIKit

final class LogedWireFrame: LogedWireFrameProtocol {
    
    static func createLogedModule(email: String, provider: ProviderType) -> UIViewController {
        let view = LogedView()
        let presenter: LogedPresenterProtocol & LogedInteractorOutputProtocol = LogedPresenter()
        let interactor: LogedInteractorInputProtocol & LogedRemoteDataManagerOutputProtocol = LogedInteractor()
        let localDataManager: LogedLocalDataManagerInputProtocol = LogedLocalDataManager()
        let remoteDataManager: LogedRemoteDataManagerInputProtocol = LogedRemoteDataManager()
        let wireFrame: LogedWireFrameProtocol = LogedWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.emailReceived = email
        presenter.providerReceived = provider
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
}
