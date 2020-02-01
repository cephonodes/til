//
//  UserData.swift
//  Landmarks
//
//  Created by Yuki Narita on 2020/02/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
