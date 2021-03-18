//
//  to_doTests.swift
//  to-doTests
//
//  Created by mert.kutluca on 12.03.2021.
//

import XCTest
@testable import to_do
import BookAPI

class to_doTests: XCTestCase {
    
    private var mockRepo: MockToDoRepository!
    private var mockNetwork: MockNetworkManager!
    private var mockDownloader: MockImageDownloadManager!
    private var mockBookListVC: MockBookListVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockRepo = MockToDoRepository()
        mockNetwork = MockNetworkManager()
        mockDownloader = MockImageDownloadManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testToDoList() throws {
        // - Given
        // MockRepo is given
        
        // - When
        let toDoListVM = ToDoListVM(repo: mockRepo)
        
        // - Then
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
    }
    
    func testToDoDetail() throws {
        // - Given
        let mockTodo: ToDoDTO = ToDoDTO(_id: "1",
                                        title: "Title1",
                                        detail: "Detail1",
                                        dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                        state: .active)
        
        // - When
        let toDoDetailVM = ToDoDetailVM(toDo: mockTodo, repo: mockRepo)
        toDoDetailVM.load()
        
        // - Then
        let expectedTodo: ToDoDetailPresentation = ToDoDetailPresentation(title: "Title1",
                                                                          detail: "Detail1",
                                                                          dueDate: Date(timeIntervalSince1970: TimeInterval(1615799006)),
                                                                          state: .active,
                                                                          isNewTodo: false)
        
        XCTAssertEqual(expectedTodo, toDoDetailVM.forcedItem)
    }
    
    func testBookList() throws {
        // - Given
        // mockNetwork and mockDownloader is given
        
        // - When
        let bookListVM = BookListVM(networkManager: mockNetwork,
                                    imageDownloadManager: mockDownloader)
        mockBookListVC = MockBookListVC()
        bookListVM.delegate = mockBookListVC
        bookListVM.load()
        bookListVM.startDownloadImage(at: 1)
    }

}

private final class MockBookListVC: BookListVMOutputDelegate {
    
    func booksLoaded() {
        print("Books loaded")
    }
    
    func imageDownloaded(at index: Int) {
        print("Image downloaded at ", index)
    }
    
    
}

private final class MockNetworkManager: NetworkManageerProtocol {
    
    private let mockBooks: [Book] = [
        .init(artists: ["W. Frank Ableson", "Charlie Collins", "Robi Sen"],
              name: "Unlocking Android",
              imageUrl: URL(string: "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson.jpg")),
        .init(artists: ["W. Frank Ableson", "Robi Sen"],
              name: "Android in Action, Second Edition",
              imageUrl: URL(string: "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson2.jpg")),
        .init(artists: ["Gojko Adzic"],
              name: "Specification by Example",
              imageUrl: URL(string: "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/adzic.jpg")),
    ]
    
    func fetchBooks(completion: @escaping (Result<Array<Book>>) -> Void) {
        usleep(2000)
        completion(.success(self.mockBooks))
    }
}

private final class MockImageDownloadManager: ImageDownloadManagerProtocol {
    
    func startDownload(downloadableImage: DownloadableImage, completion: @escaping () -> Void) {
        usleep(2000)
        completion()
    }
    
}

private final class MockToDoRepository: ToDoRepositoryProtocol {
    
    private let mockTodos: [ToDoDTO] = [
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
