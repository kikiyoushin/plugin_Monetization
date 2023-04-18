;; 画像表示箇所
; sleepgameにしたので何しても元に戻るぞ。

/*
sf.monetization_modeが0と1の時の表示を変える
任意の時、自動の時で表示が変わる
*/

;表示を全てデストロイする
;あとでテクニックサンプル集からデストロイ持ってくる
[reset_all]


[html ]

<!--この表示画像をいろんなのに変えられるようにする-->
<img src="data/others/plugin/monetization/img/free.png">

<font color="red"><p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p></font>
[endhtml ]
[s]
[wait time="5000" ]
[cm]

[awakegame variable_over=true bgm_over=false]
[s]

@eval exp="alert('CMにいるよ')" 