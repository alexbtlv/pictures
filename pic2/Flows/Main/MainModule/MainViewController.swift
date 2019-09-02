//
//  MainViewController.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class MainViewController: BaseViewController, MainViewInput, MainViewOutput {
    
    // MARK: Input
    var viewModel: MainViewModel?
    
    // MARK: Outputs
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    // MARK: Private methods
    private func setupUI() {
        tableView.allowsSelection = false
        registerCells()
    }
    
    private func setupBindings() {
        viewModel?.sections
            .bind(to: tableView.rx.items(dataSource: dataSource()))
            .disposed(by: disposeBag)
        
        viewModel?.executing.drive(onNext: { (isExecuting) in
            if isExecuting {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }).disposed(by: disposeBag)
    }
    
    private func registerCells() {
        tableView.register(cellInterface: PhotoTableViewCell.self)
    }
    
    private func dataSource() -> RxTableViewSectionedReloadDataSource<MainSectionModel> {
        return RxTableViewSectionedReloadDataSource<MainSectionModel>(configureCell: { (_, tv, indexPath, item) -> UITableViewCell in
            switch item {
            case .photo(let cellViewModel):
                let cell: PhotoTableViewCell = tv.dequeueReusableCell(for: indexPath)
                cell.configure(with: cellViewModel)
                return cell
            }
        })
    }
}
