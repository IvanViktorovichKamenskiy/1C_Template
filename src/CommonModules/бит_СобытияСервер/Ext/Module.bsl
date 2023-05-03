﻿#Область ШлюзПодписок

Процедура ПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка, ДополнительныеПараметры = Неопределено) Экспорт
	ИмяФормы = ЭтаФорма.ИмяФормы;
	ИмяСобытия = "ПриСозданииНаСервере";
	ПараметрыОбработчика = "ЭтаФорма, Отказ, СтандартнаяОбработка, ДополнительныеПараметры";
	
	Обработчик = бит_СобытияПовтИсп.ПолучитьОбработчикСобытияФормы(ИмяСобытия, ИмяФормы);
	
	Если Обработчик <> Неопределено Тогда
		Попытка
			ВыполняемаяСтрока = Обработчик + "(" + ПараметрыОбработчика + ")";
			Выполнить(ВыполняемаяСтрока); // BSLLS:ExecuteExternalCodeInCommonModule-off
		Исключение
			ТекстСообщения = "%1
							|%2";
			ТекстСообщения = СтрШаблон(ТекстСообщения, ВыполняемаяСтрока, ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
			ОбщегоНазначения.СообщитьПользователю(ТекстСообщения);
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

	Возврат бит_СобытияСлужебный.ДобавитьЭлемент(Элементы, Имя, Тип, Родитель, ВставитьПеред, Свойства);

КонецФункции

Функция СкопироватьЭлемент(Элементы, КопируемыйЭлемент, Имя, Тип, Родитель = Неопределено, ВставитьПеред = Неопределено, Свойства = Неопределено)
	
	Возврат бит_СобытияСлужебный.СкопироватьЭлемент(Элементы, КопируемыйЭлемент, Имя, Тип, Родитель, ВставитьПеред, Свойства);
	
КонецФункции

Функция ДобавитьКоманду(Команды, Имя, Свойства = Неопределено)

	Возврат бит_СобытияСлужебный.ДобавитьКоманду(Команды, Имя, Свойства);
	
КонецФункции

#КонецОбласти