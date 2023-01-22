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
    
    let defaults = UserDefaults.standard
    var email: String?
    var provider: ProviderType?
    var dataStored: Bool = false
    
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
            print("checking data stored")
            if let email = email, let provider = provider {
                print(email)
                print(provider)
                presenter?.interactorPushDataToPresenter(email: email, provider: provider)
            }
        } else {
            print("no data stored")
            presenter?.interactorNoDataToPresenter()
        }
        
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}
