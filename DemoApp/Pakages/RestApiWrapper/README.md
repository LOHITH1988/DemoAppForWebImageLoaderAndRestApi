# RestApiWrapper

A generic class over NSUrlSession which will decode and send custom model 

 
## Changelog
v1.0.0 (demo)


## Suported Methods

public enum HttpMethod: String{
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case update = "UPDATE"
    case delete = "DELETE"
    
}




## How to Use

    let repoService : IRestApiWrapper = RestApiWrapper()
    
    repoService.load(resource: getResource()) { result in
            switch result{
            case .failure( _ ):
                
                completion(nil, "Some Error Occured")
                
                
            case .success(let data):
                
                completion(data, nil)

               
                
            }
        }
    
    
    private func getResource() -> Resource<[PosterDetail], InputParamsModel>{
        let inputParamsModel = InputParamsModel()
        return Resource<[PosterDetail] , InputParamsModel>(url: url , httpMethod: .get,httpHeader:headers , parameterModel : inputParamsModel  )
    }
    
   
   
    struct  PosterDetail : Codable{
    
    }
    
    struct  InputParamsModel : Codable{
    
    }
    
