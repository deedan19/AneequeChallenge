//
//  OnboardingModel.swift
//  AneequeTask
//
//  Created by Decagon on 25/07/2021.
//

import UIKit

struct OnboardingModel {
    let title: String
    let description: String
    let image: UIImage
}

let slides: [OnboardingModel] = [
    OnboardingModel(title: "Get the best sneaky pairs", description: "Get the best sneakers that trancends beauty and maintain balance", image: #imageLiteral(resourceName: "nike5-removebg-preview")),
    OnboardingModel(title: "Let the journey start", description: "Find the best pair to fit your lifestyle and fulfill your life", image: #imageLiteral(resourceName: "nike2-removebg-preview"))
]
