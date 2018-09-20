import Foundation
import Vapor

struct Currently : Content
{
    let summary: String
    let temperature: Double
}

