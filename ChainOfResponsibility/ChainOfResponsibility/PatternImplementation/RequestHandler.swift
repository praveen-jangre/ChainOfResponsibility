//
//  RequestHandler.swift
//  ChainOfResponsibility
//
//  Created by Praveen Jangre on 26/06/2025.
//

import Foundation


protocol RequestHandler {
    associatedtype RequestType
    var next: AnyRequestHandler? {get set}
    
    func handle(request: RequestType)
}

class AnyRequestHandler {
    private let didHandle: (Any) -> Bool
    
    var next: AnyRequestHandler?
    
    init<T: RequestHandler> (_ handler: T) {
        didHandle = { request in
            if let request = request as? T.RequestType {
                handler.handle(request: request)
                return true
            }
            return false
        }
    }
    
    func handle(request: Any) {
        if !didHandle(request){
            next?.handle(request: request)
        }
    }
}


let handlerChain = buildHandlerChain()

// Define concrete handlers for different types
class DataHandler: RequestHandler{
    var next: AnyRequestHandler?
    
    func handle(request: Data) {
        print("Request processed by DataHandler: \(request)")
    }
}

class StringHandler: RequestHandler {
    var next: AnyRequestHandler?
    
    func handle(request: String) {
        print("Request processed by StringHandler: \(request)")
    }
}

class DateHandler: RequestHandler {
    var next: AnyRequestHandler?
    
    func handle(request: Date) {
        print("Request processed by DateHandler: \(request)")
    }
}

class DefaultHandler: RequestHandler {
    var next: AnyRequestHandler?
    
    func handle(request: Any)  {
        print("No handler available for \(type(of: request)) request with value \(request)")
    }
}


func buildHandlerChain() -> AnyRequestHandler {
    let dataHandler = AnyRequestHandler(DataHandler())
    let stringHandler = AnyRequestHandler(StringHandler())
    let dateHandler = AnyRequestHandler(DateHandler())
    let defaultHandler = AnyRequestHandler(DefaultHandler())
    
    dataHandler.next = stringHandler
    stringHandler.next = dateHandler
    dateHandler.next = defaultHandler
    
    return dataHandler
    
}


// Testing
func testChainOfResponsibility() {
    
    let data = Data(repeating: 0, count: 15)
    process(request: data)
    
    let string = "Praveen Jangre"
    process(request: string)
    
    let todayDate = Date()
    process(request: todayDate)
    
    let intValue: Int = 56
    process(request: intValue)
    
}


func process(request: Any) {
    handlerChain.handle(request: request)
}
