//
//  RepositoresVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

class RepositoresVC: UIViewController {

    
    
    var tableView : UITableView = UITableView()
    
    var user : [Repos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetup()
        reqSetup()
    }
    
    
    func reqSetup() {
        API.shared.getRepos(username: UserDefaults.standard.string(forKey: "userFound")!) { user in
            self.user = user
            self.tableView.reloadData()
        }
    }
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
 
        tableView.register(RepositoriesTVC.self, forCellReuseIdentifier: RepositoriesTVC.reuseIdentifier)
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }


}



extension RepositoresVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTVC.reuseIdentifier, for: indexPath) as! RepositoriesTVC
        cell.updateCell(user: user[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CommitVC()
        vc.repos = self.user[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
