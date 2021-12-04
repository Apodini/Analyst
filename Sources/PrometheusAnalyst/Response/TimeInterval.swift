
import Foundation

struct PrometheusTimeInterval: Decodable {

    let seconds: Double

    init(from decoder: Decoder) throws {

        let string = try String(from: decoder)
        let number = String(string.unicodeScalars.prefix(while: CharacterSet.decimalDigits.contains))
        let unit = string[string.index(string.startIndex, offsetBy: number.count)...]

        guard let value = Int(number) else {
            throw DecodingError.typeMismatch(
                PrometheusTimeInterval.self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Numeric prefix is not an integer value.",
                    underlyingError: nil
                )
            )
        }

        switch unit {
        case "ms":
            seconds = Double(value) / 1_000
        case "s":
            seconds = Double(value)
        case "m":
            seconds = Double(value) * 60
        case "h":
            seconds = Double(value) * 60 * 60
        case "d":
            seconds = Double(value) * 60 * 60 * 24
        case "w":
            seconds = Double(value) * 60 * 60 * 24 * 7
        case "y":
            seconds = Double(value) * 60 * 60 * 24 * 365
        default:
            throw DecodingError.typeMismatch(
                PrometheusTimeInterval.self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown time interval unit.",
                    underlyingError: nil
                )
            )
        }

    }

}

