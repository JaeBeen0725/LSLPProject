//
//  HomeTableViewCell.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import UIKit

class HomeTableViewCell: BaseTableViewCell {
    
    let noticBoardTitleLabel = {
        let view = UILabel()
        
        
        return view
    }()
    
    let writerLabel = {
        let view = UILabel()
        return view
    }()
    
    let dateLabel = {
        let view = UILabel()
        
        return view
    }()
    
    let viewCountLabel = {
        let view = UILabel()
        return view
    }()
    
    
    override func configure() {
        super.configure()
        
        contentView.addSubview(noticBoardTitleLabel)
        contentView.addSubview(writerLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(viewCountLabel)
        
    }
    
    override func setConstrains() {
        super.setConstrains()
        noticBoardTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.height.equalTo(40)
        }
        
        writerLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.top.equalTo(noticBoardTitleLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(writerLabel.snp.trailing).offset(2)
            make.top.equalTo(noticBoardTitleLabel.snp.bottom).offset(4)
            make.trailing.equalTo(viewCountLabel.snp.leading).offset(4)
            make.height.equalTo(20)
        }
        
        viewCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel.snp.trailing).offset(2)
            make.top.equalTo(noticBoardTitleLabel.snp.bottom).offset(4)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.height.equalTo(20)
        }
        
    }
    
  
    
}
