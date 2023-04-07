//
//  CommitVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

class CommitVC : UIViewController {
    
    let tableView = UITableView()
    var data = [Commit]()
    var repos : Repos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCommits()
        setupTableView()
        self.view.backgroundColor = .white
        title = "Commits"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.frame = self.view.frame
        tableView.center = self.view.center
        tableView.register(CommitTVC.self, forCellReuseIdentifier: "CommitTVC")
        self.view.addSubview(tableView)
    }
    
    func getCommits() {
        API.shared.getReposCommits(url: self.repos.commits) { commits in
            self.data = commits
            self.tableView.reloadData()
        }
    }
}

extension CommitVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTVC", for: indexPath) as! CommitTVC
        cell.setupCell()
        cell.updateCell(commit: self.data[indexPath.row])
        return cell
    }
    
}
