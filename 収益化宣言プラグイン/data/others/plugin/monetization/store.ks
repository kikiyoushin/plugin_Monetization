;patchの販売サイトへ飛ばすところ

;おそらくこのdialogが原因でawakegameの時に1行進む
[dialog type="confirm" text="ゲームを終了してよろしいですか？" target="end"  target_cancel="continue" ]
[s]

*end
[web url="https://booth.pm/ja/items/4709269" ]
@wait time="1000" 

;今後勝手に閉じるようにするかも
[close ask="false" ]
[s]

;-------------------------------------------------------------

*continue
[web url="https://booth.pm/ja/items/4709269" ]
@wait time="1000" 

[iscript ]
	var hoge =TYRANO.kag.stat.f['ilnk']+'init.ks';

	//すでにsleepgameの状態の時、awakeで解除する。
	if (tyrano.plugin.kag.tmp.sleep_game != null){
        tyrano.plugin.kag.ftag.startTag("awakegame", { variable_over:true,} );
    }else{
        tyrano.plugin.kag.ftag.startTag("jump", { storage:hoge,target:'rtalctn',} );
    };

[endscript ]
[s]