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

@dialog text="読み込み前" 
[iscript]
	//var fp =TYRANO.kag.stat.f['ilnk']+'patch.ks';
//patch.ksが存在しなくても無視して進む。ある場合は読み込む。
/*
    var hoge ='D:/make/game/tyrano/plugin_Monetization/収益化宣言プラグイン/data/others/plugin/monetization/patch.ks';
    if(hoge.exists == true){
        tyrano.plugin.kag.ftag.startTag("jump", { storage:hoge,} );
    }else{
        alert(hoge.exists == true)
        }
        */
        /*
const fs = require('fs');
//let hoge = 'patch.ks'
const path = "/make/game/tyrano/plugin_Monetization/収益化宣言プラグイン/data/others/plugin/monetization/patch.ks";

if( fs.existsSync( path ) ){
    alert('あるよ');
}else{
    alert('ないよ');
}
*/
//https://mebee.info/2020/12/01/post-24350/
//https://magazine.techacademy.jp/magazine/40872
//https://note.affi-sapo-sv.com/nodejs-file-exists.php
const path = require('path')
const pathString = __filename;
const hoge = path.dirname(pathString)//indexのある階層
const fs = require('fs');
if( fs.existsSync( hoge + '/data/others/plugin/monetization/patch.ks' ) ){
    alert('あるよ');
}else{
    alert('ないよ');
}
        /*
// $.ajaxを退避
var orgAjax = $.ajax;
// $.ajaxをカスタマイズする
function customAjax(ajaxArgs) {
    var settings = $.extend({}, $.ajaxSettings, ajaxArgs);
    var deferred_org = $.Deferred();
    var jqXHR_org = orgAjax(settings)
        .then(
            function cmnDone(data, textStatus, jqXHR) {
                // 個別のdone()を呼び出す
                deferred_org.resolveWith(this, [data, textStatus, jqXHR])
            },
            function cmnFail(jqXHR, textStatus, errorThrown) {
                // 個別のfail()を呼び出す
                deferred_org.rejectWith(this, [jqXHR, textStatus, errorThrown]);
            }
        )
        .catch((e) => {
            // 個別のdoneで発生した例外をcatchできる
            console.trace(e);
        });
    return $.extend({}, jqXHR_org, deferred_org);
}
// $.ajaxを上書き
$.ajax = customAjax;







    var fp ='patch.ks'
	function is_file(fp){
		var flg=null;
		$.ajax({
			url: fp,
			cache: false,
			async:false
		}).done(function(data) {
			flg=true;
		})
		.fail(function(jqXHR, textStatus, errorThrown) {
			flg=false;
		});
		return flg;
	}

    var flg = is_file(fp);
		if(flg==true){
			alert('ファイルは存在します');
		}else{
			alert('ファイルは存在しません');
		}
*/
[endscript ]
*rtpt
@dialog text="読み込み後" 

[close ask="false" ]

; 必要な変数を定義していくとこ(first.ksでないとエラーの仕組みにする。)
[jump storage="&f.ilnk+'func.ks'" ]
*rtfunc

; mode2の時のみ表示。「この画面を配信に載せることで、あなたは正式な手順で配信を行っていることの証明になります」Yボタン


[ignore exp="sf.monetization_mode==2" ]

;注意書き。「このゲームは収益化宣言プラグインを入れています。とか諸注意。」
; ここでモード分岐。
;sf.monetization_modeが0の時無配信、1の時配信。2はパッチで変更。
[jump storage="&f.ilnk+'allocation.ks'" ]
*rtalctn

/*
あとやること
sf.monetization_modeによる下記の違い
**自動発生用タグ**
パッチ作成
mode2処理
*/

; 画面外で操作が行われたときの処理
[jump storage="&f.ilnk+'pause.ks'" ]

*rtpause

[endignore ]
[return]