@testable import GetHandDirtyInCS
import XCTest

final class GetHandDirtyInCSTests: XCTestCase {
  func testDM_permutationWithRemainingOrder() {
    let tasks = [
      ["a1", "a2", "a3", "a4"],
      ["b1", "b2", "b3", "b4"],
    ]
    var results: [String] = []

    func rec(temp: [String], i: Int, j: Int, on which: Int) {
      var i = i
      var j = j
      var temp = temp
      which == 0 ? (i += 1) : (j += 1)
      guard (-1...3).contains(i), (-1...3).contains(j) else { return }

      temp.append(tasks[which][which == 0 ? i : j])

      if i == 3, j == 3 {
        results.append(temp.joined())
        return
      }
      rec(temp: temp, i: i, j: j, on: 0)
      rec(temp: temp, i: i, j: j, on: 1)
    }
    rec(temp: [], i: -1, j: -1, on: 0)
    rec(temp: [], i: -1, j: -1, on: 1)
    XCTAssertEqual(results,
                   [
                     "a1a2a3a4b1b2b3b4",
                     "a1a2a3b1a4b2b3b4",
                     "a1a2a3b1b2a4b3b4",
                     "a1a2a3b1b2b3a4b4",
                     "a1a2a3b1b2b3b4a4",
                     "a1a2b1a3a4b2b3b4",
                     "a1a2b1a3b2a4b3b4",
                     "a1a2b1a3b2b3a4b4",
                     "a1a2b1a3b2b3b4a4",
                     "a1a2b1b2a3a4b3b4",
                     "a1a2b1b2a3b3a4b4",
                     "a1a2b1b2a3b3b4a4",
                     "a1a2b1b2b3a3a4b4",
                     "a1a2b1b2b3a3b4a4",
                     "a1a2b1b2b3b4a3a4",
                     "a1b1a2a3a4b2b3b4",
                     "a1b1a2a3b2a4b3b4",
                     "a1b1a2a3b2b3a4b4",
                     "a1b1a2a3b2b3b4a4",
                     "a1b1a2b2a3a4b3b4",
                     "a1b1a2b2a3b3a4b4",
                     "a1b1a2b2a3b3b4a4",
                     "a1b1a2b2b3a3a4b4",
                     "a1b1a2b2b3a3b4a4",
                     "a1b1a2b2b3b4a3a4",
                     "a1b1b2a2a3a4b3b4",
                     "a1b1b2a2a3b3a4b4",
                     "a1b1b2a2a3b3b4a4",
                     "a1b1b2a2b3a3a4b4",
                     "a1b1b2a2b3a3b4a4",
                     "a1b1b2a2b3b4a3a4",
                     "a1b1b2b3a2a3a4b4",
                     "a1b1b2b3a2a3b4a4",
                     "a1b1b2b3a2b4a3a4",
                     "a1b1b2b3b4a2a3a4",
                     "b1a1a2a3a4b2b3b4",
                     "b1a1a2a3b2a4b3b4",
                     "b1a1a2a3b2b3a4b4",
                     "b1a1a2a3b2b3b4a4",
                     "b1a1a2b2a3a4b3b4",
                     "b1a1a2b2a3b3a4b4",
                     "b1a1a2b2a3b3b4a4",
                     "b1a1a2b2b3a3a4b4",
                     "b1a1a2b2b3a3b4a4",
                     "b1a1a2b2b3b4a3a4",
                     "b1a1b2a2a3a4b3b4",
                     "b1a1b2a2a3b3a4b4",
                     "b1a1b2a2a3b3b4a4",
                     "b1a1b2a2b3a3a4b4",
                     "b1a1b2a2b3a3b4a4",
                     "b1a1b2a2b3b4a3a4",
                     "b1a1b2b3a2a3a4b4",
                     "b1a1b2b3a2a3b4a4",
                     "b1a1b2b3a2b4a3a4",
                     "b1a1b2b3b4a2a3a4",
                     "b1b2a1a2a3a4b3b4",
                     "b1b2a1a2a3b3a4b4",
                     "b1b2a1a2a3b3b4a4",
                     "b1b2a1a2b3a3a4b4",
                     "b1b2a1a2b3a3b4a4",
                     "b1b2a1a2b3b4a3a4",
                     "b1b2a1b3a2a3a4b4",
                     "b1b2a1b3a2a3b4a4",
                     "b1b2a1b3a2b4a3a4",
                     "b1b2a1b3b4a2a3a4",
                     "b1b2b3a1a2a3a4b4",
                     "b1b2b3a1a2a3b4a4",
                     "b1b2b3a1a2b4a3a4",
                     "b1b2b3a1b4a2a3a4",
                     "b1b2b3b4a1a2a3a4"
                   ])
    XCTAssertEqual(results.count, 70)
  }
}
