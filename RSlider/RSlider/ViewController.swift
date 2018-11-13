//
//  ViewController.swift
//  Slider
//
//  Created by 財部圭太 on 2018/10/28.
//  Copyright © 2018年 財部圭太. All rights reserved.
//  参考URL
//	ScrollViewへの画像の追加の参考
//  http://norche.hatenablog.com/entry/2017/11/15/233807
//	画像の切り抜き
//	http://program-life.com/675
//	croppingについて（Apple公式）
//	https://developer.apple.com/documentation/coregraphics/cgimage/1454683-cropping

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var Right: UIView!
	
	@IBOutlet weak var scroll: UIScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		// UIScrollViewの大きさを3倍に
		scroll.contentSize = CGSize(width: scroll.bounds.width * 3, height: scroll.bounds.height)
		// スクロールするたびにきっちり止まるようにする。
		scroll.isPagingEnabled = true
		// 1枚目の画像
		let firstImage:UIImage = UIImage(named: "IMG_7967.png")!
		// 左上から2900,3000で切り抜いている。
		let first = trimmingImage(firstImage, trimmingArea: CGRect(x: 0, y: 0, width: 2900, height: 3000))
		let firstImageView = UIImageView(image: first)
		firstImageView.frame = CGRect(x: scroll.bounds.width * 0.0, y: 0.0, width: scroll.bounds.width, height: scroll.bounds.width)
		firstImageView.contentMode = UIScrollView.ContentMode.scaleAspectFit
		scroll.addSubview(firstImageView)
		
		// 2枚目の画像
		let secondImage:UIImage = UIImage(named: "IMG_7978.png")!
		let second = trimmingImage(secondImage, trimmingArea: CGRect(x: 0, y: 0, width: 2900, height: 3000))
		let secondImageView = UIImageView(image: second)
		secondImageView.frame =  CGRect(x: scroll.bounds.width * 1.0, y: 0.0, width: scroll.bounds.width, height: scroll.bounds.width)
		secondImageView.contentMode = UIScrollView.ContentMode.scaleAspectFit
		scroll.addSubview(secondImageView)
		
		// 3枚目の画像
		let thirdImage:UIImage = UIImage(named: "IMG_8007.png")!
		let third = trimmingImage(thirdImage, trimmingArea: CGRect(x: 0, y: 0, width: 2900, height: 3000))
		let thirdImageView = UIImageView(image: third)
		thirdImageView.frame =  CGRect(x: scroll.bounds.width * 2.0, y: 0.0, width: scroll.bounds.width, height: scroll.bounds.width)
		thirdImageView.contentMode = UIScrollView.ContentMode.scaleAspectFit
		scroll.addSubview(thirdImageView)
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	func trimmingImage(_ image: UIImage, trimmingArea: CGRect) -> UIImage {
		let imgRef = image.cgImage?.cropping(to: trimmingArea)
		let trimImage = UIImage(cgImage: imgRef!, scale: image.scale, orientation: image.imageOrientation)
		return trimImage
	}
}



