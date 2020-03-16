import Foundation

extension String {
    /// Info about the exact location of a character in a given file.
    public typealias LocationInfo = (line: Int, charInLine: Int)

    func locationInfo(of index: String.Index) -> LocationInfo {
        let prefix = self[startIndex ..< index]
        let prefixLines = prefix.split(separator: "\n")
        guard let lastPrefixLine = prefixLines.last else { return (line: 1, charInLine: 1) }

        let charInLine = prefix.last == "\n" ? 1 : lastPrefixLine.count + 1
        return (line: prefixLines.count + 1, charInLine: charInLine)
    }
}