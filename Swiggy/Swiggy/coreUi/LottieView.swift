//
//  LottieView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 08/12/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    var speed: CGFloat = 1.0
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.animationSpeed = speed
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(animationView)
        
        // Add constraints to make the LottieAnimationView fit within the container
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: containerView.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        animationView.play()
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Updates to the animation, if any, can be handled here.
    }
}
