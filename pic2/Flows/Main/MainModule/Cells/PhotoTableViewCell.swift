//
//  PhotoTableViewCell.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class PhotoTableViewCell: BaseTableViewCell, CellInterface {
    
    // MARK: Outlets
    
    @IBOutlet private weak var myImageView: UIImageView!
    
    // MARK: Public methods
    
    func configure(with viewModel: PhotoCellViewModel) {
        myImageView.kf.cancelDownloadTask()
        myImageView.kf.indicatorType = .activity
        myImageView.kf.setImage(with: viewModel.imageSource, placeholder: R.image.placeholder())
    }
}
