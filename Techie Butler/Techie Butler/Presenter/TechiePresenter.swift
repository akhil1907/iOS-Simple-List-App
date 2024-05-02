//
//  TechiePresenter.swift
//  Techie Butler
//
//  Created by Akhil Jain on 02/05/24.
//

import Foundation

protocol TechiePresenterInterface{
    func fetchInitialData()
    func fetchDataForRequestedPage(page: Int)
}

protocol TechiePresenterDelegate: AnyObject {
    func didRecieveInitialData()
    func didRecieveDataForRequestedPage(data: [TechieModel])
}

class TechiePresenter: TechieViewInterface, TechieInteractorDelegate{
   
    
    var interactor: TechiePresenterInterface?
    weak var delegate: TechiePresenterDelegate?
    
    public func configureDependencies(interactor: TechiePresenterInterface){
        self.interactor = interactor
        fetchInitialData()
    }
    
    func fetchInitialData() {
        interactor?.fetchInitialData()
    }
    
    func fetchDataForRequestedPage(page: Int) {
        interactor?.fetchDataForRequestedPage(page: page)
    }
    
    
    
    //MARK: TechieInteractorDelegate Methods
    
    func didRecieveInitialData() {
        delegate?.didRecieveInitialData()
    }
    
    func didRecieveDataForRequestedPage(data: [TechieModel]) {
        delegate?.didRecieveDataForRequestedPage(data: data)
    }
}
