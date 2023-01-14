//
//  HomeInteractor.swift
//  Firebase_Brais
//
//  Created by Uri on 14/1/23.
//  
//

import Foundation

final class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
