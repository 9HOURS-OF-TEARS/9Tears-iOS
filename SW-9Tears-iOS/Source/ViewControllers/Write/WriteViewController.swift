//
//  WriteViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit
import UITextView_Placeholder

final class WriteViewController: BaseViewController, View {
    
    typealias Reactor = WriteViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        static let viewSide = 16.f
        
        static let textFieldHeight = 50.f
        
        static let separatorHeight = 7.f
        
        static let buttonSize = 28.f
    }
    
    fileprivate struct Font {
        
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let titleTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "제목을 입력해주세요."
        $0.textColor = .none
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.tintColor = UIColor.init(named: "SecondColor")
    }
    
    let sendButton = UIButton(type: .system).then {
        $0.tintColor = .gray
        $0.setImage(UIImage.init(named: "SendIcon"), for: .normal)
    }
    
    let separator = UIView().then {
        $0.backgroundColor = .secondarySystemBackground
    }
    
    let contentTextView = UITextView().then {
        $0.placeholder = "내용을 입력해주세요."
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.tintColor = UIColor.init(named: "SecondColor")
        $0.textColor = .none
    }
    
    // MARK: - Inintializing
    init(reactor: Reactor) {
        super.init()
        defer {
            self.reactor = reactor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        self.title = "글 작성하기"
        
        self.view.addSubview(self.titleTextField)
        self.view.addSubview(self.sendButton)
        self.view.addSubview(self.separator)
        self.view.addSubview(self.contentTextView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.titleTextField.snp.makeConstraints {
            $0.top.equalToSafeArea(self.view)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.height.equalTo(Metric.textFieldHeight)
        }
        
        self.sendButton.snp.makeConstraints {
            $0.centerY.equalTo(self.titleTextField)
            $0.height.width.equalTo(Metric.buttonSize)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.left.equalTo(self.titleTextField.snp.right)
        }
        
        self.separator.snp.makeConstraints {
            $0.top.equalTo(self.titleTextField.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(Metric.separatorHeight)
        }
        
        self.contentTextView.snp.makeConstraints {
            $0.top.equalTo(self.separator.snp.bottom)
            $0.left.equalToSuperview().offset(Metric.viewSide - 3)
            $0.right.equalToSuperview().offset(Metric.viewSide - 3)
            $0.bottom.equalToSafeArea(self.view)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
        self.titleTextField.rx.text.orEmpty.asObservable()
            .map { Reactor.Action.updateTitle($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.contentTextView.rx.text.orEmpty.asObservable()
            .map { Reactor.Action.updateContents($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.sendButton.rx.tap
            .map { Reactor.Action.write }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

