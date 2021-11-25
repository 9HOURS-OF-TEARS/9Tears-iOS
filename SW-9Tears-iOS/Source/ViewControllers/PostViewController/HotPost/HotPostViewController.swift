//
//  HotPostViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit
import RxDataSources
import ReusableKit
import WMSegmentControl

final class HotPostViewController: BaseViewController, View {
    
    typealias Reactor = HotPostViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        static let viewSide = 10.f
    }
    
    fileprivate struct Font {
        
    }
    
    fileprivate struct Style {
        
    }
    
    fileprivate struct Reusable {
        static let postCell = ReusableCell<PostListTableViewCell>()
    }
    
    // MARK: - Properties
    fileprivate let dataSource: RxTableViewSectionedReloadDataSource<PostViewSection>
    
    // MARK: - UI
    let control = WMSegment(frame: .zero).then {
        $0.type = .normal
        $0.isRounded = true
        $0.buttonTitles = "오늘,이번 주,이번 달,이번 해"
        $0.textColor = .black
        $0.selectorTextColor = .white
        $0.selectorColor = UIColor.init(named: "SecondColor")!
    }
    
    let tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(Reusable.postCell)
    }
    
    // MARK: - Inintializing
    init(reactor: Reactor) {
        self.dataSource = Self.dataSourceFactory()
        super.init()
        
        defer {
            self.reactor = reactor
        }
    }
    
    private static func dataSourceFactory() -> RxTableViewSectionedReloadDataSource<PostViewSection> {
        return .init(configureCell: { dataSource, tableView, indexPath, sectionItem in
            switch sectionItem {
            case let .post(reactor):
                let cell = tableView.dequeue(Reusable.postCell, for: indexPath)
                cell.reactor = reactor
                return cell
            }
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        self.view.addSubview(self.control)
        self.view.addSubview(self.tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.control.snp.makeConstraints {
            $0.top.equalToSafeArea(self.view).offset(10)
            $0.height.equalTo(30)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.control.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.bottom.equalToSafeArea(self.view)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
        self.rx.viewDidAppear.asObservable()
            .map { _ in Reactor.Action.refresh(self.reactor?.currentState.currentIdx ?? 0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // segment
        self.control.onValueChanged = { [weak self] index in
            guard let self = self else { return }
            _ = Observable.just(Reactor.Action.refresh(index))
                .bind(to: reactor.action)
                .disposed(by: self.disposeBag)
        }
        
        reactor.state.map { $0.sections }
            .bind(to: self.tableView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
        
        // View
        self.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        self.tableView.rx.itemSelected
            .subscribe(onNext: { [weak tableView] indexPath in
                tableView?.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
}

extension HotPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
