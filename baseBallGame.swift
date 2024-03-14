//
//  main.swift
//  BaseballGame
//
//  Created by 강태영 on 2024/03/13.

import Foundation

var strikeCount = 0
var ballCount = 0
var tryCount = 1

class BaseballGame {
    
    func game() {

            var input = 0
            var string = ""
            var check = ""
            
            // 랜덤 수 정하기
            var randomNumber = ["0", "0", "0"]
            let sequence = 0..<10
            let shuffledSequence = sequence.shuffled()
            randomNumber[0] = String(shuffledSequence[9])
            randomNumber[1] = String(shuffledSequence[8])
            randomNumber[2] = String(shuffledSequence[7])
            
            for i in 1...9 {
                print("\(tryCount)회차")
                repeat {
                    print("당신의 숫자는?", terminator: " ")
                    if let data = readLine(), let number = Int(data) {
                        input = number
                        check = data
                        if check.count == 3 {
                            string = String(format: "%d", input)
                        } else {
                            print("잘못 입력하셨습니다. 다시 입력하십시오.")
                        }
                    }
                    if unique(string) == false {
                        print("잘못 입력하셨습니다. 다시 입력하십시오.")
                    }
                } while unique(string) == false || check.count != 3
                
                // 스트라이크, 볼 구분
                strikeCount = 0
                ballCount = 0
                
                var a = Array(string)
                for i in 0..<3 {
                    for j in 0..<3 {
                        if String(a[i]) == randomNumber[j] && i == j {
                            strikeCount += 1
                        } else if String(a[i]) == randomNumber[j] && i != j {
                            ballCount += 1
                        }
                    }
                }
                
                // 출력
                if strikeCount == 0 && ballCount == 0 {
                    print("아웃입니다.")
                } else if strikeCount == 3 {
                    print("플레이어가 이겼습니다.")
                    print("\(tryCount)회 종료")
                    break
                } else {
                    print("\(ballCount) 볼, \(strikeCount) 스트라이크")
                }
                print("\(tryCount)회 종료")
                if tryCount == 9 {
                    print("플레이어가 패배했습니다.")
                    print("제시된 숫자: \(randomNumber.joined(separator: ""))")
                } else {
                    tryCount += 1
                }
            }
        }

    }


