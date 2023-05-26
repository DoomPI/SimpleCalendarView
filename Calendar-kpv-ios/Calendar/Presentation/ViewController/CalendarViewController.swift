//
//  CalendarViewController.swift
//  Calendar-kpv-ios
//
//  Created by Роман Ломтев on 26.05.2023.
//

import UIKit

class CalendarViewController: UIViewController {
    
    private let currentDateLabel = UILabel()
    
    private let calendar = Calendar.current
    private let startDate: Date
    private var currentDate: Date
    
    init() {
        let startDate = Date()
        self.startDate = startDate
        self.currentDate = startDate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupCalendarView()
    }
    
    private func setupCalendarView() {
        view.addSubview(currentDateLabel)
        currentDateLabel.pin(to: view)
        currentDateLabel.font = .systemFont(ofSize: 26, weight: .bold)
        currentDateLabel.textAlignment = .center
        
        setupGestureRecognizer()
        
        refreshCalendarView()
    }
    
    private func refreshCalendarView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE. d MMM yyyy"
        
        UIView.animate(withDuration: 0.5) {
            self.currentDateLabel.text = dateFormatter.string(from: self.currentDate)
            
            if self.currentDate.isSameDay(self.startDate) {
                self.view.backgroundColor = .black
                self.currentDateLabel.textColor = .white
            } else {
                self.view.backgroundColor = .white
                self.currentDateLabel.textColor = .black
            }
        }
    }
    
    private func setupGestureRecognizer() {
        
        let rightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onRightSwap))
        rightGestureRecognizer.direction = .left
        view.addGestureRecognizer(rightGestureRecognizer)
        
        let leftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onLeftSwap))
        leftGestureRecognizer.direction = .right
        view.addGestureRecognizer(leftGestureRecognizer)
        
        let upGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onUpSwap))
        upGestureRecognizer.direction = .down
        view.addGestureRecognizer(upGestureRecognizer)
        
        let downGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onDownSwap))
        downGestureRecognizer.direction = .up
        view.addGestureRecognizer(downGestureRecognizer)
    }
    
    
    @objc private func onRightSwap(_ gesture: UISwipeGestureRecognizer) {
        print("onRightSwap")
        guard let newCurrentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) else {
            return
        }
        
        currentDate = newCurrentDate
        refreshCalendarView()
    }
    
    @objc private func onLeftSwap(_ gesture: UISwipeGestureRecognizer) {
        print("onLeftSwap")
        guard let newCurrentDate = calendar.date(byAdding: .day, value: -1, to: currentDate) else {
            return
        }
        
        currentDate = newCurrentDate
        refreshCalendarView()
    }
    
    @objc private func onUpSwap(_ gesture: UISwipeGestureRecognizer) {
        print("onUpSwap")
        guard let newCurrentDate = calendar.date(byAdding: .day, value: -7, to: currentDate) else {
            return
        }
        
        currentDate = newCurrentDate
        refreshCalendarView()
    }
    
    @objc private func onDownSwap(_ gesture: UISwipeGestureRecognizer) {
        print("onDownSwap")
        guard let newCurrentDate = calendar.date(byAdding: .day, value: 7, to: currentDate) else {
            return
        }
        
        currentDate = newCurrentDate
        refreshCalendarView()
    }
}
