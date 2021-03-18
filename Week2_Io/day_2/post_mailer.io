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

postOffice messageTarget println

postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)
postOffice messageArgs("one", 2, :three)

postOffice messageName println

unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

unless( true, write("One is not two\n"), write("one is two\n"))

// работоет unless таким образовм:
// 1 - взять первое сообщение ( 1==2 ) и выполнить его как действие
// 1.1 - если действие выполнено успешно и результат True, выполнить действие ifTrue
// 1.2 - если результат false, выполнить действие ifFalse
// как в ifFalse так и в ifTrue происходит интерпритация сообщения как действия
