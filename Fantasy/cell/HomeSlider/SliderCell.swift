//
//  SliderCell.swift
//  Fantasy
//
//  Created by mac on 21/05/22.
//

import UIKit
import FSPagerView

class SliderCell: UITableViewCell {
    @IBOutlet weak var sliderView: FSPagerView!

    let sliderImagesName = ["slider1", "slider2", "slider3", "slider4", "slider5"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpSliderView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setUpSliderView() {
        sliderView.dataSource = self
        sliderView.delegate = self
        sliderView.register(UINib.init(nibName: "HomeSliderView", bundle: nil), forCellWithReuseIdentifier: "HomeSliderView")
        sliderView.automaticSlidingInterval = 2.5
        sliderView.decelerationDistance = 2
        let width = contentView.frame.width - 80
        sliderView.itemSize = CGSize(width: contentView.frame.width - 80, height: width / 2 + 10)
        sliderView.interitemSpacing = 10
        sliderView.transformer = FSPagerViewTransformer(type: .linear)
    }

}

extension SliderCell : FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        sliderImagesName.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "HomeSliderView", at: index) as! HomeSliderView
        cell.imageView?.image = UIImage(named: sliderImagesName[index])
           return cell
    }

    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let cell = sliderView.cellForItem(at: index) as! HomeSliderView

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.transition(with: cell, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            cell.cardImg.image =  UIImage(named: "5205447")
        }
    }

//    private func randomIndex(range: Int, index: Int) -> Int {
//        var randomNum: Int
////        while let randomNum = self.randomIndex(range: range, index: index), randomNum != index {
////            randomNum = Int.random(in: 0...range)
////        }
//    }

}
