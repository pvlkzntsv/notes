//
//  NoteTableViewCell.swift
//  notes
//
//  Created by pvl kzntsv on 20.03.2023.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func cellDeleteTapped(sender: NoteTableViewCell)
}

final class NoteTableViewCell: UITableViewCell {
    
    weak var delegate: NoteTableViewCellDelegate?
    
 //MARK: - Elements
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = #colorLiteral(red: 0.9813399911, green: 0.9542712569, blue: 0.8666041493, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
//        label.backgroundColor = .red
        label.text = "Note title"
        return label
    }()
    
     var noteTextLable: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
//         label.backgroundColor = .yellow
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 12)
         return label
    }()
    
    private let deleteNoteButtom: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = UIColor(white: 0.5, alpha: 50)
       return button
   }()
    
    @objc func deleteButtonTapped() {
        delegate?.cellDeleteTapped(sender: self)
    }

//MARK: - Configure
    func configure(_ note: Note) {
        noteTitleLabel.text = note.title
        noteTextLable.text = note.note
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - SetupUI
    private func setupUI() {
        backgroundCell.addSubview(noteTitleLabel)
        backgroundCell.addSubview(noteTextLable)
        backgroundCell.addSubview(deleteNoteButtom)
        contentView.addSubview(backgroundCell)
        selectionStyle = .none
    }
//MARK: - SetConstraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            noteTitleLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            noteTitleLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 20),
            noteTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            deleteNoteButtom.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            deleteNoteButtom.topAnchor.constraint(equalTo: backgroundCell.topAnchor,constant: 10),
            
            noteTextLable.topAnchor.constraint(equalTo: noteTitleLabel.bottomAnchor, constant: 10),
            noteTextLable.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 20),
            noteTextLable.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -50),
            noteTextLable.bottomAnchor.constraint(lessThanOrEqualTo: backgroundCell.bottomAnchor, constant: -5),
            
            
        ])
        
    }
    
}
