//
//  CashedImageModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import SwiftUI

enum CashedImagePhase {
    /// No image is loaded.
    case empty

    /// An image succesfully loaded.
    case success(Image)

    /// An image failed to load with an error.
    case failure(Error)
}
