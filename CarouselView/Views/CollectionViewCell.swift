//
//  CollectionViewCell.swift
//  CarouselView
//
//  Created by Daichi Hayashi on 2021/05/31.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    static let id: String = "cell"
    static let aspectRatio: CGFloat = 4 / 15

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupBackgroundView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupBackgroundView() {
        let backgroundView: UIView = UIView()

        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        let backgroundColors: [UIColor] = [
            .blue,
            .cyan,
            .magenta,
            .orange,
            .purple,
            .yellow,
            .red
        ]

        backgroundView.backgroundColor = backgroundColors.randomElement()
        backgroundView.layer.cornerRadius = 8
        backgroundView.layer.borderWidth = 2
        backgroundView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.8)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.heightAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: Self.aspectRatio)
        ])

        self.backgroundView = backgroundView
    }
}
