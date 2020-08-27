//
//  ViewController.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class NewFeedViewController: UIViewController, ButtonClick {
    
    @IBOutlet weak var statusTableView: UITableView!
    
    private var listStatus = Status.setData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statusTableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setUpTableView() {
        statusTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        statusTableView.dataSource = self
        statusTableView.delegate = self
        statusTableView.contentInset.bottom = 50
    }
    
    func onClick() {
        statusTableView.reloadData()
    }
}

extension NewFeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStatus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell else {
            return UITableViewCell()
        }
        cell.buttonClick = self
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
