//
//  BaseTableViewCell.swift
//  Lips
//
//  Created by Alexander Batalov on 8/23/19.
//  Copyright © 2019 punicapp. All rights reserved.
//

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
