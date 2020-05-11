//
//  ProtectDataUIView.swift
//  ProtectDataInBackground
//
//  Created by Cassio Sousa on 09/05/20.
//  Copyright © 2020 Cassio Sousa. All rights reserved.
//

import UIKit

class ProtectDataUIView: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    func setupFromNib(){
        let view = loadNib()
        addSubview(view)
        self.view = view
        self.backgroundColor = .systemPurple
    }
    
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
