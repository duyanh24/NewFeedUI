//
//  PostdetailViewController.swift
//  NewFeedUI
//
//  Created by tuanna on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var test = 40
    var showMoreSelected = false

    @IBOutlet weak var postDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yvonne Knight"
        setUp()
    }
    
    func setUp() {
        postDetailTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        postDetailTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "commentCell")
        postDetailTableView.register(UINib(nibName: "ShowMoreCell", bundle: nil), forCellReuseIdentifier: "showMoreCell")
        postDetailTableView.dataSource = self
        postDetailTableView.delegate = self
    }
}

extension PostDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showMoreSelected == false && test > 3 {
            return 4
        }
        return test
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        if showMoreSelected == false && indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "showMoreCell", for: indexPath) as? ShowMoreCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            showMoreSelected = true
            postDetailTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
