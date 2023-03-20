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
    
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9338082533, blue: 0.7223893823, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
//        label.backgroundColor = .red
        label.text = "Note title"
        return label
    }()
    
     var noteTextLable: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
//         label.backgroundColor = .yellow
         label.textAlignment = .left
//         label.textAlignment = .justified
         return label
    }()
    
    var deleteNoteButtom: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .black
       return button
   }()
    
    @objc func deleteButtonTapped() {
        delegate?.cellDeleteTapped(sender: self)
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        backgroundCell.addSubview(noteTitleLabel)
        backgroundCell.addSubview(noteTextLable)
        backgroundCell.addSubview(deleteNoteButtom)
        contentView.addSubview(backgroundCell)
        selectionStyle = .none
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            noteTitleLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            noteTitleLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 30),
            noteTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            deleteNoteButtom.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -5),
            deleteNoteButtom.topAnchor.constraint(equalTo: backgroundCell.topAnchor,constant: 5),
            
            noteTextLable.topAnchor.constraint(equalTo: noteTitleLabel.bottomAnchor, constant: 5),
            noteTextLable.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 5),
            noteTextLable.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -5),
            noteTextLable.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -5),
            
            
        ])
        
    }
    
}
