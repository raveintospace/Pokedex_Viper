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
    let defenseLabel = UILabel()
    
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
        setupDefenseLabel()
    }
    
    func setupIdLabel() {
        addSubview(idLabel)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        idLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        
        idLabel.applyVerdanaBoldAndSize16()
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 15).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        imageIV.contentMode = .scaleAspectFit
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 15).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15).isActive = true
        
        nameLabel.applyVerdanaBoldAndSize16()
    }
    
    func setupAttackLabel() {
        addSubview(attackLabel)
        
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        attackLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        attackLabel.applyVerdanaAndSize14()
    }
    
    func setupDefenseLabel() {
        addSubview(defenseLabel)
        
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        defenseLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        defenseLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor).isActive = true
        
        defenseLabel.applyVerdanaAndSize14()
    }
}
