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
    
    var email: String?
    var provider: ProviderType?
    let defaults = UserDefaults.standard
    
    func saveUserData(email: String, provider: ProviderType) {
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        defaults.synchronize()
        print("data saved")
        print(email)
        print(provider)
    }
    
    func removeUserData() {
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        print("data removed")
        print(email)
        print(provider)
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}
