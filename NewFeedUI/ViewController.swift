//
//  ViewController.swift
//  NewFeedUI
//
//  Created by tuanna on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        
        //statusTableView.register(StatusCell.self, forCellReuseIdentifier: "statusCell")
        statusTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        statusTableView.dataSource = self
        statusTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell  else {
        //            fatalError("Error")
        //        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let postDetailViewController = storyboard?.instantiateViewController(identifier: "PostDetailViewController") as? PostDetailViewController else {
//            return
//        }
        
        guard let postDetailViewController = storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController else {
            return
        }
        navigationController?.pushViewController(postDetailViewController, animated: true)
    }
}
