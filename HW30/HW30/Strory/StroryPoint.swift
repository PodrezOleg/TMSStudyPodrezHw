//
//  StroryPoint.swift
//  HW30
//
//  Created by Oleg Podrez on 13.10.24.
//

import Foundation

struct StoryPoint {
    let text: String
    let choices: [Choice]
    let backGroundView: String
}

struct Choice {
    let text: String
    let nextStoryPointID: Int
}

let storyPoints: [StoryPoint] = [
    // Развилка 1: Начало истории
    StoryPoint(
        text: "Главный герой только что проснулся после процедуры в «Виртуме». Взрыв раздаётся неподалёку, дверь распахивается, и в комнату врываются вооружённые агенты.",
        choices: [
            Choice(text: "Бежать, пытаясь сохранить свою жизнь.", nextStoryPointID: 1),
            Choice(text: "Вступить в бой, полагая, что он — агент сопротивления.", nextStoryPointID: 2),
            Choice(text: "Сдаться и остаться на месте.", nextStoryPointID: 3)
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Бегство
    StoryPoint(
        text: "Марк мчится по переулкам, но за ним следят как агенты, так и подозрительные люди в гражданской одежде.",
        choices: [
            Choice(text: "Продолжить бежать.", nextStoryPointID: 4), // Следующая развилка
            Choice(text: "Попытаться спрятаться.", nextStoryPointID: 5) // Дополнительные сценарии
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Вступить в бой
    StoryPoint(
        text: "Инстинкты не подводят его, и он побеждает агентов.",
        choices: [
            Choice(text: "Осмотреть агентов.", nextStoryPointID: 6),
            Choice(text: "Покинуть место.", nextStoryPointID: 4)
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Сдаться
    StoryPoint(
        text: "Агенты захватывают его и увозят в неизвестное место, где его память полностью стирают. Это приводит к плохой концовке.",
        choices: [
            Choice(text: "Конец игры. Начать заново?", nextStoryPointID: 0) // Вернуться в начало
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Развилка 2: Неожиданная находка
    StoryPoint(
        text: "Марк возвращается в квартиру и находит старый коммуникатор с сообщением, которое может объяснить его жизнь.",
        choices: [
            Choice(text: "Воспроизвести сообщение.", nextStoryPointID: 7),
            Choice(text: "Уничтожить коммуникатор.", nextStoryPointID: 8),
            Choice(text: "Игнорировать находку.", nextStoryPointID: 9)
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Вариант плохой концовки при игнорировании находки
    StoryPoint(
        text: "Марк продолжает свои действия вслепую, упуская важную информацию. Это приведет к его гибели в дальнейшем.",
        choices: [
            Choice(text: "Конец игры. Начать заново?", nextStoryPointID: 0)
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Другие развилки продолжения сюжета, включая встречу с женщиной и выборы
    StoryPoint(
        text: "После бегства Марк сталкивается с женщиной, утверждающей, что она его жена.",
        choices: [
            Choice(text: "Довериться ей.", nextStoryPointID: 10),
            Choice(text: "Остаться одному.", nextStoryPointID: 11),
            Choice(text: "Атаковать её.", nextStoryPointID: 12)
        ],
        backGroundView: "HomeBackground"
    ),
    
    // Другие развилки...
    
    // Концовки
    StoryPoint(
        text: "Женщина убивает Марка, считая его врагом. Это приводит к смерти Марка.",
        choices: [
            Choice(text: "Конец игры. Начать заново?", nextStoryPointID: 0)
        ], backGroundView: "HomeBackground"
    )
]

