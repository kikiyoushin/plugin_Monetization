; 呼び出し

/*
firstで必ず1度呼び出すようにする。
呼び出さないと使えない。
この1度目で必要な変数を入れる。他のプラグインや制作マクロで使用されないような複雑なものにする。

2回目の呼び出しからマスクを呼び出す。

対抗パッチを作成する。
パッチでも1度はfirstで呼び出される。
その後、2回目以降の起動を無効化する。

プロパティ
・止めている時間
・呼び出す画像の種類

*/

; ここまでのパス
@eval exp="f.ilnk='../others/plugin/monetization/'"

; 必要な変数を定義していくとこ(first.ksでないとエラーの仕組みにする。)
[jump storage="&f.ilnk+'func.ks'" ]
*rtfunc

; mode2の時のみ表示。「この画面を配信に載せることで、あなたは正式な手順で配信を行っていることの証明になります」Yボタン

;注意書き。「このゲームは収益化宣言プラグインを入れています。とか諸注意。」
; ここでモード分岐。
;sf.monetization_modeが0の時無配信、1の時配信。2はパッチで変更。
;[jump storage="&f.ilnk+'allocation.ks'" ]
*rtalctn

/*
あとやること
sf.monetization_modeによる下記の違い
パッチ作成
awakegameだけど、awakegame中に発生したとき大丈夫か？
mode2処理
*/

; 画面外で操作が行われたときの処理
[jump storage="&f.ilnk+'pause.ks'" ]

*rtpause

[return]