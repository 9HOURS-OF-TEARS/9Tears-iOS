//
//  NewPostViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit
import RxDataSources
import ReusableKit

final class NewPostViewController: BaseViewController, View {
    
    typealias Reactor = NewPostViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        
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
        
        self.view.addSubview(self.tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.tableView.snp.makeConstraints {
            $0.edges.equalToSafeArea(self.view)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        self.rx.viewDidAppear.asObservable()
            .map { _ in Reactor.Action.refresh }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
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

extension NewPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
