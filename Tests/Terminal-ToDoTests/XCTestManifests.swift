import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Terminal_ToDoTests.allTests),
    ]
}
#endif
