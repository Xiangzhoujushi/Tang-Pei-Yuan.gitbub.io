/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/** TargetedSentimentResults. */
public struct TargetedSentimentResults {

    /// Targeted text.
    public var text: String?

    /// Sentiment score from -1 (negative) to 1 (positive).
    public var score: Double?

    /**
     Initialize a `TargetedSentimentResults` with member variables.

     - parameter text: Targeted text.
     - parameter score: Sentiment score from -1 (negative) to 1 (positive).

     - returns: An initialized `TargetedSentimentResults`.
    */
    public init(text: String? = nil, score: Double? = nil) {
        self.text = text
        self.score = score
    }
}

extension TargetedSentimentResults: Codable {

    private enum CodingKeys: String, CodingKey {
        case text = "text"
        case score = "score"
        static let allValues = [text, score]
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        score = try container.decodeIfPresent(Double.self, forKey: .score)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(score, forKey: .score)
    }

}