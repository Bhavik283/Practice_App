//
//  ColorsDetailViewController.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit

var colors: [UIColor] = colorVal(count: 50).colors

class ColorsDetailViewController: UIViewController {
    
    static let buttons: [String] = ["play.circle", "house", "magnifyingglass", "arrow.down.to.line", "arrow.clockwise", "person", "play.rectangle"]
    
    private let colorTable: UITableView = {
        let table = UITableView()
        table.register(ColorTableViewCell.self, forCellReuseIdentifier: ColorTableViewCell.identifier)
        return table
    }()
    
    private var buttonView: ButtonView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Colors"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(colorTable)
        colorTable.delegate = self
        colorTable.dataSource = self
        
        buttonView = ButtonView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        buttonView?.delegate = self
        colorTable.tableHeaderView = buttonView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorTable.frame = view.bounds
    }
}

extension ColorsDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.identifier, for: indexPath) as? ColorTableViewCell else {return UITableViewCell()}
        let color = colors[indexPath.row]
        let label = color.hexString
        cell.configure(with: label, colour:color, image: ColorsDetailViewController.buttons.randomElement() ?? "play.rectangle")
        //cell.backgroundColor = color
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let color = colors[indexPath.row]
        let vc = SecondViewController()
        vc.color = color
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil
        ){ _ in
            let PrintAction = UIAction(title: "Print Code", subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off){ _ in
                print(colors[indexPath.row].hexString)
            }
            let SomeAction = UIAction(title: colors[indexPath.row].hexString, subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off){ _ in
                print(colors[indexPath.row].hexString)
            }
            return UIMenu(title: "This is a Menu", image: nil, identifier: nil, options: .displayInline, children: [PrintAction, SomeAction])
        }
        return config
    }
}

extension ColorsDetailViewController: ButtonViewDelegate {
    func didTapStoryButton() {
        let vc = StoryPreviewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func didTapRandomButton() {
        let vc = CardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
