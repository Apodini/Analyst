
struct VectorResponse: Decodable {
    var data: Vector
}

struct Vector: Decodable {
    var result: [Element]
}

extension Vector {

    struct Element: Decodable {
        var metric: [String: String]
        var value: Value?
        var values: [Value]?

        var allValues: [Value] {
            values ?? (value.map { [$0] } ?? [])
        }
    }

}

extension Vector.Element {

    struct Value: Decodable {
        var date: Date
        var value: Double

        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            self.date = try Date(timeIntervalSince1970: container.decode(Double.self))
            guard let value = try Double(container.decode(String.self)) else {
                throw DecodingError
                    .typeMismatch(Double.self,
                                  .init(codingPath: container.codingPath, debugDescription: .init()))
            }
            self.value = value
        }
    }

}
