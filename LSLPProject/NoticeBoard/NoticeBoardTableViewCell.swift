//
//  NoticeBoardTableViewCell.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import UIKit

class TableViewCell: BaseTableViewCell {
    
    
    let testLabel = {
        let view = UILabel()
        view.backgroundColor = .blue
        return view
    }()
     
    override func configure() {
        super.configure()
        contentView.addSubview(testLabel)
    }
    
    override func setConstrains() {
        testLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
}
