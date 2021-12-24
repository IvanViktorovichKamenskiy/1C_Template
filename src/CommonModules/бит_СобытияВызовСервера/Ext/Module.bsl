﻿#Область ШлюзПодписок

Процедура ПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка, ДополнительныеПараметры = Неопределено) Экспорт
	ИмяФормы = ЭтаФорма.ИмяФормы;
	ИмяСобытия = "ПриСозданииНаСервере";
	ПараметрыОбработчика = "ЭтаФорма, Отказ, СтандартнаяОбработка, ДополнительныеПараметры";
	
	Обработчик = бит_СобытияКлиентСерверПовтИсп.ПолучитьОбработчикСобытияФормыСервер(ИмяСобытия, ИмяФормы);
	
	Если Обработчик <> Неопределено Тогда
		Попытка
			Выполнить(Обработчик + "(" + ПараметрыОбработчика + ")");
		Исключение
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = Обработчик + "(" + ПараметрыОбработчика + ")";
			Сообщение.Сообщить();
		КонецПопытки;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область СобытияФорм_Справочники

#Область ПриСозданииНаСервере_Справочники

//ПРИМЕР
//Процедура ПриСозданииНаСервере_СправочникОборудование_ФормаЭлементаУпр(ЭтаФорма, Отказ, СтандартнаяОбработка, ДополнительныеПараметры = Неопределено)
//	
//	Элементы = ЭтаФорма.Элементы;
//	Команды = ЭтаФорма.Команды;
//	Объект = ЭтаФорма.Объект;
//	
//	Элемент = ДобавитьЭлемент(Элементы, "бит_НомерКабинета", Тип("ПолеФормы"), Элементы.ГруппаПодвал,,
//		Новый Структура("ПутьКДанным, Вид", "Объект.бит_НомерКабинета", ВидПоляФормы.ПолеВвода));
//	
//КонецПроцедуры
	
#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ДобавитьЭлемент(Элементы, Имя, Тип, Родитель = Неопределено, ВставитьПеред = Неопределено, Свойства = Неопределено)
	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;
	Элемент = Элементы.Вставить(Имя, Тип, Родитель, ВставитьПеред);
	ЗаполнитьЗначенияСвойств(Элемент, Свойства);
	Возврат Элемент;
КонецФункции

Функция СкопироватьЭлемент(Элементы, КопируемыйЭлемент, Имя, Тип, Родитель = Неопределено, ВставитьПеред = Неопределено, Свойства = Неопределено)
	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;
	Элемент = Элементы.Вставить(Имя, Тип, Родитель, ВставитьПеред);
	ЗаполнитьЗначенияСвойств(Элемент, КопируемыйЭлемент,, "ВыделенныйТекст, ПутьКДанным");
	ЗаполнитьЗначенияСвойств(Элемент, Свойства);
	Возврат Элемент;
КонецФункции

Функция ДобавитьКоманду(Команды, Имя, Свойства = Неопределено)
	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;
	Команда = Команды.Добавить(Имя);
	ЗаполнитьЗначенияСвойств(Команда, Свойства);
	Возврат Команда;
КонецФункции

#КонецОбласти

#Область ДополнительныеПроцедурыИФункции

Процедура СоздатьПредставлениеЭлементаОтбора(Элементы, ИмяЭлемента, ПутьКДанным)
		
	Элемент = СкопироватьЭлемент(Элементы, Элементы.Сотрудники, ИмяЭлемента, Тип("ПолеФормы"), Элементы.ГруппаОтборМоделиРасписания,,
	Новый Структура("ПутьКДанным", ПутьКДанным));
	Элемент.УстановитьДействие("ПриИзменении", "Подключаемый_бит_ОтборПриИзменении");
	Элемент.УстановитьДействие("НачалоВыбора", "Подключаемый_бит_ОтборНачалоВыбора");
	Элемент.УстановитьДействие("Очистка", "Подключаемый_бит_ОтборОчистка");
	Элемент.УстановитьДействие("ОбработкаВыбора", "Подключаемый_бит_ОтборОбработкаВыбора");
	Элемент.УстановитьДействие("ОкончаниеВводаТекста", "Подключаемый_бит_ОтборОкончаниеВводаТекста");
	Элемент.УстановитьДействие("АвтоПодбор", "Подключаемый_ОтборАвтоПодбор");
	
КонецПроцедуры

#КонецОбласти