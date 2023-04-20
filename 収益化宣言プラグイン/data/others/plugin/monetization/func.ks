; 必要な変数をここで定義していく


;テクニックサンプル集1-macro.ksより
; ----------------------------------------------------------
; 画面の破壊/再構築系マクロ
; ----------------------------------------------------------



; ----------------------------------------------------------
; [destroy]
; すべてのレイヤーの画像やテキスト、ボタンなどを破壊し、
; ゲーム画面を更地に戻します。
[macro name="destroy"]
; メニューボタンを隠す
[hidemenubutton]
; メッセージの削除およびフリーレイヤーの解放
; (フリーレイヤー＝ボタンやHTMLなどが挿入されるレイヤー)
[cm]
; fixレイヤーの解放
[clearfix]
; 合成レイヤーの解放
[free_layermode time="0"]
; フィルターの解放
[free_filter]
; レイヤーの解放
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]
[freeimage layer="base" page="back"]
[freeimage layer="0"    page="back"]
[freeimage layer="1"    page="back"]
[freeimage layer="2"    page="back"]
; メッセージウィンドウの非表示
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]
[endmacro]

[macro name="reset_all"]
[destroy]
[showmenubutton]
[position width="928" height="608" left="16" top="16" color="0x000000" opacity="128" margint="8" marginr="8" marginb="8" marginl="8" frame="none"]
[deffont size="24" face="メイリオ"]
[resetfont]
[free name="chara_name_area" layer="message0"]
[layopt layer="base" visible="true"]
[layopt layer="0" visible="false"]
[layopt layer="1" visible="false"]
[layopt layer="2" visible="false"]
[layopt layer="message0" visible="true"]
[layopt layer="message1" visible="false"]
[endmacro]

; ----------------------------------------------------------
;manetizationオリジナルマクロ
; ----------------------------------------------------------


; ----------------------------------------------------------
;[confirm]
;任意のタイミングで確認画面を表示させます。
;sleepgame中は呼び出さないでください。
;[s]など画面が止まっているときが最適です。(選択肢や章の始まりなど)

[macro name="confirm" ]

    @sleepgame storage="&f.ilnk+'cm.ks'" 

[endmacro ]


[jump storage="&f.ilnk+'init.ks'" target="rtfunc"  ]