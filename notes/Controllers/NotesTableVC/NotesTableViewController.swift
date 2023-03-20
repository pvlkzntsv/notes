//
//  ViewController.swift
//  notes
//
//  Created by pvl kzntsv on 18.03.2023.
//

import UIKit

class NotesTableViewController: UIViewController {
    
//MARK: -Elements
    
    let arr = ["sdfsd", "sdfsdfff","sdfsd", "sdfsdfff","sdfsd", "sdfsdfff","sdfsd", "sdfsdfff"]
    
    private var notesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NoteTableViewCell.self, forCellReuseIdentifier: "cell")
        table.bounces = false
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
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
        setupViews()
        setDelegates()
    }

// MARK: - Set Delegates

    func setDelegates() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
}



extension NotesTableViewController: UITableViewDelegate, UITableViewDataSource, NoteTableViewCellDelegate {
    
    func cellDeleteTapped(sender: NoteTableViewCell) {
        if let selectedIndexPath = notesTableView.indexPath(for: sender) {
            print("delete note \(selectedIndexPath.row)")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.delegate = self
        cell.noteTextLable.text = arr[indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}

