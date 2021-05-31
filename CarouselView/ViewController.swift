//
//  ViewController.swift
//  CarouselView
//
//  Created by Daichi Hayashi on 2021/05/31.
//

import UIKit

class ViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    private var cellWidth: CGFloat {
        // 注目しているセル左右のマージン 16 * 左右 (2 つ) = 32 と
        // 右にチラ見しているセルの表示幅を引いたものがセル幅となる
        view.frame.width - 32 - (view.frame.width * 0.1)
    }
    private var cellHeight: CGFloat {
        cellWidth * CollectionViewCell.aspectRatio
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)

        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.showsHorizontalScrollIndicator = false

        setupLayout()

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: cellHeight)
        ])
    }

    private func setupLayout() {
        let layout = CarouselCollectionViewFlowLayout()

        layout.itemSize = CGSize(width: cellWidth,
                                 height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0

        collectionView.collectionViewLayout = layout
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id,
                                                      for: indexPath) as! CollectionViewCell

        return cell
    }
}
