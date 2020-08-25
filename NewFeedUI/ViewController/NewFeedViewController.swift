//
//  ViewController.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class NewFeedViewController: UIViewController {
    
    @IBOutlet weak var statusTableView: UITableView!
    
    var listStatus = Status.setData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        title = "New Feeds"
    }
    
    private func setUpTableView() {
        statusTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        statusTableView.register(UINib(nibName: "StatusCellWithoutImage", bundle: nil), forCellReuseIdentifier: "statusCellWithoutImage")
        statusTableView.dataSource = self
        statusTableView.delegate = self
        statusTableView.contentInset.bottom = 50
    }
}

extension NewFeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStatus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if listStatus[indexPath.row].image == "" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCellWithoutImage", for: indexPath) as? StatusCellWithoutImage else {
                return UITableViewCell()
            }
            cell.setUpData(status: listStatus[indexPath.row])
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell else {
            return UITableViewCell()
        }
        cell.setUpData(status: listStatus[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let postDetailViewController = storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController else {
            return
        }
        postDetailViewController.statusSelected = listStatus[indexPath.row]
        navigationController?.pushViewController(postDetailViewController, animated: true)
    }
}
