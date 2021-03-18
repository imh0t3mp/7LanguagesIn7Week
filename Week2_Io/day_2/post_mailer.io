#!/usr/bin/env io

//Добавим объект postOffice
postOffice := Object clone
//и добавим к нему метод
postOffice packageSender := method(call sender)

//Добавим объект mailer
mailer := Object clone
//И пусть он теперь может доставлять отправления через почтовое отделение
mailer deliver := method(postOffice packageSender)

//Ну а теперь, пусть отправитель отправитт сообщение

mailer deliver println

postOffice messageTarget := method(call target)
