//
//  RankTextField.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit
import RxSwift
import RxCocoa

final class RankTextField: UIView {
    
    // MARK: - Properties
    let disposeBag = DisposeBag()

    // MARK: - Constants
    fileprivate struct Metric {
        // textField
        static let textFieldTop = 5.f
        static let textFieldSide = 7.f
        
        // separator
        static let separatorTop = 0.f
        static let separatorHeight = 1.f
    }
    
    fileprivate struct Font {
        static let textFieldFont = UIFont(name: "NotoSansKR-Regular", size: 13)
        static let eventFont = UIFont.systemFont(ofSize: 10, weight: .medium)
    }
    
    // MARK: - UI
    
    let textField = UITextField().then {
        $0.clearButtonMode = .whileEditing
        $0.clearButtonTintColor = UIColor.init(named: "DisabledColor")
        $0.autocorrectionType = .no
        $0.font = Font.textFieldFont
        $0.autocapitalizationType = .none
        $0.tintColor = UIColor.tintColor
    }
    
    let separatorView = UIView().then {
        $0.backgroundColor = UIColor.init(named: "DisabledColor")
    }
    
    // MARK: - Initializing
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.addSubview(self.textField)
        self.addSubview(self.separatorView)
        
        self.textField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Metric.textFieldSide)
            $0.right.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        self.separatorView.snp.makeConstraints {
            $0.height.equalTo(Metric.separatorHeight)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(self.textField.snp.bottom).offset(Metric.separatorTop)
        }
    }
    
    // MARK: - Configuring
    func bind() {
        
        self.textField.rx.controlEvent([.editingDidBegin]).asObservable()
            .subscribe(onNext: { [weak self] in
                UIView.animate(withDuration: 0.3) {
                    self?.separatorView.backgroundColor = UIColor.tintColor
                }
            })
            .disposed(by: disposeBag)
        
        self.textField.rx.controlEvent([.editingDidEnd]).asObservable()
            .subscribe(onNext: { [weak self] in
                UIView.animate(withDuration: 0.3) {
                    self?.separatorView.backgroundColor = UIColor.init(named: "DisabledColor")
                }
            })
            .disposed(by: disposeBag)
    }
    
}

