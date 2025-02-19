//
//  File.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 24/02/23.
//

import UIKit
import WebKit

class ProfileTestView: BaseView {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var subView1: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    lazy var subView2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var subView3: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var profileImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .cyan
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do dito cujo"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var dataView: WKWebView = {
        let view = WKWebView()
        return view
    }()
//
//    lazy var subView4: UIView = {
//        let view = UIView()
//        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        view.backgroundColor = UIColor.black
//        return view
//    }()
    
    override func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        // Adiciona itens dentro da StackView
        stackView.addArrangedSubview(subView1)
        stackView.addArrangedSubview(subView2)
        stackView.addArrangedSubview(subView3)
        
        subView1.addSubview(profileImageView)
        subView1.addSubview(profileNameLabel)
        subView2.addSubview(dataView)
//        stackView.addArrangedSubview(subView4)
//        addArrangedAllSubviews(view: subView1, subView2, subView3, subView4)
    }
    
    override func setContrainsts() {
        scrollView.anchor(
            top: self.topAnchor,
            leading: safeAreaLayoutGuide.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: safeAreaLayoutGuide.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: bounds.size.width, height: bounds.size.height))
        
        stackView.anchor(
            top: scrollView.topAnchor,
            leading: scrollView.leadingAnchor,
            bottom: scrollView.bottomAnchor,
            trailing: scrollView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        profileImageView.anchor(
            top: subView1.topAnchor,
            leading: nil,
            bottom: subView1.bottomAnchor,
            trailing: nil,
            padding: .init(top: 75, left: 0, bottom: 75, right: 0),
            size: .init(width: 150, height: 150))
        profileImageView.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        
        profileNameLabel.anchor(
            top: profileImageView.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0),
            size: .init(width: 250, height: 40))
        profileNameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        
        dataView.anchor(top: subView2.topAnchor, leading: subView2.leadingAnchor, bottom: subView2.bottomAnchor, trailing: subView2.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: subView2.bounds.width, height: subView2.bounds.height))
        
    }
    
    // Recebe como parâmetro, lista de subviews, percorre a lista e adiciona dentro da stack
    func addArrangedAllSubviews(view: UIView...) {
        for i in view {
            stackView.addArrangedSubview(i)
        }
    }
}

//
//  ProfileScreenView.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 24/02/23.
//

class ProfileTest1: BaseView {
    
    let cellId = "cellId"
    
    
    var user: User? {
        didSet {
            profileImageView.downloaded(from: URL(string: user?.avatarUrl ?? "")!)
            profileNameLabel.text = user?.name
        }
    }
    
    var heightTableView: CGFloat? {
        didSet {
            tableView.heightAnchor.constraint(equalToConstant: heightTableView ?? 0.0).isActive = true
        }
    }
    
    // ScrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    // StackView
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    // Container 1 - Imagem Perfil | Nome do Perfil
    lazy var subView1: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    
    // Container 2 - Web View
    lazy var subView2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 225).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    
    // Container 3 - Table View com lista de repositórios
    lazy var subView3: UIView = {
        let view = UIView()
        // Removi altura fixa do container
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do dito cujo"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var dataView: WKWebView = {
        let view = WKWebView()
//        view.load(URLRequest(url: URL(string: "https://github-readme-stats.vercel.app/api/top-langs/?username=kaueludovico&layout=compact&langs_count=7&theme=dracula")!))
        view.pageZoom = 3.28
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        /*
         * Desativa Scroll e zera todas as estimativas iniciais
         */
        tableView.isScrollEnabled = false
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    
    
    override func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
//        stackView.addArrangedSubview(subView1)
//        stackView.addArrangedSubview(subView2)
//        stackView.addArrangedSubview(subView3)
        
        addArrangedAllViews(views: subView1, subView2, subView3)
        
        subView1.addSubview(profileImageView)
        subView1.addSubview(profileNameLabel)
        subView2.addSubview(dataView)
        subView3.addSubview(tableView)
    }
    
    
    override func setContrainsts() {
        scrollView.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: safeAreaLayoutGuide.leadingAnchor,
            bottom: safeAreaLayoutGuide.bottomAnchor,
            trailing: safeAreaLayoutGuide.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: bounds.size.width, height: bounds.size.height))
        
        stackView.anchor(
            top: scrollView.topAnchor,
            leading: scrollView.leadingAnchor,
            bottom: scrollView.bottomAnchor,
            trailing: scrollView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // Items dentro dos containers
        
        profileImageView.anchor(
            top: subView1.topAnchor,
            leading: nil,
            bottom: subView1.bottomAnchor,
            trailing: nil,
            padding: .init(top: 75, left: 0, bottom: 75, right: 0),
            size: .init(width: 150, height: 150))
        profileImageView.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        
        profileNameLabel.anchor(
            top: profileImageView.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0),
            size: .init(width: 250, height: 40))
        profileNameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        
        dataView.anchor(
            top: subView2.topAnchor,
            leading: subView2.leadingAnchor,
            bottom: subView2.bottomAnchor,
            trailing: subView2.trailingAnchor,
            padding: .init(top: 10, left: 10, bottom: 10, right: 10),
            size: .init(width: subView2.bounds.width, height: subView2.bounds.height))
        
        tableView.anchor(
            top: subView3.topAnchor,
            leading: subView3.leadingAnchor,
            bottom: subView3.bottomAnchor,
            trailing: subView3.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    func addArrangedAllViews(views: UIView...) {
        for i in views {
            stackView.addArrangedSubview(i)
        }
    }
}



