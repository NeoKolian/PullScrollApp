//
//  ViewController.swift
//  PullScrollApp
//
//  Created by Nikolay Pochekuev on 21.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setup()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let scrollView = UIScrollView()
}

private extension ViewController {
    func setup() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)

        imageView.frame = CGRect(x: 0, y: -scrollView.safeAreaInsets.top, width: scrollView.frame.width, height: 270)
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        if y < 0 {
            imageView.frame = CGRect(x: 0, y: -scrollView.safeAreaInsets.top + y, width: scrollView.frame.width, height: 300 - y)
            
        }
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
}
