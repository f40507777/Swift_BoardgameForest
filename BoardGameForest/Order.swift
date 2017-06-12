//
//  Order.swift
//  BoardGameForest
//
//  Created by Finn on 2017/6/4.
//  Copyright © 2017年 Finn. All rights reserved.
//

import UIKit

enum Table: String {
    case A1 = "A1"
    case A2 = "A2"
    case A3 = "A3"
    case B1 = "B1"
    case B2 = "B2"
    case B3 = "B3"
    case B4 = "B4"
    case B5 = "B5"
    case C1 = "C1"
    case C2 = "C2"
}

class Order: NSObject {
    lazy var createTime: String = {
        let date = Date()
        let inFormatter = DateFormatter()
        inFormatter.locale = NSLocale(localeIdentifier: "zh_TW") as Locale!
        inFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return inFormatter.string(from: date)
    }()
    
    var totalAmount: Int = 0
    
    var mealsList: [Dictionary<String, Bool>] = []
    
    var tableNumber: Table?
    
    private var orderMeals: [Meal] = []

    override init() {
        super.init()
    }
    
    init(meals: [Meal], table: Table) {
        super.init()
        
        orderMeals = meals
        mealsList = getMealsList()
        totalAmount = calculationTotalAmount() - comboDiscount()
        tableNumber = table
    }
    
    init(orderDic: Dictionary<String, Any>) {
        super.init()
        
        createTime = orderDic["createTime"] as! String
        totalAmount = orderDic["totalAmount"] as! Int
        mealsList = orderDic["mealsList"] as! [Dictionary<String, Bool>]
        tableNumber = Table.init(rawValue: orderDic["tableNumber"] as! String)
    }

    func getDictionary() -> Dictionary<String, Any> {
        
        return ["createTime": createTime,
                "totalAmount": totalAmount,
                "mealsList": mealsList,
                "tableNumber": tableNumber!.rawValue]
    }
    
    private func getMealsList() -> [Dictionary<String, Bool>] {
        var tempList: [Dictionary<String, Bool>] = []
        for mealName in orderMeals.map({$0.name!}) {
            tempList.append([mealName:false])
        }
        
        return tempList
    }
    
    private func calculationTotalAmount() -> Int {
        return orderMeals.map({$0.price}).reduce(0){($0 + $1)}
    }

    private func comboDiscount() -> Int {
        let dessertMealCount = orderMeals.filter({$0.type == MealType.Dessert.rawValue}).count
        let notDessertMealCount = orderMeals.count - dessertMealCount
        
        return min(dessertMealCount, notDessertMealCount) * 20
    }
}
