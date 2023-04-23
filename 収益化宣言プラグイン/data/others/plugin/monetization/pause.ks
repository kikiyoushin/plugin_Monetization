; ゲームの画面外で何かしらアクションが起きたときに発生させるイベントの記入箇所です。
; 表示するマスク画像を変更する場合は以下の操作を行ってください。
; web上の画像を指定する。(投稿サイトにより弾かれる可能性があります。)
; data/imageフォルダ内の画像を使用する

; 👆それぞれ変数の中身を変更するようにする。


[iscript ]
//https://blog-and-destroy.com/28452
function play() {
	// 実行させる処理を記述
}

// ウィンドウがアクティブでなくなった際に実行する関数
function pause() {
	// 実行させる処理を記述
    //alert("パッシヴウィンドウになりました。")
	//すでにsleepgameの状態の時、awakeで解除する。
	if (tyrano.plugin.kag.tmp.sleep_game != null)tyrano.plugin.kag.ftag.startTag("awakegame", { variable_over:true,} );

	var hoge =TYRANO.kag.stat.f['ilnk']+'cm.ks';
	tyrano.plugin.kag.ftag.startTag("sleepgame", { storage:hoge,} );

}

// ウィンドウをフォーカスしたら指定した関数を実行
window.addEventListener('focus', play, false);

// ウィンドウからフォーカスが外れたら指定した関数を実行
window.addEventListener('blur', pause, false);
[endscript ]

[jump storage="&f.ilnk+'init.ks'" target="rtpause"  ]