require 'telegram/bot'

token = '464608221:AAFcyGq5uKdnQ6DJEnQMuIy4t-_vakX58MI'
level = -1
step = 0
admin_chat_id = '211509553'
user_array = Array.new
gamer_id = 0
quest_review = true
Telegram::Bot::Client.run(token) do |bot|
#===============================================================================================================================================================================================================
#     BUTTONS
############################################################################################################################################
  #   LEVEL 0
  lvl_0 = [
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Я в деле', callback_data: 'go'),
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Отстань я еще посплю', callback_data: 'stop')
  ]
  lvl_0_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_0)

  lvl_0_next_button = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Далее', callback_data: 'next_0')
  lvl_0_next_button_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_0_next_button)

############################################################################################################################################
#   LEVEL 1
  lvl_1_next_button = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Далее', callback_data: 'next_1')
  lvl_1_next_button_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_next_button)

  bot.listen do |message|
    case message
      when Telegram::Bot::Types::Message
        p message.text
        if (message.text == '/start' && level == -1)
          level += 1
          step = 0
          gamer_id = message.chat.id
          bot.api.send_message(chat_id: gamer_id, text: "Heroes fo Might and Magic 3")
          bot.api.sendPhoto(chat_id: gamer_id, photo: "https://s3-ap-southeast-1.amazonaws.com/maoriman1308/1.jpg")
          bot.api.send_message(chat_id: gamer_id, text: "Готовы к кровавым сражениям и геройской славе?", reply_markup: lvl_0_markup)
        end
      when Telegram::Bot::Types::CallbackQuery
        p "#{message.data}>>>>>level_#{level}>>>>step_#{step}"
#===============LEVEL 0===========================================================================
        if (level == 0)
          case message.data # LEVEL 0
            when 'go'
              step += 1
              p gamer_id
              bot.api.send_message(chat_id: gamer_id, text:"Сценарий:\n Борьба между рассами затянулась.\n
  Улицы заполонили страшные твари, крестьяне не выходят из лагуч, боги плачут от количества пролитой крови.
   \nПора положить этому конец...
  В городе должен править кто то один.\n
  Размер карты: XXL
  Подземелье: Включено", reply_markup: lvl_0_next_button_markup)
            when 'stop'
              bot.api.send_message(chat_id: gamer_id, text: "С вашего счета в сбербанке списано 500р")
              bot.api.send_message(chat_id: gamer_id, text: "А теперь?)", reply_markup: lvl_0_markup)
            when 'next_0'
                case step
                  when 1
                    step += 1
                    bot.api.sendPhoto(chat_id: gamer_id, photo:"https://s3-ap-southeast-1.amazonaws.com/maoriman1308/2.png")
                    bot.api.send_message(chat_id: gamer_id, text:"Ты, Солмир, повелитель цепных молний - достойный кандидат на это место", reply_markup: lvl_0_next_button_markup)
                  when 2
                    level = 1
                    step = 1
                    bot.api.send_message(chat_id:gamer_id, text: "Так как у тебя недавно был день рождение я дам тебе фору и открою полностью карту. Преимущество уже на твоей стороне!")
                    bot.api.send_message(chat_id: gamer_id, text: "https://drive.google.com/open?id=1an1Zabxn0gQaS05CP07tD1hwFDJ1Uz3q&usp=sharing", reply_markup: lvl_1_next_button_markup)
                end
          end
        end
#==============LEVEL 1 ANSERWS================================================================================

        lvl_1_step_3 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Демон выходи!', callback_data: 'next_1')
        lvl_1_step_3_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_3)

        lvl_1_step_4 = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Бежать', callback_data: 'lvl_1_step_5_ch1'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Принять свою судьбу', callback_data: 'lvl_1_step_5_ch2')
        ]
        lvl_1_step_4_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_4)
# =============LEVEL 1 CHOICE 1================================================
        lvl_1_step_5_ch1 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Что же делать?', callback_data: 'lvl_1_step_6_ch1')
        lvl_1_step_5_ch1_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_5_ch1)

        lvl_1_step_6_ch1 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Уже крадусь!', callback_data: 'lvl_1_step_7_ch1')
        lvl_1_step_6_ch1_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_6_ch1)

        lvl_1_step_7_ch1 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Я сделяль!', callback_data: 'lvl_1_step_8')
        lvl_1_step_7_ch1_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_7_ch1)

        lvl_1_step_8 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Готово!', callback_data: 'lvl_2_step_1')
        lvl_1_step_8_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_8)
# ==============LEVEL 1 CHOICE 2=================================================
        lvl_1_step_5_ch2 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'К битве готов!', callback_data: 'lvl_1_step_6_ch2')
        lvl_1_step_5_ch2_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_5_ch2)

        lvl_1_step_6_ch2 = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Я сделяль!', callback_data: 'lvl_1_step_8')
        lvl_1_step_6_ch2_markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: lvl_1_step_6_ch2)
        if (level == 1)
          case message.data # LEVEL 1
          when 'next_1'
            case step
              when 1
                step += 1
                bot.api.send_message(chat_id: gamer_id, text:"для начала тебе нужен артефакт дающий бесконечное количество ходов в день.\nОн очень редкий, заполучить ты его сможешь только у героя замка Inferno....", reply_markup: lvl_1_next_button_markup)
              when 2
                step += 1
                bot.api.sendPhoto(chat_id: gamer_id, photo:"https://s3-ap-southeast-1.amazonaws.com/maoriman1308/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA+%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0+2018-01-30+%D0%B2+15.26.22.png")
                bot.api.send_message(chat_id: gamer_id, text: "сына сатаны, наследника престола ада -  демона Вельзевула, властелина замка Inferno", reply_markup: lvl_1_next_button_markup)
                # https://www.tz-nn.ru/
              when 3
                step += 1
                bot.api.send_message(chat_id: gamer_id, text: "собирайся с духом и скачи на битву и помни - у тебя очень мало времени!")
                bot.api.send_message(chat_id: gamer_id, text: "как прискочешь - нажимай \"Демон выходи!\"", reply_markup: lvl_1_step_3_markup )
              when 4
                step += 1
                bot.api.send_message(chat_id: gamer_id, text: "Вы призвали огромное всепоглощающее исчадье ада...
                Ваши маги от страха телепортировались, гремлины зарылись в сугробы а горгульи улетели
                Вам ничего не остается как...", reply_markup: lvl_1_step_4_markup)
            end
          when 'lvl_1_step_5_ch1'
            step += 1
            bot.api.send_message(chat_id: gamer_id, text: "Вы все еще живы - а значит сделали правильный выбор ")
            bot.api.send_message(chat_id: gamer_id, text: "Чтож, будем брать замок хитростью ", reply_markup: lvl_1_step_5_ch1_markup)
          when 'lvl_1_step_6_ch1'
            step += 1
            bot.api.send_message(chat_id: gamer_id, text: "Чтобы демон вас не обнаружил - вам потребуется заклинание \"Левитация\" которое достать предположительно не составит труда")
            bot.api.sendPhoto(chat_id: gamer_id, photo: "https://s3-ap-southeast-1.amazonaws.com/maoriman1308/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA+%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0+2018-01-30+%D0%B2+17.03.47.png")
            bot.api.send_message(chat_id: gamer_id, text: "После того как выхожите в сториз видео с собой и наложенным заклинанием - можете начинать прокрадываться в замок Инферно\nНо помните .... ПОЛ - ЭТО ЛАВА!!! Левитируйте осторожнее!", reply_markup: lvl_1_step_6_ch1_markup)
          when 'lvl_1_step_7_ch1'
            if quest_review == true
              bot.api.send_message(chat_id: gamer_id, text: "Вы незаметно попадаете в замок, это успех! Артефакт находится в магазине Медтехника. Вам давно советовали его купить но вы клали на это болт", reply_markup: lvl_1_step_7_ch1_markup)
              else
              bot.api.send_message(chat_id: gamer_id, text: "Помоему вы еще не выложили фото с артефактом....")
            end


          when 'lvl_1_step_5_ch2'
            step += 1
            bot.api.send_message(chat_id: gamer_id, text: "Демон навис над вами словно неистовая туча из лавы и огня\nНо вам все равно понадобится помощь чтобы одолеть демона ")
            bot.api.send_message(chat_id: gamer_id, text: "Опубликуйте в VK или Instagram фото демона(какого найдете поблизости ) и попросите своих друзей помочь! Каждый лайк даст вам по одному титану!\n\n10-15 титанов хватит чтобы вы могли победить демона. Обязательные хэштеги #homm3, #mycrazyBday, #Vezelvul_sucks")
            bot.api.send_message(chat_id: gamer_id, text: "как только лайков будет достаточно - жмите \"К битве готов!\"", reply_markup: lvl_1_step_5_ch2_markup )
          when 'lvl_1_step_6_ch2'
            if quest_review == true
              bot.api.send_message(chat_id: gamer_id, text: "Поздавляем вас с победой, это успех! Артефакт находится в магазине Медтехника", reply_markup: lvl_1_step_6_ch2_markup)
            else
              bot.api.send_message(chat_id: gamer_id, text: "Вы недостаточно сильны, нужна армия побольше!", reply_markup: lvl_1_step_6_ch2_markup)
            end
          when 'lvl_1_step_8'
              bot.api.send_message(chat_id: gamer_id, text: "Вам нужно сфотографировать купленный артефакт и выложить в инстаграмм с хэштэгами #новыйартефакт, #homm3, #mycrazyBday, #Vezelvul_sucks" , reply_markup: lvl_1_step_8_markup)
        end
        end

        # if (level == 2)
        #   case message.data
        #     when
        #     when
        #
        #   end
        # end
      end
    end
  end

#
#
# # ===============================================================================================================================================================================================================

#       when 'Бежать'
#         level = level + 1
#         bot.api.send_message(chat_id: message.chat.id, text: "Вы все еще живы - а значит сделали правильный выбор ")
#         bot.api.send_message(chat_id: message.chat.id, text: "Чтож, будем брать замок хитростью ", reply_markup: what_to_do_button )
#       when "Что же делать?"
#         bot.api.send_message(chat_id: message.chat.id, text: "Чтобы демон вас не обнаружил - вам потребуется артефакт \"Башмаки левитации\" который достать предположительно не составит труда")
#         bot.api.sendPhoto(chat_id: message.chat.id, photo: "https://s3-ap-southeast-1.amazonaws.com/maoriman1308/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA+%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0+2018-01-30+%D0%B2+17.03.47.png")
#         bot.api.send_message(chat_id: message.chat.id, text: "После того как выхожите в сториз видео с собой и надетым артефактом - можете начинать прокрадываться в замок Инферно\nНо помните .... ПОЛ - ЭТО ЛАВА!!! Левитируйте осторожнее!(дальше не запилил)")
#       when "Принять свою судьбу"
#         bot.api.send_message(chat_id: message.chat.id, text: "Демон навис над вами словно неистовая туча из лавы и огня\nНо вам все равно понадобится помощь чтобы одолеть демона ")
#         bot.api.send_message(chat_id: message.chat.id, text: "Опубликуйте в VK или Instagram фото демона(какого найдете поблизости ) и попросите своих друзей помочь! Каждый лайк даст вам по одному титану!\n\n10-15 титанов хватит чтобы вы могли победить демона. Обязательные хэштеги #homm3, #mycrazyBday, #Vezelvul_sucks")
#         sleep (10)
#         bot.api.send_message(chat_id: message.chat.id, text: "как только лайков будет достаточно - жмите \"К битве готов!\" (дальше не запилил)", reply_markup: ready_button )
#       else
#         bot.api.send_message(chat_id: message.chat.id, text: "хватит всякую херню писать!")
#     end
#   end
