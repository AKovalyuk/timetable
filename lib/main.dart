import 'dart:convert';

import 'package:android1/lesson.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'timetable.dart';
import 'profile.dart';
import 'structures.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TabsApp(currentWeek: 0,));
}

class TabsApp extends StatefulWidget {

  int currentWeek;

  TabsApp({super.key, required this.currentWeek});

  @override
  State<TabsApp> createState() => _TabsAppState(this.currentWeek);
}

class _TabsAppState extends State<TabsApp> {

  int currentWeek;
  _TabsAppState(this.currentWeek) {
    //this.jsonSet(jsonDecode('{"timetable":[{"day":"1","week":"1","time":"08:30-10:05","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"08:30-10:05","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"1","time":"10:15-11:50","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"10:15-11:50","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"1","time":"12:00-13:35","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"12:00-13:35","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"1","time":"14:10-15:45","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"14:10-15:45","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"1","time":"15:55-17:30","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"15:55-17:30","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"1","time":"17:40-19:15","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"1","week":"2","time":"17:40-19:15","subject":"\u0414\u0435\u043d\u044c \u0432\u043e\u0435\u043d\u043d\u043e\u0439 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438","type":"","teacher":"","place":"","building":"","room":"","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"1","time":"12:00-13:35","subject":"\u041e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u0435\u0434\u0438\u0430- \u043a\u043e\u043d\u0442\u0435\u043d\u0442\u0430 \u0427\u0430\u0441\u0442\u044c2","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0422\u0430\u043c\u0430\u0440\u043e\u0432\u0441\u043a\u0430\u044f \u0410. \u041d.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 2-17","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"2-17","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"2","time":"12:00-13:35","subject":"\u041e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u0435\u0434\u0438\u0430- \u043a\u043e\u043d\u0442\u0435\u043d\u0442\u0430 \u0427\u0430\u0441\u0442\u044c2","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0422\u0430\u043c\u0430\u0440\u043e\u0432\u0441\u043a\u0430\u044f \u0410. \u041d.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 2-17","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"2-17","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"1","time":"14:10-15:45","subject":"\u0422\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0438 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u0438","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0410\u043d\u0434\u043e\u043d\u0438 \u0421. \u0421.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-07","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-07","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"2","time":"14:10-15:45","subject":"\u0422\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0438 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u0438","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0410\u043d\u0434\u043e\u043d\u0438 \u0421. \u0421.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-07","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-07","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"1","time":"15:55-17:30","subject":"\u0418\u043d\u0442\u0435\u043b\u043b\u0435\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0438\u0441\u0442\u0435\u043c\u044b \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041f\u044f\u0442\u0430\u0435\u0432\u0430 \u0410. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-23","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-23","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"2","week":"2","time":"15:55-17:30","subject":"\u0418\u043d\u0442\u0435\u043b\u043b\u0435\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0438\u0441\u0442\u0435\u043c\u044b \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041f\u044f\u0442\u0430\u0435\u0432\u0430 \u0410. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-23","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-23","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"1","time":"14:10-15:45","subject":"\u041c\u0435\u0442\u043e\u0434\u044b \u0438 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u043f\u0440\u043e\u0435\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0439","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041c\u0430\u0433\u043b\u0438\u043d\u0435\u0446 \u042e. \u0410.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 1-15","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"1-15","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"2","time":"14:10-15:45","subject":"\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u043e\u0431\u0438\u043b\u044c\u043d\u043e\u0433\u043e \u041f\u041e","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041a\u0443\u0448\u043d\u0430\u0440\u0435\u043d\u043a\u043e \u0410. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 1-15","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"1-15","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"1","time":"15:55-17:30","subject":"\u0422\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0438 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u0438","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u0414\u044c\u044f\u0447\u0443\u043a \u041f. \u041f.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 1-15","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"1-15","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"2","time":"15:55-17:30","subject":"\u0422\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0438 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u0438","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u0414\u044c\u044f\u0447\u0443\u043a \u041f. \u041f.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 1-15","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"1-15","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"1","time":"17:40-19:15","subject":"\u0410\u043d\u0433\u043b\u0438\u0439\u0441\u043a\u0438\u0439 \u044f\u0437\u044b\u043a \u0434\u043b\u044f \u043f\u0440\u043e\u0444\u0435\u0441\u0441\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u044b\u0445 \u0446\u0435\u043b\u0435\u0439","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041b\u0438\u0447\u0430\u0440\u0433\u0438\u043d \u0414. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 2-02, \u042d\u0418\u041e\u0421","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"2-02, \u042d\u0418\u041e\u0421","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"3","week":"2","time":"17:40-19:15","subject":"\u041e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u0435\u0434\u0438\u0430- \u043a\u043e\u043d\u0442\u0435\u043d\u0442\u0430 \u0427\u0430\u0441\u0442\u044c2","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u0410\u043d\u0438\u043a\u044c\u0435\u0432\u0430 \u041c. \u0410.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 2-17","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"2-17","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"4","week":"1","time":"12:00-13:35","subject":"\u041c\u0435\u0442\u043e\u0434\u044b \u0438 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u043f\u0440\u043e\u0435\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0439","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0411\u0440\u0435\u0436\u043d\u0435\u0432 \u0420. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=1647","sync":"\u0430\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"4","week":"1","time":"15:55-17:30","subject":"\u0418\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041a\u0443\u0441\u0442\u043e\u0432 \u0414. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=22118","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"4","week":"2","time":"15:55-17:30","subject":"\u0418\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041a\u0443\u0441\u0442\u043e\u0432 \u0414. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=22118","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"4","week":"1","time":"17:40-19:15","subject":"\u0410\u043d\u0430\u043b\u0438\u0437 \u0431\u043e\u043b\u044c\u0448\u0438\u0445 \u0434\u0430\u043d\u043d\u044b\u0445","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041f\u0430\u0445\u043e\u043c\u043e\u0432\u0430 \u041a. \u0418.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=21979","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"4","week":"2","time":"17:40-19:15","subject":"\u0418\u043d\u0442\u0435\u043b\u043b\u0435\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0438\u0441\u0442\u0435\u043c\u044b \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438","type":"\u043b\u0435\u043a\u0446\u0438\u044f","teacher":"\u041f\u044f\u0442\u0430\u0435\u0432\u0430 \u0410. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=8904","sync":"\u0430\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"5","week":"1","time":"15:55-17:30","subject":"\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u043e\u0431\u0438\u043b\u044c\u043d\u043e\u0433\u043e \u041f\u041e","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041a\u0443\u0448\u043d\u0430\u0440\u0435\u043d\u043a\u043e \u0410. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-01","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-01","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"5","week":"2","time":"15:55-17:30","subject":"\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u043a\u0430 \u043c\u043e\u0431\u0438\u043b\u044c\u043d\u043e\u0433\u043e \u041f\u041e","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041a\u0443\u0448\u043d\u0430\u0440\u0435\u043d\u043a\u043e \u0410. \u0412.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-01","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-01","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"5","week":"1","time":"17:40-19:15","subject":"\u0410\u043d\u0430\u043b\u0438\u0437 \u0431\u043e\u043b\u044c\u0448\u0438\u0445 \u0434\u0430\u043d\u043d\u044b\u0445","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041f\u043e\u043b\u044f\u043a\u043e\u0432\u0430 \u0410. \u0421.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-20","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-20","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"5","week":"2","time":"17:40-19:15","subject":"\u0410\u043d\u0430\u043b\u0438\u0437 \u0431\u043e\u043b\u044c\u0448\u0438\u0445 \u0434\u0430\u043d\u043d\u044b\u0445","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041f\u043e\u043b\u044f\u043a\u043e\u0432\u0430 \u0410. \u0421.","place":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617, \u0430\u0443\u0434. 4-20","building":"\u041a\u043e\u0440\u043f\u0443\u0441 \u211617","room":"4-20","sync":"\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"6","week":"1","time":"12:00-13:35","subject":"\u0418\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041a\u0443\u0441\u0442\u043e\u0432 \u0414. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=22118","sync":"\u0430\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"6","week":"1","time":"14:10-15:45","subject":"\u0418\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0440\u0435\u0434\u0441\u0442\u0432\u0430 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0441\u0438\u0441\u0442\u0435\u043c","type":"\u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u041a\u0443\u0441\u0442\u043e\u0432 \u0414. \u0412.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=22118","sync":"\u0430\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"},{"day":"6","week":"1","time":"15:55-17:30","subject":"\u0424\u0438\u0437\u0438\u0447\u0435\u0441\u043a\u0430\u044f \u043a\u0443\u043b\u044c\u0442\u0443\u0440\u0430 \u0438 \u0441\u043f\u043e\u0440\u0442","type":"\u043b\u0435\u043a\u0446\u0438\u044f, \u043f\u0440. \u0437\u0430\u043d\u044f\u0442\u0438\u0435","teacher":"\u0411\u0440\u044e\u0445\u0430\u043d\u043e\u0432\u0430 \u041d. \u0410.","place":"\u042d\u0418\u041e\u0421","building":"\u042d\u0418\u041e\u0421","room":"https:\/\/e.sfu-kras.ru\/course\/view.php?id=27590","sync":"\u0430\u0441\u0438\u043d\u0445\u0440\u043e\u043d\u043d\u043e"}],"target":"\u041a\u041820-11\u0431 (2 \u043f\u043e\u0434\u0433\u0440\u0443\u043f\u043f\u0430)","type":"group","institute":"\u0418\u043d\u0441\u0442\u0438\u0442\u0443\u0442 \u043a\u043e\u0441\u043c\u0438\u0447\u0435\u0441\u043a\u0438\u0445 \u0438 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u044b\u0445 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0439"}'));
  }

  List<Week> weeks = [
    /*Week(days: [
      DayStruct(
          title: 'Вторник, 33 апреля',
          table: [
            LessonStruct(subject: 'subject', type: 'type', time: 'time', location: 'location', lessonId: 1)
          ])
    ])*/
  ];

  jsonSet(Map<String, dynamic> data) {
    List<List<List<LessonStruct>>> weeks_data = [
      [[], [], [], [], [], []],
      [[], [], [], [], [], []]
    ];
    int id = 0;
    for (final lesson in data['timetable']) {
      int day_index = int.parse(lesson['day']) - 1;
      int week_index = int.parse(lesson['week']) - 1;
      weeks_data[week_index][day_index].add(LessonStruct(
          subject: lesson['subject'],
          type: lesson['type'],
          time: lesson['time'],
          location: lesson['place'],
          teacher: lesson['teacher'],
          lessonId: id
        )
      );
      id += 1;
    }
    for (final week in weeks_data) {
      for (final day in week) {
        day.sort((a, b) => a.time.compareTo(b.time));
      }
    }
    this.weeks = [];
    for (final week in weeks_data) {
      weeks.add(Week(
        days: List<DayStruct>.from(week.map(
                (day) => DayStruct(title: '', table: day)
        ))
      ));
    }
  }

  int _currentIndex = 0;
  String? currentGroup = ";";

  getTimetable(String? group) {
    return http.get(Uri.parse('https://edu.sfu-kras.ru/api/timetable/get&target=$group'));
  }

  _gotoTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  changeWeek() {
    setState(() {
      currentWeek = currentWeek == 1 ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('$currentWeek, $this');
    var textStyle = const TextStyle(
      color: Color(0xFF777777)
    );

    return MaterialApp(
      title: 'SibFU Timetable',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFFFFFF),
        ),
        textTheme: TextTheme(
          bodySmall: textStyle,
          bodyMedium: textStyle
        ),

      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          toolbarOpacity: 1,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Расписание',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Моя группа'
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _gotoTab,
        ),
        body: this._currentIndex == 1 ?
        Profile(callback: this.setState) :
        FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext buildContext, AsyncSnapshot<SharedPreferences> snapshot) {
              if (!snapshot.hasData || snapshot.data?.getString('group') == null) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Расписание не загружено"),
                        Text("Нет интернета или не выбрана группа")
                      ],
                    )
                );//Timetable(week: Week(days: <DayStruct>[]));
              }
              else {
                if (snapshot.data?.getString('group') == this.currentGroup) {
                  return Timetable(week: weeks[currentWeek], callback: changeWeek,);
                }
                else {
                  return FutureBuilder<http.Response>(
                      future: getTimetable(snapshot.data?.getString('group')),
                      builder: (BuildContext buildContext, AsyncSnapshot<http.Response> responseSnapshot) {
                        if (responseSnapshot.hasData) {
                          this.currentGroup = snapshot.data?.getString('group');
                          jsonSet(jsonDecode(responseSnapshot.data!.body));
                          return Timetable(week: weeks[currentWeek], callback: changeWeek,);
                        }
                        else {
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Расписание не загружено"),
                                  Text("Нет интернета или не выбрана группа")
                                ],
                              )
                          );//Timetable(week: Week(days: <DayStruct>[]));
                        }
                      });
                }
              }
            }
        ),
        //pages.elementAt(_currentIndex),
      ),
    );
  }
}
