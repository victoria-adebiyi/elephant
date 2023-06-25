//
//  MedicationsTableViewCell.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class MedicationsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelSchedule: UILabel!
    var labelNextRefill: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelSchedule()
        setupLabelNextRefill()
        
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
    
    func setupLabelSchedule(){
        labelSchedule = UILabel()
        labelSchedule.font = UIFont.boldSystemFont(ofSize: 14)
        labelSchedule.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelSchedule)
    }
    
    func setupLabelNextRefill(){
        labelNextRefill = UILabel()
        labelNextRefill.font = UIFont.boldSystemFont(ofSize: 14)
        labelNextRefill.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelNextRefill)
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
            
            labelSchedule.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelSchedule.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelSchedule.heightAnchor.constraint(equalToConstant: 16),
            labelSchedule.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelNextRefill.topAnchor.constraint(equalTo: labelSchedule.bottomAnchor, constant: 2),
            labelNextRefill.leadingAnchor.constraint(equalTo: labelSchedule.leadingAnchor),
            labelNextRefill.heightAnchor.constraint(equalToConstant: 16),
            labelNextRefill.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
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

