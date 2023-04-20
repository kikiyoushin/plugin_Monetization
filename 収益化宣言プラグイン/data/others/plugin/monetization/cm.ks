;; 画像表示箇所
; sleepgameにしたので何しても元に戻るぞ。

/*
sf.monetization_modeが0と1の時の表示を変える
任意の時、自動の時で表示が変わる
*/

;表示を全てデストロイする
[reset_all]

;[web url="./data/others/plugin/monetization/newpage.html"]
;[loadcss file="&f.ilnk+'style.css'" ]
[loadcss file="./data/others/plugin/monetization/style.css" ]

@eval exp="tf.hoge='もし配信している場合、配信モードに切り替えてください。'" cond="sf.monetization_mode==0"  
@eval exp="tf.hoge='もし収益が発生している場合このゲームの規則違反です。ご注意ください。'" cond="sf.monetization_mode==1"  

[iscript ]
    tf.xpl=200
    tf.spr=600
    tf.yp=500
    tf.text1=""
    tf.text2=""
[endscript ]

[glink name="cntbtnl" target="modeset" exp="sf.monetization_mode=0" width="200"  x="200" color="blue"  text="私は配信をしていません" cond="sf.monetization_mode==0"]

[glink name="cntbtnr" target="" exp="sf.monetization_mode=1" width="200"  x="500" color="red"  text="私は配信をしているので切り替えます" cond="sf.monetization_mode==0"]


[glink name="cntbtnc" target="modeset" exp="sf.monetization_mode=1" x="200" color="red"  text="私の配信には収益は発生していません" cond="sf.monetization_mode==1"]


[glink name="cntbtn" x="200" color="green" text="パッチ購入ページへ(インターネット接続が必要です)"  ]
[iscript ]

    //xy0,0を左上からからオブジェクト中央にする。画面に出してからcssを編集する。
    $('.glink_button').css({
        'background-position': 'center center',
        'top' : 'auto','bottom' : '30px',
        })
        $('.cntbtnc').css({'left':'50%','right':'auto','bottom':'+=100px',
        'transform': 'translateX(-50%)translateY(0%)'}),
        $('.cntbtnl').css({'left':'100px','right':'auto','bottom':'+=100px'})
        $('.cntbtnr').css({'left':'auto','right':'100px','bottom':'+=100px'})
[endscript ]

; このゲームは収益化プラグインを導入しています。しばらくお待ちください。
[html ]

<body>
    <section class="container">
        <dl>

            <dt>
                <img src="./data/others/plugin/monetization/img/free.png" alt="絵">
            </dt>
            <dd>
                <p>確認のためボタンを押してください[emb exp="tf.hoge"]</p>
            </dd>
        </dl>
    </section>

</body>
[endhtml ]
[s]
*modeset
[wait time="500" ]
[cm]

[awakegame variable_over=true bgm_over=false]
[s]

@eval exp="alert('CMにいるよ')" 