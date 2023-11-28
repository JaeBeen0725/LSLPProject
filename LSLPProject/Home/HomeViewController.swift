////
////  ViewController.swift
////  LSLPProject
////
////  Created by Jae Oh on 11/27/23.
////
//
//import UIKit
//import RxSwift
//import SnapKit
//
//class HomeViewController: BaseViewController {
//
//    lazy var noticeBoardTableViewController = {
//         let view = UITableView()
//         view.delegate = self
//        view.dataSource = self
//        view.prefetchDataSource = self
//        view.rowHeight = 200
//        view.register(HomeTableViewCell.self, forCellReuseIdentifier: "noticeBoardList")
//        return view
//     }()
//    
//
//    let noticeBoardTitle = {
//        let view = UILabel()
//        view.text = "일반 게시판"
//        view.font = .systemFont(ofSize: 22, weight: .semibold)
//        return view
//    }()
//    
//    lazy var noticeBoardButton = UIBarButtonItem(image: UIImage(systemName: Constant.line3Horizontal), style: .plain, target: self, action: #selector(noticeBoardButtonTapped))
//    lazy var searchButton = UIBarButtonItem(image: UIImage(systemName: Constant.magnifyingglass), style: .plain, target: self, action: #selector(searchButtonTapped))
//    
//    var postAPI = Post(value: [], count: 0, offset: 0, limit: 0, total: 0)
//    
//    var boardID: Int = 0
//    var offset: Int = 0
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        setupItemBar()
//        noticeBoardAPI(offset: offset)
//
//        
//    }
//    
//    override func configure() {
//        super.configure()
//        view.addSubview(noticeBoardTableViewController)
//        
//    }
//    
//    override func setConstraints() {
//        super.setConstraints()
//        noticeBoardTableViewController.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//        
//        noticeBoardTitle.snp.makeConstraints { make in
//            make.width.equalTo(100)
//        }
//    }
//    
//    
//
//    func setupItemBar() {
//     
//        self.navigationItem.leftBarButtonItems = [noticeBoardButton, UIBarButtonItem(customView: noticeBoardTitle)]
//        self.navigationItem.rightBarButtonItem = searchButton
//       
//    }
//    
//    func noticeBoardAPI( offset: Int) {
//        
//        Network.shared.requestConvertible(type: NoticeBoard.self, api: .join, offset: offset) { response in
//            switch response {
//            case .success(let success):
//                print("알림 보드 ok")
//                self.noticeBoardTitle.text = success.value.first?.displayName ?? ""
//                self.boardID = success.value.first?.boardID ?? 0
//                self.postAPI(boardId: success.value.first?.boardID ?? 0, offset: offset)
//
//                
//            case .failure(let failure):
//                print("알림 보드")
//                print(failure.errorDescription)
//            }
//        }
//        
//        
//    }
//    
//    func postAPI(boardId: Int, offset: Int) {
//        
//        Network.shared.requestConvertible(type: Post.self, api: .post(boardId: boardId, offset: offset), offset: offset) { response in
//            switch response {
//            case .success(let success):
//                self.postAPI.value.append(contentsOf: success.value)
//                self.noticeBoardTableViewController.reloadData()
//            case .failure(let failure):
//                print("요청 보드")
//                print(failure.errorDescription)
//            }
//        }
//        
//        
//        
//    }
//    
//
//    @objc
//    func noticeBoardButtonTapped() {
//       let cv = NoticeBoardViewController()
//        
//        present(cv, animated: true)
//    }
//    
//    @objc
//    func searchButtonTapped() {
////       let cv = SearchViewController()
//        
//      
////        navigationController?.pushViewController(cv, animated: true)
//    }
//    
//    
//
//}
//
//extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return postAPI.value.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noticeBoardList", for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
//        
//        let data = postAPI.value[indexPath.row]
//        
//        cell.noticBoardTitleLabel.text = data.title
//        cell.writerLabel.text = data.writer.displayName
//        cell.dateLabel.text = data.createdDateTime
//        cell.viewCountLabel.text = "\(data.viewCount)"
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//            if postAPI.value.count - 1 == indexPath.row {
//                
//                offset += 31
//            postAPI(boardId: boardID, offset: offset)
//                print("====", boardID, offset)
//            }
//        }
//    }
//    
//    
//    
//    
//}
//
