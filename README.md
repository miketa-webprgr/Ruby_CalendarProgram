# カレンダーアプリ作成

## 概要

伊藤淳一さんのブログで紹介されていたRubyのアウトプットネタ。  

> 「たのしいRuby」に載っている、オーソドックスなカレンダー作成問題です。  
> DateクラスのAPIさえわかれば、あとは基礎的なプログラミング知識だけでコードが書けると思います。  

## 課題

Rubyを実行すると、自動で今月のカレンダーが表示されるようなRubyプログラムを作成する課題すること。  

> 課題  
>
> **Date クラスを使って、今月の１日と月末の日付と曜日を求め、  
> 次のような形式でカレンダーを表示させてください**  
>
> - [アウトプットのネタに困ったらこれ！？Ruby初心者向けのプログラミング問題を集めてみた（全10問） \- give IT a try](https://blog.jnito.com/entry/2019/05/03/121235)  

プログラムを実行すると、以下のように出力されるようにしなければならない。  

```text
     July 2020
 Su Mo Tu We Th Fr Sa
           1  2  3  4
  5  6  7  8  9 10 11
 12 13 14 15 16 17 18
 19 20 21 22 23 24 25
 26 27 28 29 30 31
```

## 作品集

勝手に仲間内で作ったものをまとめてみました。  
また、参考までにネット上で公開されているものもリンク貼っておきます。  

### okamotoさん

https://github.com/YuukiOkamoto/ruby-programming-questions/tree/master/calendar

### taishiroさん

https://github.com/Taishikun0721/Rails_Sparta_TIL/pull/11/commits

### miketa

リファクタ前  
https://github.com/miketa-webprgr/Ruby_CalendarProgram/blob/master/02_1_miketa.rb

リファクタ後  
https://github.com/miketa-webprgr/Ruby_CalendarProgram/blob/master/02_2_miketa.rb  
https://github.com/miketa-webprgr/Ruby_CalendarProgram/blob/master/02_2_miketa_calendar.rb  

### その他ネットで見つけたもの

sackey_24さん  
https://qiita.com/sackey_24/items/8fc236bb054aff6b74c8  

yuuyas222さん（記事のコードを足し上げていくと回答になる？）  
https://qiita.com/yuuyas222/items/5681377b4ca84cf71078  

@keisuke713さん（未確認のため、同じものを作っているか不明）  
https://qiita.com/keisuke713/items/57e6454ee09297189b90  

cubenetさん  
https://tegecat.com/2020/05/12/12000/  

## 感想

- Railsの勉強になるようで、意外とならないような気もした。  
  - 伊藤さんから、MVCを意識しろとの指摘がブログで上がっていたので、そうすると勉強になるかも。
  - [きみたちは今まで何のためにRailsでMVCパターンを勉強してきたのか \- Qiita](https://qiita.com/jnchito/items/e2b1c8904cd7b8e3ce50)
- この問題が解けるかどうかは、以下によるところが大きい気がする。  
  - 数学的なセンス・知識があるか
  - Rubyの便利なメソッドを知っているか
  - これらの能力は、Railsではさほど重要でないかも
- ただ、リファクタリングについてはRailsの勉強につながったように思う。
  - 可読性を意識して書き直してみたが、メソッドを分ければ分けるほど長くなる。
  - また、何となくクラスを作ってみたが、そもそもの意義について考えさせられた。
  - ロジックと画面表示の役割の分割を意識すれば、よりよい勉強になりそう。
