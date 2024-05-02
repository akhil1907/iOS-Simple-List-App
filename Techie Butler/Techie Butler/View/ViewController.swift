//
//  ViewController.swift
//  Techie Butler
//
//  Created by Akhil Jain on 01/05/24.
//

import UIKit

protocol TechieViewInterface{
    func fetchInitialData()
    func fetchDataForRequestedPage(page: Int)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TechiePresenterDelegate {
    
    
    var techieArray: [TechieModel]?
    var presenter = TechiePresenter()
    var interactor = TechieInteractor()
    var currentPage = 0
    
    private var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var techieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActivityIndicator()
        techieTableView.delegate = self
        techieTableView.dataSource = self
        techieTableView.register(UINib(nibName: "TechieTableViewCell", bundle: nil), forCellReuseIdentifier: "TechieTableViewCell") 
        presenter.delegate = self
        interactor.delegate = presenter
        presenter.configureDependencies(interactor: interactor)
        
        // Do any additional setup after loading the view.
    }
    
    private func setUpActivityIndicator(){
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techieArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TechieTableViewCell", for: indexPath) as? TechieTableViewCell{
            if let data = techieArray?[indexPath.row] {
                cell.configure(data: data)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let requestedPage = ceil(scrollView.contentOffset.y / (800.0))
        
        if (requestedPage >= CGFloat(currentPage)){
            techieTableView.tableFooterView = LoaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
            activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                self.loadNextPage()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = techieArray?[indexPath.row]{
            let viewController = TechieDetailViewController()
            viewController.configure(data: data)
            present(viewController, animated: true)
        }
    }
    
    private func loadNextPage(){
        currentPage += 1
        if currentPage > 10{
            activityIndicator.stopAnimating()
            return
        }
        presenter.fetchDataForRequestedPage(page: currentPage)
    }
    
    
    //MARK: TechiePresenterDelegate Methods
    
    func didRecieveInitialData() {
        loadNextPage()
    }
    
    func didRecieveDataForRequestedPage(data: [TechieModel]) {
        if var techieArray = techieArray {
            self.techieArray?.append(contentsOf: data)
        }else{
            self.techieArray = data
        }
        DispatchQueue.main.async {
            self.techieTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
       
    }
}

