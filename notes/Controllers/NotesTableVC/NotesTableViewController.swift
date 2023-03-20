//
//  ViewController.swift
//  notes
//
//  Created by pvl kzntsv on 18.03.2023.
//

import UIKit

class NotesTableViewController: UIViewController {
    
//MARK: -Elements
    
    var notes: [Note] = [] {
        didSet {
            DispatchQueue.main.async {
                self.notesTableView.reloadData()
            }
        }
    }
 
    
    private var notesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NoteTableViewCell.self, forCellReuseIdentifier: "cell")
        table.bounces = false
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
  
    // MARK: - Add New Note
    @objc private func addNewNoteButtonTapped() {
        let newNoteVC = NoteViewController()
        newNoteVC.navigationItem.title = "New Note"
        newNoteVC.delegate = self
        navigationController?.pushViewController(newNoteVC, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewNoteButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        setupUI()
        setDelegates()
        notes = CoreDataManager.shared.fetchData()
    }

    // MARK: - Set Delegates

    private func setDelegates() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    //MARK: - Setup Views
    
    private func setupUI() {
        view.addSubview(notesTableView)
        notesTableView.frame = view.bounds
    }
}

//MARK: - Extensions delegate

extension NotesTableViewController: UITableViewDelegate, UITableViewDataSource, NoteTableViewCellDelegate, NoteDelegate {
    
    func addNote(note: Note, index: Int) {
        notes.insert(note, at: index)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editNoteVC = NoteViewController()
        editNoteVC.delegate = self
        editNoteVC.configure(cellIndex: indexPath.row ,note: notes[indexPath.row])
        CoreDataManager.shared.delete(notes[indexPath.row])
//        notes.remove(at: indexPath.row)
        navigationController?.pushViewController(editNoteVC, animated: true)

    }
    
    
    func cellDeleteTapped(sender: NoteTableViewCell) {
        if let selectedIndexPath = notesTableView.indexPath(for: sender) {
            let ac = UIAlertController(title: "Delete note?", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: deleteNote))
            present(ac, animated: true)
            func deleteNote(action: UIAlertAction) {
                notes.remove(at: selectedIndexPath.row)
            }
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.delegate = self
        cell.configure(notes[indexPath.row])
    
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
  
}

    


