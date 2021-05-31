//
//  CarouselCollectionViewFlowLayout.swift
//  CarouselView
//
//  Created by Daichi Hayashi on 2021/05/31.
//

import UIKit

final class CarouselCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return .zero }

        let pageWidth = itemSize.width + minimumLineSpacing
        let currentPage = collectionView.contentOffset.x / pageWidth

        if abs(velocity.x) > 1 {
            let nextPage = (velocity.x > 0) ? ceil(currentPage) : floor(currentPage)
            return CGPoint(x: nextPage * pageWidth - 16, y: proposedContentOffset.y)

        } else {
            return CGPoint(x: round(currentPage) * pageWidth - 16, y: proposedContentOffset.y)
        }
    }
}
