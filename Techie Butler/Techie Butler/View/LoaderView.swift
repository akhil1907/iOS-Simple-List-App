//
//  LoaderView.swift
//  Techie Butler
//
//  Created by Akhil Jain on 02/05/24.
//

import Foundation
import UIKit

class LoaderView: UIView{
    
    private var activityIndicatorView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityIndicatorView.frame = self.frame
        addSubview(activityIndicatorView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startAnimating(){
        activityIndicatorView.startAnimating()
    }
    
    public func stopAnimating(){
        activityIndicatorView.stopAnimating()
    }
    
}
