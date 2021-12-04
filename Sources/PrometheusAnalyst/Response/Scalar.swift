
import Foundation

struct PrometheusScalar: Decodable {

    let date: Date
    let value: Double

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        date = try container.decode(PrometheusDate.self).date

        let stringValue = try container.decode(String.self)
        guard let double = Double(stringValue) else {
            throw DecodingError.typeMismatch(
                Double.self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Prometheus scalar does not contain floating-point value.",
                    underlyingError: nil
                )
            )
        }
        value = double
    }

}
