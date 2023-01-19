//
//  LogedInteractor.swift
//  Firebase_Brais
//
//  Created by Uri on 17/1/23.
//  
//

import Foundation

class LogedInteractor: LogedInteractorInputProtocol {

    // MARK: Properties
    var presenter: LogedInteractorOutputProtocol?
    var localDatamanager: LogedLocalDataManagerInputProtocol?
    var remoteDatamanager: LogedRemoteDataManagerInputProtocol?

}

extension LogedInteractor: LogedRemoteDataManagerOutputProtocol {
    
}
