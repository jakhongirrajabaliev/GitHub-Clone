//
//  API.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class API {
    
    static let shared = API()
    
    
    
    func getUser(username : String, compleation : @escaping ((User) -> ()) ) {

            let baseUrl = URL(string: "https://api.github.com/users/\(username)")!

            Req.shared.getUserRequest(baseUrl: baseUrl, method: .get) { json in
                if let json = json {
                    let user = User(
                        
                        username: json["login"].stringValue,
                        name: json["name"].stringValue,
                        image: json["avatar_url"].stringValue,
                        location: json["location"].stringValue,
                        followers: json["followers"].stringValue,
                        following: json["following"].stringValue,
                        company: json["company"].stringValue)
                    
                    compleation(user)
                    print("user send")
                } else {
                    print("ERROR")
                }
            }
        }
    
    
    
    
    
    
    func getRepos(username : String, compleation : @escaping (([Repos]) -> ()) ) {
        
        let baseUrl = URL(string: "https://api.github.com/users/\(username)/repos")!
        
        Req.shared.getUserRequest(baseUrl: baseUrl, method: .get) { json in
            if let json = json {
                var users = [Repos]()
                for i in json.arrayValue {
                    let user = Repos(
                        applang: i["language"].stringValue,
                        appname: i["name"].stringValue,
                        visibility: i["visibility"].boolValue,
                        commits: i["commits_url"].stringValue,
                        avatarImage: i["owner"]["avatar_url"].stringValue)
                    
                    users.append(user)
                    
                    
                }
                compleation(users)
            }
            
        }
    }
    
    
    
    
    
    func getReposCommits(url : String, compleation : @escaping (([Commit]) -> ()) ) {
        let updateUrl = String(url.split(separator: "{").first!)
        let baseUrl = URL(string: updateUrl)!

        Req.shared.getUserRequest(baseUrl: baseUrl, method: .get) { json in
            if let json = json {
                var commits = [Commit]()
                for i in json.arrayValue {
                    let commit = Commit(
                        owner: i["commit"]["committer"]["name"].stringValue,
                        date: i["commit"]["committer"]["date"].stringValue,
                        url: i["commit"]["url"].stringValue,
                        htmlUrl: i["commit"]["html_url"].stringValue
                        )
                    
                    commits.append(commit)
                }
                compleation(commits)
            } else {
                compleation([])
            }
        }
    }
}
