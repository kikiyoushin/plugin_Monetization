; モードを切り分ける。

;背景色を入れておく。黒と黄色の斜めストライプがいいかも

[glink target="modeset" exp="sf.monetization_mode=0"  x="&200*1" y="500" color="blue"   text="配信していない" ]
[glink target="modeset" exp="sf.monetization_mode=1"  x="&200*4" y="500" color="red"  text="配信している" ]
[html ]
<font color="white">
<h1><p>注意書き△これはゲーム本編ではありません△</p></h1>
<dt>このゲームは収益化宣言プラグインを導入しています。</dt>
<dd>以下の設問にお答えいただきゲームをお楽しみください。<br>あなたはこのゲームを…</dd>
</font>

[endhtml]
[s]
*modeset
[cm]
[iscript]
    tf.text=`
    <font color="white">
    これにて設定は終了です。<br>
    引き続きゲームをお楽しみいただくにはしばらくお待ちください。<br>
    このプラグインを無効化するパッチが発売中です。ぜひご検討ください。
    </font>
    `
[endscript ]


[ignore exp="sf.monetization_mode==0" ]
    [iscript]
        tf.text=`
        <font color="white">
        あなたの配信は収益が発生しますか？<br>
        発生する場合、以下のサイトから有料パッチのご購入が必要です。<br>
        収益が発生しない場合、しばらくお待ちください。
        
        </font>
        `
    [endscript ]
    [endignore ]

[glink x="200" y="500"   color="green" text="パッチ購入ページへ(インターネット接続が必要です)"  ]
[html ]
[emb exp="tf.text" ]
[endhtml ]

;ゲージがたまるアニメ入れる＃＃＃

[wait time="5000" ]


;これは初回呼び出しなのでreturnでいいかも。
[jump storage="&f.ilnk+'init.ks'" target="rtalctn"  ]

[s]
