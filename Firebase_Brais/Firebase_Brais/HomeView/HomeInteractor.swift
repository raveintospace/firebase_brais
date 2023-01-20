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
    var dataStored: Bool = false
    let defaults = UserDefaults.standard
    
    func saveUserData(email: String, provider: ProviderType) {
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        dataStored = true
        defaults.synchronize()
        print("data saved")
        print(email)
        print(provider)
        print(dataStored)
    }
    
    func removeUserData() {
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        dataStored = false
        defaults.synchronize()
        print("data removed")
        print(email ?? "no data")
        print(provider ?? "empty")
        print(dataStored)
    }
    
    func checkUserData() {
        if dataStored {
            // send de data stored to presenter
        } else {
            // send an empty func to presenter
        }
        
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}
