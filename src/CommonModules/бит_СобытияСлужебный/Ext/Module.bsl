﻿Функция ДобавитьЭлемент(Элементы, Имя, Тип, Родитель = Неопределено, ВставитьПеред = Неопределено, Свойства = Неопределено) Экспорт

	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;

	Элемент = Элементы.Вставить(Имя, Тип, Родитель, ВставитьПеред);
	ЗаполнитьЗначенияСвойств(Элемент, Свойства);

	Возврат Элемент;
	
КонецФункции

Функция СкопироватьЭлемент(Элементы, КопируемыйЭлемент, Имя, Тип, Родитель = Неопределено, ВставитьПеред = Неопределено, Свойства = Неопределено) Экспорт

	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;

	Элемент = Элементы.Вставить(Имя, Тип, Родитель, ВставитьПеред);
	ЗаполнитьЗначенияСвойств(Элемент, КопируемыйЭлемент,, "ВыделенныйТекст, ПутьКДанным");
	ЗаполнитьЗначенияСвойств(Элемент, Свойства);

	Возврат Элемент;
	
КонецФункции

Функция ДобавитьКоманду(Команды, Имя, Свойства = Неопределено) Экспорт

	Если Свойства = Неопределено Тогда
		Свойства = Новый Структура;
	КонецЕсли;

	Команда = Команды.Добавить(Имя);
	ЗаполнитьЗначенияСвойств(Команда, Свойства);

	Возврат Команда;
	
КонецФункции
