import Foundation

public class RestApiWrapper : IRestApiWrapper{
    
    public init(){
        
    }
    public func load<T, K>(resource: Resource<T, K>, completion: @escaping (Result<T?, NetworkError>) -> Void){
        
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.allHTTPHeaderFields = resource.httpHeader
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        
        session.dataTask(with: request) {  data, response, error in
            
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.serverError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options:[])
                print("Array: \(jsonArray)")
            }
            catch {
                print("Error: \(error)")
            }
            
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            
            
            
            
            if let dataModel = result {
                completion(.success(dataModel))
                
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
}
