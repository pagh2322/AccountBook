//
//  CategoryService.swift
//  AccountBook
//
//  Created by peo on 2022/08/25.
//

import Foundation
import SwiftUI

final class CategoryService {
    static func fetchCategories() -> [Category] {
        if isEmpty() {
            initialize()
        }
        return CoreDataManager.shared.fetchCategories()
    }
    
    static func isEmpty() -> Bool {
        return CoreDataManager.shared.fetchCategories().isEmpty
    }
    
    static func initialize() {
        var invest = CategoryModel()
        invest.name = "투자"
        invest.red = Color.cRed.components.red
        invest.green = Color.cRed.components.green
        invest.blue = Color.cRed.components.blue
        invest.opacity = Color.cRed.components.opacity
        saveCategory(categoryModel: invest)
        
        var food = CategoryModel()
        food.name = "식비"
        food.red = Color.cBlue.components.red
        food.green = Color.cBlue.components.green
        food.blue = Color.cBlue.components.blue
        food.opacity = Color.cBlue.components.opacity
        saveCategory(categoryModel: food)
        
        var transparent = CategoryModel()
        transparent.name = "교통비"
        transparent.red = Color.cBlack.components.red
        transparent.green = Color.cBlack.components.green
        transparent.blue = Color.cBlack.components.blue
        transparent.opacity = Color.cBlack.components.opacity
        saveCategory(categoryModel: transparent)
    }
    
    static func saveCategory(categoryModel: CategoryModel) {
        let _ = convertToCategory(categoryModel)
        
        CoreDataManager.shared.saveContext()
    }
    
    static func saveCategory(category: Category) {
        CoreDataManager.shared.saveContext()
    }
    
    static func deleteCategory(category: Category) {
        CoreDataManager.shared.deleteCategory(category: category)
    }
    
    static func convertToCategory(_ categoryModel: CategoryModel) -> Category {
        let category = Category(context: CoreDataManager.shared.context)
        category.name = categoryModel.name
        category.red = categoryModel.red
        category.green = categoryModel.green
        category.blue = categoryModel.blue
        category.opacity = categoryModel.opacity
        
        return category
    }
    
    static func fetchColor(categoryName: String) -> Color {
        let category = CoreDataManager.shared.fetchCategory(name: categoryName)
        return Color(red: category?.red ?? 0, green: category?.green ?? 0, blue: category?.blue ?? 0, opacity: category?.opacity ?? 0)
    }
}
