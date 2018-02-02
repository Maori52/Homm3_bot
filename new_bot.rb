require 'telegram/bot'
require_relative 'Quest_lib.rb'

@questions = QuestLib.new
token = '464608221:AAFcyGq5uKdnQ6DJEnQMuIy4t-_vakX58MI'
@level = -1
@step = 0
@admin_chat_id = '211509553'
@gamer_id = 0
@review_status = false
@review_step = ''
@quest_review_bool = false
Telegram::Bot::Client.run(token) do |bot|

  def markup(query_arr)
    if query_arr != nil
      if query_arr.size > 2
        markup_arr = Array.new
        while(query_arr.size > 0)
          markup_arr.push(Telegram::Bot::Types::InlineKeyboardButton.new(text: query_arr[0], callback_data: query_arr[1]))
          query_arr.slice!(0..1)
        end
        Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard:markup_arr)
      else
        m = Telegram::Bot::Types::InlineKeyboardButton.new(text: query_arr[0], callback_data: query_arr[1])
        Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: m)
      end
    end
  end

  def quest_lib_parse(step,bot)
    if (@questions.level_data[step]['type'] == 'text' && @questions.level_data[step]['query?'])
      if @questions.level_data[step]['review']
        args = step.split('.')
        @review_step = (@level.to_s + '.' + (args[-1].to_i + 2).to_s)
        bot.api.send_message(chat_id: @admin_chat_id, text: "Подтвердить задание:\n#{@questions.level_data[step]['data']}")

      end
      @step += 1
      bot.api.send_message(chat_id: @gamer_id, text:@questions.level_data[step]['data'], reply_markup: markup(@questions.level_data[step]['query']))
    else
      if @questions.level_data[step]['type'] == 'text'
        bot.api.send_message(chat_id: @gamer_id, text:@questions.level_data[step]['data'])
        args = step.split('.')
        new_step = (@level.to_s + '.' + (args[-1].to_i + 1).to_s)
        @step += 1
        quest_lib_parse(new_step,bot)
      else
        bot.api.sendPhoto(chat_id: @gamer_id, photo: @questions.level_data[step]['data'])
        args = step.split('.')
        new_step = (@level.to_s + '.' + (args[-1].to_i + 1).to_s)
        @step += 1
        quest_lib_parse(new_step,bot)
      end
    end
  end

  def level_parse(message, bot)

    case message
      when Telegram::Bot::Types::Message
        p "message: #{message.text}"
        p "level = #{@level}"
        p "step = #{@step}"
        message_parse(message,bot)
      when Telegram::Bot::Types::CallbackQuery
        p "message: #{message.data}"
        p "level = #{@level}"
        p "step = #{@step}"
        query_parse(message, bot)

    end
  end

  def message_parse(message,bot)
    case message.text
      when '/start'
        if (@level == -1)
          @step = 1
          @level = 0
          @gamer_id = message.chat.id
          quest_lib_parse('0.1',bot)
        end
      when 'ok'
        @review_status = true
        quest_lib_parse(@review_step,bot)
      else
        p "qweqweqwe"
    end
  end

  def query_parse(message,bot)
    args = message.data.split('.')
    if (args[0] == 'up')
      @level += 1
      args.shift!
      message.data.split!(0..2)
    end
    p " step#{@step} >>>> data #{args[1]}"
    if (@level == args[0].to_i && (@step+1) == args[1].to_i)
      quest_lib_parse(message.data ,bot)
    end
  end

  bot.listen do |message|
    level_parse(message,bot)
  end
end
