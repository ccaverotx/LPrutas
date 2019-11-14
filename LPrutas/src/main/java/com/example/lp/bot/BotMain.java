package com.example.lp.bot;

import com.example.lp.bl.BotBl;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.util.List;

public class BotMain extends TelegramLongPollingBot {

    BotBl botBl;

     public BotMain(BotBl customerBl) {
        this.botBl = customerBl;
    }

    @Override
    public void onUpdateReceived(Update update) {
        System.out.println(update);
        update.getMessage().getFrom().getId();
        if (update.hasMessage() && update.getMessage().hasText()) {
            List<String> messages = botBl.processUpdate(update);
            for(String messageText:     messages) {
                SendMessage message = new SendMessage() 
                        .setChatId(update.getMessage().getChatId())
                        .setText(messageText);
                try {
                    this.execute(message);
                } catch (TelegramApiException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public String getBotUsername() {
        return "test_ec";
    }
    @Override
    public String getBotToken() {
        return "907879278:AAFWrrtBMYmRXkslcZopfAjGECk0OHQGFus";  // chat Grupo
        // creence su chat bot para que podamos correr en conjunto si

    }
}


