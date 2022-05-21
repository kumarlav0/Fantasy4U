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
        sliderView.itemSize = CGSize(width: contentView.frame.width - 80, height: 140)
        sliderView.interitemSpacing = 10
        sliderView.transformer = FSPagerViewTransformer(type: .linear)
        sliderView.round(radius: 10)
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

        DispatchQueue.main.async {

            UIView.transition(with: cell, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}
