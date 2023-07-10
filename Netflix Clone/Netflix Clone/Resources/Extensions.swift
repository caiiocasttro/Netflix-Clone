//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
//

import Foundation

extension String {
    
    func capitalizaFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
