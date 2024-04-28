//
//  ViewController.swift
//  Settings(HW)
//
//  Created by Yernur Adilbek on 10/19/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private lazy var top: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 19/255, green: 191/255, blue: 197/255, alpha: 1)
        return view
    }()
    
    private lazy var settings: UILabel = {
       let label = UILabel()
        label.text = "Settings"
        label.textColor = .systemBackground
        return label
    }()
    
    private lazy var back: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(systemName: "arrow.left")
        back.tintColor = .systemBackground
        return back
    }()
    
    let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var icons: [UIImage?] = [UIImage(systemName: "gear"), UIImage(systemName: "bell.fill"), UIImage(systemName: "globe"), UIImage(systemName: "newspaper"), UIImage(systemName: "person.crop.circle"), UIImage(systemName: "creditcard"), UIImage(systemName: "questionmark.circle.fill"), UIImage(systemName: "exclamationmark.triangle.fill"), UIImage(systemName: "doc.fill"), UIImage(systemName: "exclamationmark.circle.fill"), UIImage(systemName: "rectangle.portrait.and.arrow.right.fill"),]
    
    private var labels: [String?] = ["App Settings", "Notification Settings", "Language", "Feed Preferences", "Account Settings", "Payment Settings", "Help Center", "Report a Problem", "Terms and Policies", "About", "Logout"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = icons[indexPath.item]
        cell.imageView?.tintColor = .gray
        cell.textLabel?.text = labels[indexPath.item]
        
        let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.forward"))
        chevronImageView.tintColor = .gray
        cell.accessoryView = chevronImageView
        
        if indexPath.item  == icons.count-1{
            cell.imageView?.tintColor = .red
        }
        
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - setupUI
extension ViewController{
    func setupUI(){
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        view.addSubview(top)
        top.addSubview(settings)
        top.addSubview(back)
        view.addSubview(myTableView)
    }
    
    func setupConstraints(){
        top.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        settings.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
        back.snp.makeConstraints{make in
            make.centerY.equalTo(settings)
            make.leading.equalToSuperview().offset(20)
        }
        
        myTableView.snp.makeConstraints{ make in
            make.top.equalTo(top.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
