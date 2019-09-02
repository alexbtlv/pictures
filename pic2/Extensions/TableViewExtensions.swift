//
//  TableViewExtensions.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

import Foundation

extension UITableView {
    
    func register(cellInterface type: CellInterface.Type) {
        self.register(type.cellNib, forCellReuseIdentifier: type.id)
    }
    
    func dequeueReusableCell<T: CellInterface>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.id) as? T else {
            fatalError("Cell is not of kind \(T.id)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: CellInterface>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.id, for: indexPath) as? T else {
            fatalError("Cell is not of kind \(T.id)")
        }
        return cell
    }
}
