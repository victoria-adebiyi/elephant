//
//  SymptomsTableViewCell.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class SymptomsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelIntensity: UILabel!
    var labelTimeframe: UILabel!
    var labelDuration: UILabel!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelIntensity()
        setupLabelTimeframe()
        setupLabelDuration()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelIntensity(){
        labelIntensity = UILabel()
        labelIntensity.font = UIFont.systemFont(ofSize: 14)
        labelIntensity.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelIntensity)
    }
    
    func setupLabelTimeframe(){
        labelTimeframe = UILabel()
        labelTimeframe.font = UIFont.systemFont(ofSize: 12)
        labelTimeframe.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTimeframe)
    }
    
    func setupLabelDuration(){
        labelDuration = UILabel()
        labelDuration.font = UIFont.boldSystemFont(ofSize: 12)
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDuration)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelIntensity.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelIntensity.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelIntensity.heightAnchor.constraint(equalToConstant: 16),
            labelIntensity.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelTimeframe.topAnchor.constraint(equalTo: labelIntensity.bottomAnchor, constant: 2),
            labelTimeframe.leadingAnchor.constraint(equalTo: labelIntensity.leadingAnchor),
            labelTimeframe.heightAnchor.constraint(equalToConstant: 16),
            labelTimeframe.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelDuration.topAnchor.constraint(equalTo: labelTimeframe.bottomAnchor, constant: 2),
            labelDuration.leadingAnchor.constraint(equalTo: labelIntensity.leadingAnchor),
            labelDuration.heightAnchor.constraint(equalToConstant: 16),
            labelDuration.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 80)
        ])
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

