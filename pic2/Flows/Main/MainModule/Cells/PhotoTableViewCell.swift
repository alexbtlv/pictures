//
//  PhotoTableViewCell.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class PhotoTableViewCell: BaseTableViewCell, CellInterface {
    
    // MARK: Outlets
    
    @IBOutlet private weak var myImageView: UIImageView! {
        didSet {
            myImageView.kf.indicatorType = .activity
        }
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
           myImageView.kf.cancelDownloadTask()
       }
    
    // MARK: Public methods
    
    func configure(with viewModel: PhotoCellViewModel) {
        myImageView.kf.setImage(with: viewModel.imageSource, placeholder: R.image.placeholder())
    }
}
