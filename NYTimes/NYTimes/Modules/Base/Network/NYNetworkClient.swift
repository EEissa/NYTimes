//
//  NYNetworkClient.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import Alamofire
import ObjectMapper

typealias NetworkResultClosure = (NYBaseModel?, NYError?) -> Void

class NYNetworkClient: NSObject {
  
  static var client: Alamofire.SessionManager =  {
    
    let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
    let configuration = URLSessionConfiguration.default
    let man = Alamofire.SessionManager(
      configuration: configuration,
      serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
    )
    return man
  }()
  
  
  class func startRequest<T: NYBaseModel>(requestConfiguration: NYNetworkRequest,
                                          withMappingClass objectClass: T?,
                                          completion completionClousure: NetworkResultClosure?) -> Void {
    client.request(requestConfiguration.completeURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                   method: requestConfiguration.requestMethod,
                   parameters: requestConfiguration.parameters,
                   encoding: requestConfiguration.encoding,
                   headers: requestConfiguration.headers).responseJSON{ (response: DataResponse<Any>) in
                    switch response.result {
                    case .success(_):
                      if let data = response.result.value {
                        print(data)
                        let model: NYBaseModel = Mapper<T>().map(JSONObject: data, toObject: objectClass!)
                        completionClousure!(model,nil)
                      }
                      break
                    case .failure(_):
                        completionClousure!(nil, NYError(response.result.error))
                      break
                    }
    }
  }
}
