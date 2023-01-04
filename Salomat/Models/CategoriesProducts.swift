//
//  CategoriesProducts.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 29/12/22.
//

import Foundation

struct CategoriesProducts: Codable {
    var category_id: String?
    var page: Int?
    var total_products: String?
    var categories_with_parents: CategoryWithParents?
    var category: ProductCategory?
    var category_products: CategoryProduct?
    
    enum CodingKeys: String, CodingKey {
        case category_id, page, total_products
        case categories_with_parents, category, category_products
    }
}

struct CategoryWithParents: Codable {
    var id: String?
    var category_name: String?
    var parent_id: String?
    var category_in_main: String?
    var order_id: String?
    var icon: String?
    var base_url: String?
    var parent_cat: ParentCat?
}

struct ParentCat: Codable {
    var id: String?
    var category_name: String?
    var parent_id: String?
    var category_in_main: String?
    var order_id: String?
    var icon: String?
}

struct ProductCategory: Codable {
    var id: String?
    var category_name: String?
    var parent_id: String?
    var category_in_main: String?
    var order_id: String?
    var icon: String?
    var base_url: String?
    var sub_cat: [Sub_Category]
    
}

struct Sub_Category: Codable {
    var id: String?
    var category_name: String?
    var parent_id: String?
    var category_in_main: String?
    var order_id: String?
    var icon: String?
    var sub_cat: [Sub_Categ]
}

struct Sub_Categ: Codable {
    
}

struct CategoryProduct: Codable {
    var products: [ProductsShowInfo]
}
