//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

import Foundation

enum JuiceMakerError: Error, Equatable {
    enum Other: Error {
        case unknown
    }
    case notFoundFruit
    case notEnoughFruitAmount(fruit: String)
    case unknown(Other)
    
    static func printOutput(of error: Error) {
        if let error = error as? JuiceMakerError,
           let errorDescription = error.errorDescription {
            print(errorDescription)
        }
    }
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFoundFruit:
            return "과일을 찾을 수 없습니다."
        case .notEnoughFruitAmount(let fruit):
            return "\(fruit)의 양이 부족합니다. 다시 주문해주세요."
        case .unknown(.unknown):
            return "Unknown Error"
        }
    }
}
