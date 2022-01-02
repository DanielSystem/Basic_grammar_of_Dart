import 'package:flutter/material.dart';

void main() => closureDemo();//当执行语句只有一句的时候，可以使用箭头函数=>调用

/*
* 闭包block，定义在函数里面的函数，闭包也是一个对象
* 闭包的作用：可以房屋外部函数的局部变量
* */
closureDemo(){
  var func = funA();
  func();
  func();
  func();
  func();//3 //函数访问体被销毁之前，函数访问内的变量不会被释放

  var func2 = funA();
  func2();
  func2();
  func2();
  func2();//3
}

funA(){
  int count = 0;//在block内，不会被释放
  return ()=>print(count ++);
}

//Dart 中的方法
/*
* 方法也是一个对象
* 返回值和参数类型可以省略
* 当执行语句只有一句的时候，可以使用箭头函数=>调用
* */
void functionDemo(){
  print(sum(10,20));

  //可选参数调用的时候必须带上可选参数名称
  print(sum1(10,b:20));//传必选参数a，和可选参数b，c不传值

  //列表式可选参数按下标赋值
  print(sum2(10,2,3));//传必选参数a 10，可选参数b 2，c 3
  print(sum2(10,2));//传必选参数a 10，可选参数b 2，c 不传值


  //方法也是一个对象
  var hello = printHello();

  var list = [1,2,3,4];
  list.forEach(print);//遍历列表

  forEachDemo(list, printElement);//方法作为对象，用于参数传递

}

//方法作为对象，用于参数传递，回调
forEachDemo(List list, void func(var element)){//func是方法对象，element 是参数
  for (var e in list){
    func(e);//调用方法对象，传元素进去
  }
}

int b = 0;
printElement(var a){
  b++;
  print('Element $b = $a');
}

//匿名函数
anonymityFunction(){
   var func = (){
    print('匿名方法');
  };
  func();//调用

  //立即执行方法
   ((){
    print('立即执行方法');
   });

   var list = [1,2,3,4];

   //   forEachDemo(list,  (var a){b++;print('Element $b = $a');}  );//匿名方法，立即执行方法,传入一个方法带有参数的
   forEachDemo(list, (var a){//匿名方法，立即执行方法,传入一个方法带有参数的
       b++;
       print('Element $b = $a');
   });
}



num sum1(int a,{int? b,int? c}){//括号{}中是可选参数，由于int是不能为空non-null，所以加上""nullabelity表示可以为空，告诉编译器，后面已经处理了为空的情况情
  // num sum1(int a,{int b = 0,int c = 0}){或者给一个默认值，就不会报错了
  b ??= 10;//为空赋值，为空处理
  c ??= 20;
  return a + b + c;

}

num sum2(int a,[int b = 0, c = 0]){//列表式可选参数

  return a + b + c;

}

//Dart是面向对象语言，一个方法变成一个对象，作为一个变量
printHello() => print('hello');


/*
不建议这么写，不利于阅读

返回值和参数类型可以省略
sum( a,  b){
  return a + b;
}

当执行语句只有一句的时候，可以使用箭头函数=>调用
sum( a,  b) => a + b;

省略写法 + 三目运算
sum( a,  b) => a == 1 ？a + b : a - b;
* */

//推荐写法，
int sum(int a, int b){
  return a + b;
}


void varfinalcost(){
  {
    //声明变量
    var a;
    print(a);
    a = 'hello';
    print(a);
    a = 10;
    print(a + 10);

    //声明一个最终变量，之后就不可再赋值
    final c = 999;
    //声明一个最终变量，可以再赋值同类型
    final d;
    //最终变量使用之前必须赋值。不然会报错
    //(X) print(d);
    d = 9;
    print(d);

    //声明一个常量，必须立即赋值，且不可以修改
    const e = 20;
    print(e);


    //但是可以赋值同类型数据
    // d = 1000;
    //常量不能改变类型
    //(X) c = 'hello';

  }
}



void numDemo(){
  double a = 20.0;
  a = 10;//double 可以赋值整数

  print(a);
  int b = 8;
  //(x)  b = 8.8;  int不能赋值偶数报错

  print(b.isEven);//偶数；
  print(b.isOdd);//基数

  //算数运算符 + - * /
  //%取模
  //~/取整
  print(a ~/b ); // 10 ~/ 8 = 1 ;  (x)1.25
  print(a.toInt());//转换成int
  print(b.toDouble());//转换成double.

  //Dart特殊运算符
  // ??= 为空赋值
  var f;
  f ??= 10;

  var g;
  print(g ?? f);//为空选择，如果g有值就输出g，如果g为空就输出f
}

void stringMode(){
  String a = 'string';

  //双引号可以多行
  String b = "string b"
     "string b"
     "string b";

  //三引号可以多行
  String c = '''
  a 
  b
  c
  ''';

  print(a[0]);//截取第一个字符
  print(a + "b");//拼接字符
  print(a * 2);//字符乘2；

  int e = 10;
  int f = 20;
  print('c + d = ${e + f}');//输出表达式
  int g = e + f;
  print('g = $g');

  String str3 = "ABC\nDEF";
  String str4 = r"ABC\nDEF";//r转义字符

  str3.length;//字符长度
  str4.length;//字符长度 ，转义字符后，长度会发生变化


}

void listDemo(){
  //Dart 中的列表可以放不同的数据类型
  var list1 = [1,2.2,'abc'];

  var list2 = const [1,2.2,'abc'];//常量列表
  //（x）list2[2] = 'efd';运行后会奔溃，常量数组不能改变数据

  var list3 = ['abc',2];
  list3.add('def');//添加
  list3.insert(1, '123');//插入
  list3.remove('123');//删除
  list3.removeAt(1);//下表删除

  var list4 = [1,4,5,2,6,3];
  list4.sort();//排序;

  var list5 = list4.sublist(1,4);//数组下标截取
  print(list5);
}

void mapDemo(){
  var a = {'one':'abc','two':'def'};
  print(a['one']);//取值
  print(a.length);//键值对个数；
  print(a.values);//值的内容;
  print(a.keys);//键的内容；

  var list = ['a','b','c'];
  var map = list.asMap();//列表转键值对

}