
//. ViewController.swift
// foodDelivery
//
// Created by 이윤지 on 2023/07/18.



import Foundation
import UIKit

struct DataModel {
  let image: String
  let title: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {



  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    return collectionView
  }()

  let data: [DataModel] = [
    DataModel(image: "mono_baedal16", title: "B마트"),
    DataModel(image: "mono_baedal01", title: "배민라이더스"),
    DataModel(image: "mono_baedal02", title: "1인분"),
    DataModel(image: "mono_baedal03", title: "배민오더"),
    DataModel(image: "mono_baedal04", title: "한식"),
    DataModel(image: "mono_baedal05", title: "분식"),
    DataModel(image: "mono_baedal06", title: "카페 디저트"),
    DataModel(image: "mono_baedal07", title: "돈까스회일식"),
    DataModel(image: "mono_baedal08", title: "치킨"),
    DataModel(image: "mono_baedal09", title: "피자"),
    DataModel(image: "mono_baedal10", title: "아시안 양식"),
    DataModel(image: "mono_baedal11", title: "중국집"),
    DataModel(image: "mono_baedal12", title: "족발 보쌈"),
    DataModel(image: "mono_baedal13", title: "야식"),
    DataModel(image: "mono_baedal14", title: "찜탕"),
    DataModel(image: "mono_baedal15", title: "도시락")
  ]

  let cellIdentifier = "Cell"




  override func viewDidLoad() {
    title = "배달의 민족"
    let bannerImageName = "banner03" // 이미지 파일 이름
    super.viewDidLoad()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)


    // viewDidLoad() 함수 내부에서 collectionView.addSubview(collectionView) 위에 다음 코드를 추가
    let bannerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
    bannerImageView.contentMode = .scaleAspectFill
    bannerImageView.image = UIImage(named: bannerImageName)
    collectionView.addSubview(bannerImageView)
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])




  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }




  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    cell.backgroundColor = .green

    // 이미지 뷰 생성 및 설정
    let imageView = UIImageView(frame: CGRect(x: cell.frame.width / 4, y: cell.frame.height * 0.2, width: cell.frame.width / 2 , height: cell.frame.height * 0.4))
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: data[indexPath.item].image)
    cell.contentView.addSubview(imageView)

    // 레이블 생성 및 설정
    let label = UILabel(frame: CGRect(x: 0, y: cell.frame.height * 0.6, width: cell.frame.width, height: cell.frame.height * 0.1))
    label.textAlignment = .center
    label.text = data[indexPath.item].title
    cell.contentView.addSubview(label)

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width / 5
    let height = collectionView.frame.height / 5
    return CGSize(width: width, height: height)
  }




}

let viewController = ViewController()
