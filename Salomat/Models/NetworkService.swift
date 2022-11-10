//
//  NetworkService.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 28/09/22.
//

import Foundation

class NetworkService {
    
    func fetchData(urlString: String, completion: @escaping(Result<ProdsOfTheDay, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(ProdsOfTheDay.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func fetchFromApi(urlString: String, completion: @escaping(Result<CategoriesForMainPage, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(CategoriesForMainPage.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func fetchBlogsData(urlString: String, completion: @escaping(Result<Blog, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(Blog.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func fetchBanners(urlString: String, completion: @escaping(Result<MainSliders, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(MainSliders.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func show(urlString: String, completion: @escaping(Result<Show, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(Show.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func productShow(urlString: String, completion: @escaping(Result<ProductsShow, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(ProductsShow.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func category(urlString: String, completion: @escaping(Result<Category, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(Category.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func search(urlString: String, completion: @escaping(Result<Search, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(Search.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    func sales(urlString: String, completion: @escaping(Result<Sales, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(Sales.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func login(urlString: String, completion: @escaping(Result<LoginData, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(LoginData.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }

}
