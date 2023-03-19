//
//  ViewController.swift
//  notes
//
//  Created by pvl kzntsv on 18.03.2023.
//

import UIKit

class notesTableViewController: UIViewController {
    
//MARK: -Elements
    
    private var notesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBlue
        return tableView
    }()
    
    //MARK: - Setup Views
    
    func setupViews() {
        view.addSubview(notesTableView)
        notesTableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Notes"
//        navigationItem.titleView?.backgroundColor = .white
        
        setupViews()
        setDelegates()
        setConstraints()
    }

// MARK: - Set Delegates

    func setDelegates() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
 //MARK: -Set Constraints
    func setConstraints() {
        
    }
    
}



extension notesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
}

