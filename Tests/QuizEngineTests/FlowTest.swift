//
//  FlowTest.swift
//  
//
//  Created by João Tribuzy on 25/09/23.
//

import XCTest
@testable import QuizEngine

final class FlowTest: XCTestCase {

    func test_start_withNoQuestion_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestionCount, 0)
    }
    
    func test_start_withNoQuestion_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestionCount, 1)
    }
    
    func test_start_withNoQuestion_routesToCorrectQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestion, "Q1")
    }

    class RouterSpy: Router {
        var routedQuestionCount: Int = 0
        var routedQuestion: String?
        
        func routeTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
        }
    }
}
