//
//  StroryPoint.swift
//  HW30
//
//  Created by Oleg Podrez on 13.10.24.
//

import Foundation

struct StoryPoint {
    let id: Int
    let text: String
    let choices: [Choice]
    let backGroundView: String
}

struct Choice {
    let text: String
    let nextStoryPointID: Int
    let explanation: String
}

let storyPoints: [StoryPoint] = [
    // Развилка 1: Начало истории
    StoryPoint(
        id: 201,
        text: "Главный герой только что проснулся после процедуры в «Виртуме». Взрыв раздаётся неподалёку, дверь распахивается, и в комнату врываются вооружённые агенты.",
        choices: [
            Choice(
                text: "Бежать, пытаясь сохранить свою жизнь.",
                nextStoryPointID: 202,
                explanation: "{name} мчится по переулкам, но за ним следят как агенты, так и подозрительные люди в гражданской одежде."
            ),
            Choice(
                text: "Вступить в бой, полагая, что он — агент сопротивления.",
                nextStoryPointID: 202,
                explanation: "Инстинкты не подводят его, и он побеждает агентов."
            ),
            Choice(text: "Сдаться и остаться на месте.",
                   nextStoryPointID: 208,
                   explanation: "Надеясь, что агенты его не тронут. Однако они захватывают его и увозят в неизвестное место, где его память полностью стирают.")
        ],
        backGroundView: "HomeBackground"
    ),
    
    //Развилка 2: Квартира
    StoryPoint(
        id: 202,
        text: "После событий в «Виртуме», {name} возвращается в квартиру и находит старый коммуникатор с сообщением, которое может объяснить его жизнь.",
        choices: [
            Choice(text: "Воспроизвести сообщение.",
                   nextStoryPointID: 203,
                   explanation: "Он узнаёт больше о своей жизни как агента сопротивления и начинает подозревать, что корпорация контролирует его воспоминания."),
            Choice(text: "Уничтожить коммуникатор.",
                   nextStoryPointID: 203,
                   explanation: "{name} считает это ловушкой и уничтожает устройство, продолжая свои поиски правды."),
            Choice(text: "Игнорировать находку",
                   nextStoryPointID: 203,
                   explanation: "и оставить коммуникатор как есть. Это приводит к тому, что Марк продолжает свои действия вслепую, упуская важную информацию.")
        ],
        backGroundView: "KvartalBackGround"
    ),
    
    // Развилка 3: Знакомство с загадочной женщиной
    StoryPoint(
        id: 203,
        text: "После бегства {name} сталкивается с женщиной, утверждающей, что она его жена, и они вместе сражались против корпорации.",
        choices: [
            Choice(text: "Довериться ей и пойти с ней.",
                   nextStoryPointID: 204,
                   explanation: "Женщина рассказывает {name} о его прошлом и о том, что он должен вспомнить, чтобы победить корпорацию."),
            Choice(text: "Остаться одному",
                   nextStoryPointID: 204,
                   explanation: "сомневаясь в её словах. {name} решает идти своим путём, полагаясь только на себя."),
            Choice(text: "Атаковать её, подозревая, что она — агент корпорации.",
                   nextStoryPointID: 208, explanation: "Поддавшись паранойе (возможно, из-за того, что он игнорировал коммуникатор на второй развилке), {name} пытается напасть на женщину. Она, защищаясь, убивает его, считая его врагом. Это приводит к смерти {name} — окончанию, где он погибает от собственной неуверенности и недоверия.")
        ],
        
        backGroundView: "HomeWomenBackGround"
    ),
    
    // Развилка 4: Предатель среди союзников
    StoryPoint(
        id: 204,
        text: " {name} доверился женщине, они оказываются в укрытии сопротивления. Однако среди их союзников оказывается предатель.",
        choices: [
            Choice(text: "Обвинить одного из членов группы",
                   nextStoryPointID: 205,
                   explanation: "Основываясь на интуиции. Марк правильно угадывает, кто предатель, и предотвращает заговор."),
            Choice(text: "Не предпринимать никаких действий",
                   nextStoryPointID: 205,
                   explanation: "опасаясь ошибиться. В этом случае предатель выдаёт их планы, и группа оказывается в опасности."),
            Choice(text: "Попытаться сбежать в одиночку, не доверяя никому",
                   nextStoryPointID: 207,
                   explanation: "Если {name} выбирает сбежать, он оказывается один в туннелях и погибает в ловушке, устроенной корпорацией, потому что у него не было поддержки от союзников.")
        ],
        backGroundView: "DungenBackground"
    ),
    
    // Развилка 5: Устройство контроля воспоминаний
    StoryPoint(
        id: 205,
        text: "После долгих испытаний {name} они находят устройство, контролирующее воспоминания всех жителей.",
        choices: [
            Choice(text: "Деактивировать устройство",
                   nextStoryPointID: 206,
                    explanation: "чтобы освободить людей, рискуя непредсказуемыми последствиями. В результате корпорация теряет контроль, и {name} восстанавливает свою личность."),
            Choice(text: "Не трогать устройство",
                   nextStoryPointID: 207,
                   explanation: "опасаясь катастрофы. В этом случае устройство остаётся под контролем корпорации, и мир погружается в ещё больший хаос."),
            Choice(text: "Попытаться уничтожить устройство силой",
                   nextStoryPointID: 208,
                   explanation: "не разобравшись в его работе. Если {name} решает действовать импульсивно, устройство взрывается, убивая его и всех вокруг. Это приводит к смертельной концовке, где его необдуманные действия приводят к гибели.")
        ],
        backGroundView: "DesertBackground"
    ),
    // Хорошая концовка
    StoryPoint(
        id: 206,
        text: "Поздравляем, {name}, ты победил корпорацию и восстановил свою личность!",
        choices: [
            Choice(text: "Просмотр таблицы лидеров", nextStoryPointID: 101, explanation: "Сейчас тебе покажут мультик Ну погоди)) "),
            Choice(text: "Начать заново", nextStoryPointID: 102, explanation: "Уверен?")
        ],
        backGroundView: "GoodEndingBackground"
    ),

    // Плохая концовка
    StoryPoint(
        id: 207,
        text: "Корпорация захватила тебя и полностью стерла твои воспоминания. Ты потерпел поражение.",
        choices: [
            Choice(text: "Просмотр таблицы лидеров", nextStoryPointID: 101, explanation: "Ну че ты так ? )"),
            Choice(text: "Начать заново", nextStoryPointID: 102, explanation: "Уверен?")
        ],
        backGroundView: "BadEndingBackground"
    ),

    // Смертельная концовка
    StoryPoint(
        id: 208,
        text: "Ты погиб. Время твоей игры сохранено в таблице лидеров.",
        choices: [
            Choice(text: "Просмотр таблицы лидеров", nextStoryPointID: 101, explanation: "Бывет) "),
            Choice(text: "Начать заново", nextStoryPointID: 102, explanation: "Уврен?")
        ],
        backGroundView: "DeathEndingBackground"
    )

]
