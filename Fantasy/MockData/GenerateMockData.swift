//
//  GenerateMockData.swift
//  Fantasy
//
//  Created by mac on 21/04/22.
//

import Foundation

class MockData {

    static var shared: MockData = MockData()
    private init() { }

    func getTournament() -> Tournament {
Tournament(startDate: getDate(strDate: "25/03/2022, 4:30 PM"), EndDate: getDate(strDate: "28/04/2022, 4:30 PM"), matches: <#T##[Matche]#>, headOfTournament: <#T##String#>, poweredBy: <#T##String#>)
    }


    func getMatches(numberOfMatches: Int) -> [Matche] {
        var matches = [Matche]()
        for i in 0..<numberOfMatches {
            matches.append(Matche(teamA: <#T##Team#>, teamB: <#T##Team#>, date: <#T##Date#>, winnerTeam: <#T##Team?#>, stadium: <#T##Stadium#>))
        }
    }






}







































func getDate(strDate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a" // 12 Match 2022, 4:30 PM
    let date = dateFormatter.date(from: strDate)
    return date ?? Date()
}

/**

 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS


 */
