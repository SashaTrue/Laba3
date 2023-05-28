# Laba3
В этой лабараторной работе было создано приложение, которое из формы на сайте создает таблицу на том же сайте

Был использован паттерн программирования MVC
Model - Student.java
View - index.jsp
Controller - StudentController.java

На сайте вводятся данные:
![image](https://github.com/SashaTrue/Laba3/assets/32790158/1f9cde55-3126-40c2-93aa-086456204dff)

Из данных создается json строчка
Эта строчка дессериализуется в POJO объект и так записывается в файл на сервере 

И выводятся в табличку под формой ввода
![image](https://github.com/SashaTrue/Laba3/assets/32790158/69b025a9-861a-49eb-83a5-5b2e1f7e60e6)
