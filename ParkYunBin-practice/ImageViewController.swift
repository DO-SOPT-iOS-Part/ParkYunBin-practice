//
//  ImageViewController.swift
//  ParkYunBin-practice
//
//  Created by 박윤빈 on 2023/10/28.
//

import UIKit
import SnapKit
import Then

class ImageViewController: UIViewController {
    var imageCollectionList: [ImageCollectionData] = [.init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: true),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: true),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: true),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: false),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: true),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: true),
                                                      .init(image: "image6", isLiked: true),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: false),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: true),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: true),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: true),
                                                      .init(image: "image8", isLiked: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(ImageCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
}
extension ImageViewController: UICollectionViewDelegate {}
extension ImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}

extension ImageViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}

extension ImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
    }
}
