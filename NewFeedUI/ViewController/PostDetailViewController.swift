//
//  PostdetailViewController.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var postDetailTableView: UITableView!
    
    private var numberOfComment = -1
    private var numberOfCellShown = 4
    var statusSelected: Status?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        navigationController?.navigationBar.topItem?.title = "New Feeds"
        navigationController?.navigationBar.tintColor = .gray
    }
    
    private func setUpTableView() {
        guard let statusSelected = statusSelected else {
            return
        }
        title = statusSelected.name
        numberOfComment = statusSelected.comments.count
        
        postDetailTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        postDetailTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "commentCell")
        postDetailTableView.register(UINib(nibName: "ShowMoreCell", bundle: nil), forCellReuseIdentifier: "showMoreCell")
        postDetailTableView.dataSource = self
        postDetailTableView.delegate = self
        postDetailTableView.contentInset.bottom = 50
    }
}

extension PostDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfComment > 3 && numberOfCellShown < numberOfComment{
            return numberOfCellShown
        }
        return numberOfComment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            guard let statusSelected = statusSelected else {
                return UITableViewCell()
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell else {
                return UITableViewCell()
            }
            
            cell.setUpData(status: statusSelected)
            return cell
        }
        
        if numberOfCellShown < numberOfComment && indexPath.row == numberOfCellShown - 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "showMoreCell", for: indexPath) as? ShowMoreCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        guard let statusSelected = statusSelected else {
            return UITableViewCell()
        }
        cell.setUpData(comment: statusSelected.comments[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == numberOfCellShown - 1 {
            numberOfCellShown += 5
            postDetailTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
