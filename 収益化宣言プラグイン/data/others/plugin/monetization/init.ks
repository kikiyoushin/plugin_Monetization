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


あとやること
patch販売URLにつなげる

*/

; ここまでのパス
@eval exp="f.ilnk='../others/plugin/monetization/'"

[iscript]
//patch.ksが存在しなくても無視して進む。ある場合は読み込む。
//https://mebee.info/2020/12/01/post-24350/
//https://magazine.techacademy.jp/magazine/40872
//https://note.affi-sapo-sv.com/nodejs-file-exists.php
const path = require('path')
const pathString = __filename;
const hoge = path.dirname(pathString)//indexのある階層
const fs = require('fs');
const fuga =TYRANO.kag.stat.f['ilnk'] + 'patch.ks'
if( fs.existsSync( hoge + '/data/others/plugin/monetization/patch.ks' ) ){
//if( fs.existsSync( fuga ) ){
    tyrano.plugin.kag.ftag.startTag("jump", { storage:fuga,} );
    }
[endscript ]
*rtpt

; 必要な変数を定義していくとこ(first.ksでないとエラーの仕組みにする。)
[jump storage="&f.ilnk+'func.ks'" ]
*rtfunc

; mode2の時のみ表示。「この画面を配信に載せることで、あなたは正式な手順で配信を行っていることの証明になります」Yボタン
@dialog text="有料パッチお買い上げありがとうございます。" cond="sf.monetization_mode==2"

@eval exp="alert(sf.monetization_mode)" 
[ignore exp="sf.monetization_mode==2" ]

;注意書き。「このゲームは収益化宣言プラグインを入れています。とか諸注意。」
; ここでモード分岐。
;sf.monetization_modeが0の時無配信、1の時配信。2はパッチで変更。
[jump storage="&f.ilnk+'allocation.ks'" ]
*rtalctn

; 画面外で操作が行われたときの処理
[jump storage="&f.ilnk+'pause.ks'" ]

*rtpause

[endignore ]
[return]