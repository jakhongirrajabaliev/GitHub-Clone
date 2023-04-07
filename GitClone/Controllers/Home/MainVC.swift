//
//  MainVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

class MainVC: UIViewController{
 
    
    var btnsSetup : [BtnsModel] = [
        BtnsModel(btnImage: UIImage(systemName: "circle.circle.fill")!, name: "Issues", btnBacground: .systemGreen),
        BtnsModel(btnImage: UIImage(systemName: "line.3.crossed.swirl.circle.fill")!, name: "Pull Requiest", btnBacground: .systemBlue),
        BtnsModel(btnImage: UIImage(systemName: "message")!, name: "Disscusions", btnBacground: .systemIndigo),
        BtnsModel(btnImage: UIImage(systemName: "bus.doubledecker")!, name: "Repositories", btnBacground: .systemGray2),
        BtnsModel(btnImage: UIImage(systemName: "building")!, name: "Organizations", btnBacground: .systemOrange),
        BtnsModel(btnImage: UIImage(systemName: "star")!, name: "Started", btnBacground: .systemYellow)
    ]
    
    var user : [Repos] = []

    var searchController = UISearchController()
    var tableView : UITableView = UITableView()
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        setupNavBar()
        tableViewSetup()
    }
    
    

     func setupNavBar() {
        
         let offset = -(searchController.searchBar.frame.height)
         tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
         navigationItem.searchController = searchController
         searchController.searchBar.placeholder = "Username or email"
         
         navigationController?.navigationBar.prefersLargeTitles = true
         title = "Home"

         navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.delegate = self
        searchController.searchBar.returnKeyType = .search
        searchController.searchBar.delegate = self
        
        tableView.register(MainTVC.self, forCellReuseIdentifier: "MainTVC")
        tableView.register(SearchTVC.self, forCellReuseIdentifier: "SearchTVC")
        
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }

  
  
}


//MARK: - TableView delegate & datasource
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return user.count
        } else {
            return btnsSetup.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearch {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTVC", for: indexPath) as! SearchTVC
            cell.updateCell(user: user[indexPath.row], userName: searchController.searchBar.text!)
             cell.cellSetup()
            
             return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVC", for: indexPath) as! MainTVC
             cell.updateCell(info: btnsSetup[indexPath.row])
             cell.setupView()
             return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearch {
            
        } else {
            if indexPath.row == 3 {
                let vc = RepositoresVC()                
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
}


//MARK: Searchcontroller delegate
extension MainVC : UISearchControllerDelegate, UISearchBarDelegate {
 

    func willDismissSearchController(_ searchController: UISearchController) {
        isSearch = false
        tableView.reloadData()
    }
    func willPresentSearchController(_ searchController: UISearchController) {
        isSearch = true
        tableView.reloadData()
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        API.shared.getRepos(username: searchBar.text!) { user in
            
            if user.isEmpty {
                Alert.showAlert(forState: .error, message: "User not found")
            } else {
                
                if searchBar.text!.contains(" ") {
                    Alert.showAlert(forState: .error, message: "Username is error")
                } else {
                    self.user = user
                    self.tableView.reloadData()
                }
            }
        }
    }
}
