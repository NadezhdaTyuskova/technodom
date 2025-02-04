import 'package:flutter/material.dart';

import 'instrument.dart';

class CartModel extends ChangeNotifier{
  final List _shopItemsEl=[
    Instrument(itemName: 'Цепная пила\nPatriot ESP 1814',itemPrice:"2000",itemPath: "lib/pictures/e1.jpeg", category: InstrumentCategory.elinstrument,itemOther:"Двигатель: электрический, ХХ 7600 об/мин,\nМощность: 1800 Вт,\nДлина шины: 14 дюймов, 35 см;\nЦепь: шаг 3/8,\nширина паза 1.3 мм,\nколичество звеньев 53;\nВес: 4.5 кг;"),
    Instrument(itemName: 'Дрель ударная\nВихрь ДУ-500',itemPrice:"3000",itemPath: "lib/pictures/e4.jpeg", category: InstrumentCategory.elinstrument,itemOther:"Мощность: 500 Вт;\nКоличество скоростей: односкоростная; 0 - 3000 об/мин, \nПатрон: ключевой, 1.5 - 13 мм,\nДиаметр сверления: сталь 10 мм, дерево 25 мм, бетон 13 мм,\nВес: 1.7 кг;"),
    Instrument(itemName: 'Дрель-шуруповерт\nMakita DF333DWYE',itemPrice:"3500",itemPath: "lib/pictures/e5.jpeg", category: InstrumentCategory.elinstrument,itemOther:"Крутящий момент: 30 Н*м, ступеней 20+1;\nОбороты: 450 об/мин / 1700 об/мин, скоростей двухскоростной;\nФункции: сверление, подсветка,\nОсновной патрон: быстрозажимной, 0.8 - 10 мм;\nБатарея: Li-Ion, 12 В, 1.5 Ач;запасная батарея в комплекте;\nВес: 1.1 кг"),
    ];
  final List _shopItemsBenz=[
    Instrument(itemName: 'Мотоблок Patriot\nУрал М',itemPrice:"60000",itemPath: "lib/pictures/e2.jpeg", category: InstrumentCategory.benzoinstrument,itemOther:"Ширина обработки: 90 см;\nДвигатель: бензиновый, 4-х тактный,\nКоличество скоростей: 6 - вперед/2 - назад;\nПривод (редуктор): цепной;\nТопливо: АИ-92,"),
    Instrument(itemName: 'Снегоуборщик\nHyundai\nS 7713-T',itemPrice:"30000",itemPath: "lib/pictures/e3.jpeg", category: InstrumentCategory.benzoinstrument,itemOther:"Захват: ширина 76.4 см, высота 54 см,\nДальность выброса снега: до 15 м;\nШнек: форма зубчатая, материал металл,\nКоличество скоростей: 6 - вперед / 2 - назад;\nШасси: гусеничное, самоходное,\nДвигатель: бензиновый, 13 л.с., 383 см3,\nТопливо: АИ-92, бак 6 л"),
  ];
  final List _shopItemsHand=[
    Instrument(itemName: 'Лопата\nштыковая',itemPrice:"2000",itemPath: "lib/pictures/r2.jpeg", category: InstrumentCategory.handinstrument,itemOther:"Назначение: для земляных работ;\nМатериал лезвия: сталь;\nМатериал рукоятки: металл;\nДлина: 120 см;"),
    Instrument(itemName: 'Тачка\nсадовая',itemPrice:"3000",itemPath: "lib/pictures/r1.jpeg", category: InstrumentCategory.handinstrument,itemOther:"Объем: 65 л.\nГрузоподъемность: 90 кг.\nТолщина кузова: 0,6 мм.\nТип колеса: Пневмо.\nДиаметр колеса: 355 мм.\nКоличество колес: 1 шт.\nПодшипник: Стальной.\nВнутренний диаметр подшипника: 16 мм.\nДиаметр рамы: 25 мм.\nМатериал кузова: Оцинкованная сталь."),
  ];


  //список товаров в корзине
  List _cartItems=[];
  get shopItemsEl =>_shopItemsEl;
  get shopItemsBenz =>_shopItemsBenz;
  get shopItemsHand =>_shopItemsHand;
  get cartItems =>_cartItems;
  // добавление товаров в корзину

  void addElItemToCart(int index){
    _cartItems.add(_shopItemsEl[index]);
    notifyListeners();
  }
  // добавление товаров в корзину
  void addBenzItemToCart(int index){
    _cartItems.add(_shopItemsBenz[index]);
    notifyListeners();
  }
  // добавление товаров в корзину
  void addHandItemToCart(int index){
    _cartItems.add(_shopItemsHand[index]);
    notifyListeners();
  }
//удаление товаров из корзины
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
//вычисление итоговой стоимости
  String calculateTotal(){
    double totalPrice=0;
    for(int i=0; i<_cartItems.length; i++){
      totalPrice+=double.parse(_cartItems[i].itemPrice);
    }
    return totalPrice.toStringAsFixed(2);
  }
   List instrument=[];
   List listall(){
     instrument.addAll(_shopItemsBenz);
     instrument.addAll(_shopItemsEl);
     instrument.addAll(_shopItemsHand);
     return instrument;

  }
}
