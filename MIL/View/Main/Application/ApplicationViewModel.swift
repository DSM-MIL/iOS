//
//  ApplicationViewModel.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import Foundation

class ApplicationViewModel: ObservableObject {
    @Published var isMeal: Bool = false
    @Published var isOffer: Bool = false
    @Published var isBug: Bool = false
    
    // Offer
    @Published var offerTitle: String = ""
    @Published var offerContent: String = ""
    
    // Bug
    @Published var bugTitle: String = ""
    @Published var bugContent: String = ""
}
