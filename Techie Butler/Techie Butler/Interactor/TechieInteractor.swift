//
//  TechieInteractor.swift
//  Techie Butler
//
//  Created by Akhil Jain on 02/05/24.
//

import Foundation


protocol TechieInteractorDelegate: AnyObject {
    func didRecieveInitialData()
    func didRecieveDataForRequestedPage(data: [TechieModel])
}


class TechieInteractor: TechiePresenterInterface{
    
    var techieArray: [TechieModel] = []
    weak var delegate: TechieInteractorDelegate?
    
    
    
    
    func fetchInitialData(){
        TechieButlerApiService().fetchData { data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.techieArray = self.computeHeavyLogic(data: data)
                    self.delegate?.didRecieveInitialData()
                }
            }
        }
    }
    
    func fetchDataForRequestedPage(page: Int) {
        let pageSize = 10
        let startIndex = (page - 1) * pageSize
        let endIndex = min(startIndex + pageSize, techieArray.count)
            
        guard startIndex < techieArray.count else {
            return
        }
            
        delegate?.didRecieveDataForRequestedPage(data: Array(techieArray[startIndex..<endIndex]))
    }
    
    
    //MARK: Helper Methods
    
    private func computeHeavyLogic(data: [TechieModel]) -> [TechieModel] {
        
        var result: [TechieModel] = []
        
        for post in data {
            if(post.id % 10 == 1){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 2){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 3){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 4){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 5){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 6){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 7){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 8){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 9){
                result.append(post)
            }
        }
        
        for post in data {
            if(post.id % 10 == 0){
                result.append(post)
            }
        }
        
        return result
    }
    
}

