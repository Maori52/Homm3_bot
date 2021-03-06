class QuestLib
  def level_data
    level_text = {

        "0.1" => {'type' => 'photo',
                  'data' => 'https://s3-ap-southeast-1.amazonaws.com/maoriman1308/1.jpg'},

        "0.2" => {'type' => 'text',
                  'data' => "Heroes of Might and Magic 3\n\nГотовы к кровавым сражениям и геройской славе?",
                  'query?' => true,
                  'query' => ['Я в деле','0.4','Отстань я еще посплю','0.3']},


        "0.3" => {'type' => 'text',
                  'data' => "С вашего счета в сбербанке списано 500р\n\nА теперь?)",
                  'query?' => true,
                  'query' => ['Я в деле','0.3','Отстань я еще посплю','0.2']},

        "0.4" => {'type' => 'text',
                  'data' => "Сценарий:\n Борьба между рассами затянулась.\n
  Улицы заполонили страшные твари, крестьяне не выходят из лагуч, боги плачут от количества пролитой крови.
   \nПора положить этому конец...
  В городе должен править кто то один.\n",
                  'query?' => true,
                  'query' => ['Далее', '0.5']},
        # ===============================================================================================
        "0.5" => {'type' => 'photo',
                  'data' =>"https://s3-ap-southeast-1.amazonaws.com/maoriman1308/2.png"},

        "0.6" => {'type' => 'text',
                  'query?' => false,
                  'data' => "Ты, Солмир, повелитель цепных молний - достойный кандидат на это место\n\n"},

        "0.7" => {'type' => 'text',
                  'data' => "Так как у тебя недавно был день рождение я дам тебе фору и открою полностью карту. Преимущество уже на твоей стороне!",
                  'query?' => true,
                  'query' => ['Далее', '0.8']},

        "0.8" => {'type' => 'text',
                  'data' => "для начала тебе нужен артефакт дающий бесконечное количество ходов в день.\nОн очень редкий, заполучить ты его сможешь только у героя замка Inferno....",
                  'query?' => true,
                  'query' => ['Далее', '0.9']},

        "0.9" => {'type' => 'photo',
                  'data' => 'https://s3-ap-southeast-1.amazonaws.com/maoriman1308/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA+%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0+2018-01-30+%D0%B2+15.26.22.png'},


        '0.10' => {'type' => 'text',
                  'data' => "сына сатаны, наследника престола ада -  демона Вельзевула, властелина замка Inferno",
                  'query?' => true,
                  'query' => ['Далее', '0.11']},

        '0.11' => {'type' => 'text',
                   'query?' => false,
                   'data' => "собирайся с духом и скачи на битву и помни - у тебя очень мало времени!"},

        '0.12' => {'type' => 'text',
                   'data' => "как прискочешь - нажимай \"Демон выходи!\"",
                   'query?' => true,
                   'query' => ['Демон выходи!', '0.13']},

        '0.13' => {'type' => 'text',
                   'data' => "Вы призвали огромное всепоглощающее исчадье ада...\nВаши маги от страха телепортировались, гремлины зарылись в сугробы а горгульи улетели\n\nВам ничего не остается как...",
                   'query?' => true,
                   'query' => ['Бежать', '0.14','Принять свою судьбу', '0.15']},
# ============================================================================================================================================
        '0.14' => {'type' => 'text',
                   'data' => "Вы все еще живы - а значит сделали правильный выбор!\n\nЧтож, будем брать замок хитростью ",
                   'query?' => true,
                   'query' => ['Что же делать?', '0.15']},

        '0.15' => {'type' => 'text',
                   'data' => "Чтобы демон вас не обнаружил - вам потребуется заклинание \"Левитация\" которое достать предположительно не составит труда"},

        "0.16" => {'type' => 'photo',
                   'data' => "https://s3-ap-southeast-1.amazonaws.com/maoriman1308/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA+%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0+2018-01-30+%D0%B2+17.03.47.png"},

        "0.17" => {'type' => 'text',
                   'data' => "После того как выхожите в сториз видео с собой и наложенным заклинанием - можете начинать прокрадываться в замок Инферно\nНо помните .... ПОЛ - ЭТО ЛАВА!!! Левитируйте осторожнее!",
                   'query?' => true,
                   'query' => ["Уже крадусь!",'review.0.19'],
                   'review' => true},

        '0.18' => {'type' => 'text',
                   'data' => "Помоему вы еще не выложили фото...",
                   'query?' => true,
                   'query' => ['Уже крадусь!', '0.19']},

        '0.19' => {'type' => 'text',
                   'data' => "Вы незаметно попадаете в замок, это успех! Артефакт находится в магазине Медтехника. Вам давно советовали его купить но вы клали на это болт",
                   'query?' => true,
                   'query' => ['Я сделяль', '0.20']},
# ============================================================================================================================================
# как только лайков будет достаточно - жмите \"К битве готов!\"

        '0.20' => {'type' => 'text',
                   'data' => "Демон навис над вами словно неистовая туча из лавы и огня\nНо вам все равно понадобится помощь чтобы одолеть демона"},


        '0.21' => {'type' => 'text',
                   'data' => "Опубликуйте в VK или Instagram фото демона(какого найдете поблизости ) и попросите своих друзей помочь! Каждый лайк даст вам по одному титану!

10-15 титанов хватит чтобы вы могли победить демона. Обязательные хэштеги #homm3, #mycrazyBday, #Vezelvul_sucks"},

        '0.22' => { 'type' => 'text',
                    'data' => "как только лайков будет достаточно - жмите \"К битве готов!\"",
                    'query?' => true,
                    'query' => ['К битве готов!', '0.24'],
                    'review' => true},

        '0.23' => { 'type' => 'text',
                    'data' => "Вы недостаточно сильны, нужна армия побольше!",
                    'query?' => true,
                    'query' => ['К битве готов!', '0.24']},

        '0.24' => { 'type' => 'text',
                    'data' => "Поздавляем вас с победой, это успех! Артефакт находится в магазине Медтехника.Вам давно советовали его купить но вы клали на это болт"},

        '0.25' => {'type' => 'text',
                   'data' => "Вам нужно сфотографировать купленный артефакт и выложить в инстаграмм с хэштэгами #новыйартефакт, #homm3, #mycrazyBday, #Vezelvul_sucks",
                   'query?' => true,
                   'query' => ['Выложила!', '0.27'],
                   'review' => true},

        '0.26' => {'type' => 'text',
                   'data' => "Система не видит вашей фото в инстаграмме",
                   'query?' => true,
                   'query' => ['Выложила!', '0.27']},

        '0.27' => {'type' => 'text',
                   'data' => "Вы можете делать бесконечное количество шагов в день, однако день не вечен. Он закончится в 15:00.
Если вы не успеете всех победить до этого времени - противники успеют закупить армию (да да, сегодня 7й день) и вам непоздоровится",
                   'query?' => true,
                   'query' => ['БЛ*ТЬ!', '0.28']},

    }
  end
end