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
    private var numberOfCellShown = 3
    var statusSelected: Status?
    private var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpNavigationBar()
        setUpTableView()
    }
    
    private func setUpData() {
        guard let statusSelected = statusSelected else {
            return
        }
        title = statusSelected.name
        numberOfComment = statusSelected.comments.count
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "New Feeds"
        navigationController?.navigationBar.tintColor = .gray
    }
    
    private func setUpTableView() {
        postDetailTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        postDetailTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "commentCell")
        postDetailTableView.dataSource = self
        postDetailTableView.delegate = self
        postDetailTableView.contentInset.bottom = 60
        setUpFooterView()
    }
    
    private func setUpFooterView() {
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        footerView.layer.cornerRadius = 5
        footerView.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1.0)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapFooter))
        footerView.addGestureRecognizer(tapRecognizer)
        if numberOfComment < 3 {
            footerView.isHidden = true
        }

        let label = UILabel(frame: footerView.bounds)
        label.text = "More Comment"
        label.textColor = UIColor(red: 120/255.0, green: 145/255.0, blue: 196/255.0, alpha: 1.0)
        label.textAlignment = .center
        footerView.addSubview(label)
        postDetailTableView.tableFooterView = footerView
    }
    
    @objc func handleTapFooter(gestureRecognizer: UIGestureRecognizer)
    {
        numberOfCellShown += 5
        postDetailTableView.reloadData()
        if numberOfCellShown >= numberOfComment {
            footerView.isHidden = true
        }
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        guard let statusSelected = statusSelected else {
            return UITableViewCell()
        }
        cell.setUpData(comment: statusSelected.comments[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
