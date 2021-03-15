//
//  to_doTests.swift
//  to-doTests
//
//  Created by mert.kutluca on 12.03.2021.
//

import XCTest
@testable import to_do

class to_doTests: XCTestCase {
    
    private var mockRepo: MockToDoRepository!
    
    private var toDoListVM: ToDoListVM!
    private var toDoDetailVM: ToDoDetailVM!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockRepo = MockToDoRepository()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        // MARK: - ToDoList
        // Given
        let mockTodos: [ToDoDTO] = [
            .init(_id: "1",
                  title: "Title1",
                  detail: "Detail1",
                  dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                  state: .active),
            .init(_id: "2",
                  title: "Title2",
                  detail: "Detail2",
                  dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                  state: .active),
            .init(_id: "3",
                  title: "Title3",
                  detail: "Detail3",
                  dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                  state: .active),
            .init(_id: "4",
                  title: "Title4",
                  detail: "Detail4",
                  dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                  state: .completed),
            .init(_id: "5",
                  title: "Title5",
                  detail: "Detail5",
                  dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                  state: .active)
        ]
        
        //When
        mockRepo.mockTodos = mockTodos
        toDoListVM = ToDoListVM(repo: mockRepo)
        
        // Then
        XCTAssertEqual(toDoListVM.getNumberOfItem(for: .active), 4)
        XCTAssertEqual(toDoListVM.getNumberOfItem(for: .completed), 1)
        
        let expectedActiveTodos: [ToDoListPresentation] = [
            ToDoListPresentation(title: "Title1",
                                 detail: "Detail1",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                 state: .active),
            ToDoListPresentation(title: "Title2",
                                 detail: "Detail2",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                 state: .active),
            ToDoListPresentation(title: "Title3",
                                 detail: "Detail3",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                 state: .active),
            ToDoListPresentation(title: "Title5",
                                 detail: "Detail5",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                 state: .active),
        ]
        
        let expectedCompletedTodos: [ToDoListPresentation] = [
            ToDoListPresentation(title: "Title4",
                                 detail: "Detail4",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                 state: .completed),
        ]
        
        expectedActiveTodos.enumerated().forEach {
            XCTAssertEqual($0.element, toDoListVM.getItem(at: $0.offset, for: .active))
        }
        
        expectedCompletedTodos.enumerated().forEach {
            XCTAssertEqual($0.element, toDoListVM.getItem(at: $0.offset, for: .completed))
        }
        
        // MARK: - ToDoDetail
        // Given
        let mockTodo: ToDoDTO = ToDoDTO(_id: "1",
                                        title: "Title1",
                                        detail: "Detail1",
                                        dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                        state: .active)
        
        // When
        toDoDetailVM = ToDoDetailVM(toDo: mockTodo, repo: mockRepo)
        toDoDetailVM.load()
        
        // Then
        let expectedTodo: ToDoDetailPresentation = ToDoDetailPresentation(title: "Title1",
                                                                          detail: "Detail1",
                                                                          dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                                                          state: .active,
                                                                          isNewTodo: false)
        
        XCTAssertEqual(expectedTodo, toDoDetailVM.forcedItem)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

private class MockToDoRepository: ToDoRepositoryProtocol {
    
    var mockTodos: [ToDoDTO] = []
    
    func save(dto: ToDoDTO) {
        return
    }
    
    func remove(_id: String) {
        return
    }
    
    func getAll(filter: String?) -> [ToDoDTO] {
        switch filter {
        case "state == 0":
            return mockTodos.filter {
                $0.state == .active
            }
        case "state == 1":
            return mockTodos.filter {
                $0.state == .completed
            }
        default:
            return []
        }
    }
    
    func get(key: String) -> ToDoDTO? {
        return mockTodos.first {
            $0._id == key
        }
    }
    
    func subscribe(filter: String?) {
        return
    }
    
}
