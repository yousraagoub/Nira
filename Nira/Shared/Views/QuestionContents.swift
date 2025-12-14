//
//  QuestionContents.swift
//  Nira
//
//  Created by ruam on 19/06/1447 AH.
//

//
//  QuestionContents.swift
//  Nira
//
//  Created by Raghad Alzemami on 18/06/1447 AH.
//

import Foundation

let memoryImageSets: [MemoryImageSet] = [
    MemoryImageSet(
        imageName: "Image 1",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many cups were in the picture?"),
                options: [String(localized:"Three"), String(localized:"Four")],
                correctOption: String(localized:"Four"),
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: String(localized:"How many people had their legs crossed?"),
                options: [String(localized:"One"), String(localized:"Two")],
                correctOption: String(localized:"One"),
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: String(localized:"How many people were in the picture?"),
                options: [String(localized:"Three"), String(localized:"Two")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: String(localized:"Which hand did the man hold his cup with?"),
                options: [String(localized:"Left hand"), String(localized:"Right hand")],
                correctOption: String(localized:"Left hand"),
                relatedImageName: "Image 1"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 2",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many tulip flowers were in the picture?"),
                options: [String(localized:"Three"), String(localized:"Two")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: String(localized:"What shape is located in the middle of the picture?"),
                options: [String(localized:"Tulip"), String(localized:"Sunflower")],
                correctOption: String(localized:"Tulip"),
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: String(localized:"How many tiny flowers?"),
                options: [String(localized:"Five"), String(localized:"Four")],
                correctOption: String(localized:"Five"),
                relatedImageName: "Image 2"
            )
        ]
        ),
    MemoryImageSet(
        imageName: "Image 3",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many windows were visible?"),
                options: [String(localized:"Six"), String(localized:"Five")],
                correctOption: String(localized:"Five"),
                relatedImageName: "Image 3"
            ),
            MemoryQuestion(
                text: String(localized:"What type of tree was at the bottom?"),
                options: [String(localized:"Round tree"), String(localized:"Pine tree")],
                correctOption: String(localized:"Round tree"),
                relatedImageName: "Image 3"
            ),
            MemoryQuestion(
                text: String(localized:"Was the house tilted?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image 3"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 4",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many flower pots were next to the cat?"),
                options: [String(localized:"Two"), String(localized:"One")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 4"
            ),
            MemoryQuestion(
                text: String(localized:"What was not in the picture?"),
                options: [String(localized:"Full moon"), String(localized:"Sun")],
                correctOption: String(localized:"Sun"),
                relatedImageName: "Image 4"
            ),
            MemoryQuestion(
                text: String(localized:"What creature was flying outside?"),
                options: [String(localized:"Butterfly"), String(localized:"Bird")],
                correctOption: String(localized:"Butterfly"),
                relatedImageName: "Image 4"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 5",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many bananas were shown?"),
                options: [String(localized:"Two"), String(localized:"Three")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 5"
            ),
            MemoryQuestion(
                text: String(localized:"What animal was not in the picture?"),
                options: [String(localized:"Lion"), String(localized:"Dog")],
                correctOption: String(localized:"Lion"),
                relatedImageName: "Image 5"
            ),
            MemoryQuestion(
                text: String(localized:"Was there a laptop in the image?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image 5"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 6",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many balls were in the picture?"),
                options: [String(localized:"Two"), String(localized:"Three")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 6"
            ),
            MemoryQuestion(
                text: String(localized:"What object was in the bottom-right corner?"),
                options: [String(localized:"Star"), String(localized:"Carrot")],
                correctOption: String(localized:"Carrot"),
                relatedImageName: "Image 6"
            ),
            MemoryQuestion(
                text: String(localized:"Was there an apple in the picture?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"No"),
                relatedImageName: "Image 6"
            )
        ]
    ),    MemoryImageSet(
        imageName: "Image 7",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many flowers appeared in the picture?"),
                options: [String(localized:"Two"), String(localized:"One")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 7"
            ),
            MemoryQuestion(
                text: String(localized:"Where Was the turtle placed on?"),
                options: [String(localized:"Top"), String(localized:"Middle")],
                correctOption: String(localized:"Middle"),
                relatedImageName: "Image 7"
            ),
            MemoryQuestion(
                text: String(localized:"Was there an apple in the picture?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image 7"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 8",
        questions: [
            MemoryQuestion(
                text: String(localized:"What color was the desk lamp?"),
                options: [String(localized:"Yellow"), String(localized:"Orange")],
                correctOption: String(localized:"Yellow"),
                relatedImageName: "Image 8"
            ),
            MemoryQuestion(
                text: String(localized:"What color was the cup?"),
                options: [String(localized:"Yellow"), String(localized:"Orange")],
                correctOption: String(localized:"Orange"),
                relatedImageName: "Image 8"
            ),
            MemoryQuestion(
                text: String(localized:"How many pencils were inside the pen holder?"),
                options: [String(localized:"Two"), String(localized:"One")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 8"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 9",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many pillows were on the sofa?"),
                options: [String(localized:"Two"), String(localized:"One")],
                correctOption: String(localized:"One"),
                relatedImageName: "Image 9"
            ),
            MemoryQuestion(
                text: String(localized:"What color was the rug?"),
                options: [String(localized:"Yellow"), String(localized:"Orange")],
                correctOption: String(localized:"Yellow"),
                relatedImageName: "Image 9"
            ),
            MemoryQuestion(
                text: String(localized:"Was there a plant in the room?"),
                options: [String(localized:"Yes"), String(localized:"No")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image 9"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 10",
        questions: [
            MemoryQuestion(
                text: String(localized:"What color was the banana plate?"),
                options: [String(localized:"Green"), String(localized:"Orange")],
                correctOption: String(localized:"Green"),
                relatedImageName: "Image 10"
            ),
            MemoryQuestion(
                text: String(localized:"What was not there?"),
                options: [String(localized:"Pot"), String(localized:" Cup")],
                correctOption: String(localized:"Pot"),
                relatedImageName: "Image 10"
            ),
            MemoryQuestion(
                text: String(localized:"Was there a window in the kitchen?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image 10"
            )
        ]
    ),
    
]
