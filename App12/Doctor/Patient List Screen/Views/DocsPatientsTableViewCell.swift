//
//  DocsPatientsTableViewCell.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class DocsPatientsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelPatientsName: UILabel!
    var labelPatientsAge: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelPatientsName()
        setupLabelPatientsAge()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelPatientsName(){
        labelPatientsName = UILabel()
        labelPatientsName.text = "name"
        labelPatientsName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPatientsName)
    }
    func setupLabelPatientsAge(){
        labelPatientsAge = UILabel()
        labelPatientsAge.text = "age"
        labelPatientsAge.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPatientsAge)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelPatientsName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelPatientsName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            labelPatientsName.heightAnchor.constraint(equalToConstant: 20),
            
            labelPatientsAge.topAnchor.constraint(equalTo: labelPatientsName.bottomAnchor, constant: 4),
            labelPatientsAge.leadingAnchor.constraint(equalTo: labelPatientsName.leadingAnchor),
            labelPatientsAge.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

