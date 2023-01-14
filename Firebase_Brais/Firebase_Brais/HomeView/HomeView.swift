//
//  HomeView.swift
//  Firebase_Brais
//
//  Created by Uri on 14/1/23.
//  
//

import Foundation
import UIKit

final class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 236/255, green: 239/255, blue: 241/255, alpha: 1)
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
