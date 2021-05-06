//
//  Extensions.swift
//  Drinks
//
//  Created by Damian Szerszeń on 03/05/2021.
//

import Foundation
import SwiftUI

extension UIImage {
    
    func fromUrl(url: String?) -> UIImage {
        do {
            guard let url = URL(string: url ?? "") else {
                return UIImage(named: "placeholder")!
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage(named: "placeholder")!
            
        } catch {
            print(error)
        }
        return UIImage(named: "placeholder")!
    }
}
