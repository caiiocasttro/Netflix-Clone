//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

//TODO: Continue course from 2hr

import Foundation

struct Constant {
    static let API_KEY = "7002612006806800a96ce3a844cd9614"
    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError: Error {
    case failedTargetData
}

class APICaller {
    static let shared = APICaller()
    
    func gettingTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data  else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func gettingTrendingTv(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data  else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func gettingPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data  else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func gettingUpcoming(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data  else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func gettingTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data  else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
