//
//  DetailView.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//  
//

import Foundation
import UIKit

final class DetailView: UIViewController {
    
    // MARK: - Properties
    var presenter: DetailPresenterProtocol?
    
    var safeArea: UILayoutGuide!
    let detailNameLabel = UILabel()
    let detailImageIV = CustomImageView()
    let detailTypeLabel = UILabel()
    let detailAttackLabel = UILabel()
    let detailDefenseLabel = UILabel()
    let detailDescriptionTextView = UITextView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    
    // MARK: - View Layout
    
    func setupDetailView() {
        safeArea = view.layoutMarginsGuide
        setupDetailNameLabel()
        setupDetailImageIV()
        setupDetailTypeLabel()
        setupDetailAttackLabel()
        setupDetailDefenseLabel()
        setupDetailDescriptionTextView()
    }
    
    func setupDetailNameLabel() {
        view.addSubview(detailNameLabel)
        
        detailNameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailNameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        detailNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5).isActive = true
        
        detailNameLabel.textColor = .white
        detailNameLabel.font = UIFont(name: "Verdana-Bold", size: 20)
    }
    
    func setupDetailImageIV() {
        view.addSubview(detailImageIV)
        
        detailImageIV.translatesAutoresizingMaskIntoConstraints = false
        detailImageIV.topAnchor.constraint(equalTo: detailNameLabel.bottomAnchor, constant: 24).isActive = true
        detailImageIV.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        detailImageIV.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        detailImageIV.heightAnchor.constraint(equalTo: detailImageIV.widthAnchor).isActive = true
        
        detailImageIV.contentMode = .scaleAspectFit
    }
    
    func setupDetailTypeLabel() {
        view.addSubview(detailTypeLabel)
        
        detailTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTypeLabel.topAnchor.constraint(equalTo: detailImageIV.bottomAnchor, constant: 36).isActive = true
        detailTypeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        detailTypeLabel.textColor = .white
        detailTypeLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupDetailAttackLabel() {
        view.addSubview(detailAttackLabel)
        
        detailAttackLabel.translatesAutoresizingMaskIntoConstraints = false
        detailAttackLabel.topAnchor.constraint(equalTo: detailTypeLabel.bottomAnchor, constant: 8).isActive = true
        detailAttackLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        detailAttackLabel.textColor = .white
        detailAttackLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupDetailDefenseLabel() {
        view.addSubview(detailDefenseLabel)
        
        detailDefenseLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDefenseLabel.topAnchor.constraint(equalTo: detailAttackLabel.bottomAnchor, constant: 8).isActive = true
        detailDefenseLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        detailDefenseLabel.textColor = .white
        detailDefenseLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupDetailDescriptionTextView() {
        view.addSubview(detailDescriptionTextView)
        
        detailDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionTextView.topAnchor.constraint(equalTo: detailDefenseLabel.bottomAnchor, constant: 24).isActive = true
        detailDescriptionTextView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        detailDescriptionTextView.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        detailDescriptionTextView.heightAnchor.constraint(equalTo: detailDescriptionTextView.widthAnchor).isActive = true
        
        detailDescriptionTextView.contentInsetAdjustmentBehavior = .automatic
        detailDescriptionTextView.textAlignment = .left
        detailDescriptionTextView.textColor = .white
        detailDescriptionTextView.backgroundColor = .black
        detailDescriptionTextView.font = UIFont(name: "Verdana", size: 16)
        detailDescriptionTextView.layer.cornerRadius = 10
    }
    
    // MARK: - View data configuration
    
    func showDataInDetailVC(data: Pokemon) {
        detailNameLabel.text = data.name.capitalized
        
        if let url = URL(string: data.imageUrl) {
            detailImageIV.loadImage(from: url)
        }
        
        detailTypeLabel.text = "Type: \(data.type.capitalized)"
        detailAttackLabel.text = "Attack: \(data.attack)"
        detailDefenseLabel.text = "Defense: \(data.defense)"
        detailDescriptionTextView.text = data.description
    }
    
    
}
