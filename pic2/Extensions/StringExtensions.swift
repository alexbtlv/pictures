//
//  StringExtensions.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

extension String {
    func isValidEmail() -> Bool {
        if self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || self.count > Constants.maximumEmailLength {
            return false
        }
        do {
            // swiftlint:disable line_length
            let pattern = "^[a-zA-Z0-9]{1,}+((\\.|\\_|\\+|-{0,1})[a-zA-Z0-9]{1,})*+@[a-zA-Z0-9а-яА-Я]{1,}((\\.|\\_|-{0,1})[a-zA-Z0-9а-яА-Я]{1,})*\\.[a-zA-Zа-яА-Я]{2,64}$"
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = regex.rangeOfFirstMatch(in: self, options: .anchored, range: NSRange(location: 0, length: count))
            return range.length == count
        } catch {
            return false
        }
    }
}
