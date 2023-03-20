//
//  NoteViewController.swift
//  notes
//
//  Created by pvl kzntsv on 20.03.2023.
//

import UIKit

protocol NoteDelegate: AnyObject {
    func addNote(sender: NoteViewController)
}

class NoteViewController: UIViewController {
    
    weak var delegate: NoteDelegate?
    
//    var note = Note(context: CoreDataManager.shared.context)

//MARK: - Elements
    private let titleHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title:"
        return label
    }()
    
    private var noteTitleTextFild: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 0.9813399911, green: 0.9542712569, blue: 0.8666041493, alpha: 1)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let noteHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Note:"
        return label
    }()
    
    private var noteBodyTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.9813399911, green: 0.9542712569, blue: 0.8666041493, alpha: 1)
        textView.layer.cornerRadius = 15
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
        view.backgroundColor = .white
    }
    
//MARK: -Configure
    
    
//MARK: -Save
    
    
//MARK: -SetupUI
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleHeaderLabel)
        view.addSubview(noteTitleTextFild)
        view.addSubview(noteHeaderLabel)
        view.addSubview(noteBodyTextView)
        navigationItem.title = "Note"
        
    }
    
    //MARK: -SetConstraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleHeaderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleHeaderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            noteTitleTextFild.topAnchor.constraint(equalTo: titleHeaderLabel.bottomAnchor),
            noteTitleTextFild.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            noteTitleTextFild.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            noteTitleTextFild.heightAnchor.constraint(equalToConstant: 40),
            
            noteHeaderLabel.topAnchor.constraint(equalTo: noteTitleTextFild.bottomAnchor, constant: 20),
            noteHeaderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            noteBodyTextView.topAnchor.constraint(equalTo: noteHeaderLabel.bottomAnchor),
            noteBodyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            noteBodyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            noteBodyTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}


