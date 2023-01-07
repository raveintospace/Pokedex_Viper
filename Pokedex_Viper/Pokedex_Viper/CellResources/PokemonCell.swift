//
//  PokemonCell.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//

import UIKit

class PokemonCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()     // Our custom image view
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let attackLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupIdLabel()
        setupImageView()
        setupNameLabel()
        setupAttackLabel()
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 5).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageIV.contentMode = .scaleAspectFit
    }
    
    func setupIdLabel() {
        addSubview(idLabel)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        idLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupAttackLabel() {
        addSubview(attackLabel)
        
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        attackLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        attackLabel.font = UIFont(name: "Verdana", size: 14)
    }
}
