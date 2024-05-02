//
//  TechieDetailViewController.swift
//  Techie Butler
//
//  Created by Akhil Jain on 02/05/24.
//

import Foundation
import UIKit

class TechieDetailViewController: UIViewController{
    
    private var titleLabel = UILabel()
    private var bodyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemPink
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bodyLabel.heightAnchor.constraint(equalToConstant: 200),
            
            
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24.0)
    }
    
    
    
    func configure(data: TechieModel){
        self.titleLabel.text = data.title
        self.bodyLabel.text = data.body
    }
    
}
