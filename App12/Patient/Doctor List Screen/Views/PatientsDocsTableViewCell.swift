//
//  PatientsDocsTableViewCell.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class PatientsDocsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelDoctorsName: UILabel!
    var labelDoctorsSpecialty: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelDoctorsName()
        setupLabelDoctorsSpecialty()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelDoctorsName(){
        labelDoctorsName = UILabel()
        labelDoctorsName.text = "name"
        labelDoctorsName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDoctorsName)
    }
    func setupLabelDoctorsSpecialty(){
        labelDoctorsSpecialty = UILabel()
        labelDoctorsSpecialty.text = "specialty"
        labelDoctorsSpecialty.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDoctorsSpecialty)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelDoctorsName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelDoctorsName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            labelDoctorsName.heightAnchor.constraint(equalToConstant: 20),
            
            labelDoctorsSpecialty.topAnchor.constraint(equalTo: labelDoctorsName.bottomAnchor, constant: 4),
            labelDoctorsSpecialty.leadingAnchor.constraint(equalTo: labelDoctorsName.leadingAnchor),
            labelDoctorsSpecialty.heightAnchor.constraint(equalToConstant: 20),
            
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
