//
//  ProgressViewLottieImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import SwiftUI
import Lottie

struct LoadingAnimationViewLottieImplementation: UIViewRepresentable {
    
    var name: String
    var loopMode: LottieLoopMode = .autoReverse
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LoadingAnimationViewLottieImplementation>) -> UIView {
        
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingAnimationViewLottieImplementation>) {}
}
