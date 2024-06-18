#set page(
  paper: "us-letter",
  numbering: "1",
)

#set par(justify: true)
#set text(
	lang: "ja",
	font: ("Linux Libertine", "Harano Aji Mincho"),
	size: 11pt,
)

#align(center + horizon, text(17pt)[
	*情報科学実験1 \
	2.フリップフロップと同期式回路*
])

#align(center + horizon, text[
	実験グループ: A班 \
	報告者: J2200071 齊藤 隆斗 \
	共同実験者: J2200038 小淵 萌, #h(0.3cm) J2200104 知久拓生, #h(0.3cm) J2200158 矢島 琴恵 \

	実験実施日: 2024年6月6日 \
	レポート提出日: 2024年6月13日 \
	提出期限: 2024年6月13日
])

#pagebreak()

#show figure.where(
    kind: table
): set figure.caption(position: top)

#set heading(numbering: "1.")

= 実験の目的
論理回路から得られる出力が、その時点で与えられている入力のみならず、それまでに与えられてきた過去の入力にも依存する場合、
そのような論理回路を「順序回路（sequential circuit）」と呼ぶ.
本実験では、この順序回路を構成する際に基本的な要素となるフリップフロップおよびレジスタについて詳しく取り上げる.
具体的には、フリップフロップとレジスタの構成およびその基本的な動作原理について理解することを目的とする.
さらに、同期式論理回路の一例として、レジスタと全加算器（full adder）を用いた直列加算器の構成についても取り扱う.
これにより、同期式論理回路がどのように機能するかを学ぶ.



= 原理

== フリップフロップ
論理値の0か1を安定状態として保持できる1ビットのメモリをフリップフロップという.
フリップフロップが保持している論理値をそのフリップフロップの状態という.


=== SRフリップフロップ
SR-FFは,入力SとRを持つ.
動作原理は以下の通りとなる.
- S（Set）入力が1で、R（Reset）入力が0の場合、フリップフロップはセット状態になり、出力Qは1に、#overline[Q]は0になる.
- S入力が0で、R入力が1の場合、フリップフロップはリセット状態になり、出力Qは0に、#overline[Q]は1になる.
- SとRの両方が0の場合、出力は変化せず、前の状態が保持される.
- SとRの両方が1の場合は、通常、禁止されている操作であり、フリップフロップの動作は未定義（または特定の設計に依存）になる.


=== JKフリップフロップ
JKフリップフロップは、2つの入力（JとK）と2つの出力（Qと#overline[Q]）を持つ.
動作原理は以下の通りとなる.
- J=1、K=0のとき、フリップフロップはセット状態になり、Q=1、#overline[Q]=0となる.
- J=0、K=1のとき、フリップフロップはリセット状態になり、Q=0、#overline[Q]=1となる.
- J=0、K=0のとき、フリップフロップの出力は変化せず、前の状態を保持する.
- J=1、K=1のとき、フリップフロップはトグル状態になり、前の状態の反転（Qが1なら0に、0なら1に）を行う.


=== Tフリップフロップ
入力信号（T）とクロック信号に基づいて状態を変更する.
Tフリップフロップの動作原理は以下の通りである.

- T=1のとき、クロックパルスが入力されるたびに出力が反転する. つまり、現在の出力が0の場合は1に、1の場合は0に変わる.
- T=0のとき、クロックパルスが入力されても出力は変わらず、現在の状態を維持する.


=== Dフリップフロップ
入力データ（D）をクロック信号（CLK）に基づいて出力に保持する.
Dフリップフロップの動作原理は以下の通りである.

- クロック信号の立上がりでD=1ならば、出力Qは1になる.
- クロック信号の立上がりでD=0ならば、出力Qは0になる.

このように、Dフリップフロップはクロックエッジに同期してデータをキャプチャし、その後のクロックエッジまでそのデータを保持する.


== レジスタ
n個のFFを用いると、nビットのデータを記憶できる.これをレジスタという.シフトレジ
スタとは、外部からのクロックパルスに同期して、各FFの内容を隣りのFFへ順次転送する機能を持ったレジスタである.

== 直列加算器
通常一番下位の桁から一桁ずつ順に加算を行い,その桁での和と桁上
げを計算する.次の桁では,その桁上がりを使って再び和と桁上げを計算することを繰り返す.
この手順をハードウェアとして実現したものが直列加算器である.
直列加算器とは,二つのnビット2進数を下位の桁から1サイクルに一桁ずつ加えていく方法の加算器である.
これは加算する2数を格納するシフトレジスタX, Y,加算結果を格納する
シフトレジスタS,全加算器,D-FF で構成できる.XとYの下位の方から一桁ずつD-FF
に保存された値を全加算器へ入力し,桁上げを再び D-FF へ保存する.

#figure(
	image("serial-add.png", width: 30%),
	caption: [
		直列加算器の構成
	],
)




= 実験方法
ロジックトレーナを用いてそれぞれのフリップフロップの回路を設計し、
回路の挙動をタイミングチャートによって確認した.




= 実験結果

== フリップフロップの動作確認

*1(a)* \ @SR-FF の回路をNANDゲートとNOTゲートを用いて構成した.
この回路で観測したタイミングチャートは @1a-timing のようになる.
作成した回路が実験装置に予め備え付けられているSR-FFと同じ動作となることが確認できた.


#figure(
	image("SR-FF.png", width: 30%),
	caption: [
	    SR-FF
	],
) <SR-FF>

#figure(
	image("1a-wave.svg", width: 100%),
	caption: [
		SR-FFのタイミングチャート
	],
) <1a-timing>


*1(b)* \ @ck-SR-FF のクロック付きSR-FFをNANDゲートを用いて構成した.
この回路で観測したタイミングチャートは @1b-timing のようになる.
作成した回路が実験装置に予め備え付けられているSR-FFと同じ動作となることが確認できた.


#figure(
	image("ck-SR-FF.png", width: 30%),
	caption: [
	    クロック付きSR-FF
	],
) <ck-SR-FF>


#figure(
	image("1b-wave.svg", width: 100%),
	caption: [
	    クロック付きSR-FFのタイミングチャート
	],
) <1b-timing>



*1(c)* \ @master-SR-FF のマスタースレーブ式SR-FFを作成した.
この回路で観測したタイミングチャートは @1c-timing のようになる.


#figure(
	image("master-SR-FF.png", width: 30%),
	caption: [
	    マスタースレーブ式SR-FF
	],
) <master-SR-FF>


#figure(
	image("1c-wave.svg", width: 100%),
	caption: [
	    マスタースレーブ式SR-FFのタイミングチャート
	],
) <1c-timing>


*2(a)* \ @JK-FF のマスタースレーブ式JK-FFをロジックトレーナ上のクロック付きSR-FFを使って作成した.
この回路で観測したタイミングチャートは @2a-timing のようになる.

#figure(
	image("JK-FF.png", width: 30%),
	caption: [
	    マスタースレーブ式SR-FF
	],
) <JK-FF>


#figure(
	image("2a-wave.svg", width: 100%),
	caption: [
	    マスタースレーブ式JK-FFのタイミングチャート
	],
) <2a-timing>


*2(b)* \ マスタースレーブ式JK-FFで$T = J = K$ とすることにより、T-FFを作成した.
この回路で観測したタイミングチャートは @2b-timing のようになる.


#figure(
	image("2b-wave.svg", width: 100%),
	caption: [
	    T-FFのタイミングチャート
	],
) <2b-timing>


*3(a)* \ @D-FF のようにクロック付きSR-FFで$D = S = #overline[R]$とすることで、レベルセンス式D-FFを作成した.
この回路で作成したタイミングチャートは @3a-timing のようになる.


#figure(
	image("D-FF.png", width: 30%),
	caption: [
	    レベルセンス式D-FF
	],
) <D-FF>


#figure(
	image("3a-wave.svg", width: 50%),
	caption: [
	    レベルセンス式D-FFのタイミングチャート
	],
) <3a-timing>


*3(b)* \ @master-D-FF のようにマスタースレーブ式D-FFを作成した.
この回路で観測したタイミングチャートは @3b-timing のようになる.
これが、ロジックトレーナ上のマスタースレーブ式JK-FFで$D = J = #overline[K]$としたものと同じ動作であることを確認した.


#figure(
	image("master-D-FF.png", width: 30%),
	caption: [
	    マスタースレーブ式D-FF
	],
) <master-D-FF>


#figure(
	image("3b-wave.svg", width: 50%),
	caption: [
	    マスタースレーブ式D-FFのタイミングチャート
	],
) <3b-timing>


== レジスタ

*1.* \ @SR-register のようにレベルセンス式SR-FFを使って、4ビットシフトレジスタを構成し、その動作を確認した.


#figure(
	image("SR-register.png", width: 50%),
	caption: [
	    レベルセンス式SR-FFを用いた4ビットシフトレジスタ
	],
) <SR-register>




#figure(
    table(
        columns: 3,
        align: center,
	    [*Input*], [$Q_0 Q_1 Q_2 Q_3$], [$Q_0^+ Q_1^+ Q_2^+ Q_3^+$],
	    [1], [0000], [1000],
	    [0], [1000], [0100],
	    [0], [0100], [0010],
	    [1], [0010], [1001],
	    [1], [1001], [1100],

	),
	caption: [
        レベルセンス式SR-FFを用いた4ビットシフトレジスタの状態遷移図
	],
)



*2.* \ @JK-register のようにロジックトレーナ上のマスタースレーブ式JK-FFを使って、4ビットシフトレジスタを構成し、その動作を確認した.
レベルセンス式SR-FFと同様の結果となることがわかった.

#figure(
	image("JK-register.png", width: 50%),
	caption: [
	    マスタースレーブ式JK-FFを用いた4ビットシフトレジスタ
	],
) <JK-register>

#figure(
    table(
        columns: 3,
        align: center,
	    [*Input*], [$Q_0 Q_1 Q_2 Q_3$], [$Q_0^+ Q_1^+ Q_2^+ Q_3^+$],
	    [1], [0000], [1000],
	    [0], [1000], [0100],
	    [0], [0100], [0010],
	    [1], [0010], [1001],
	    [1], [1001], [1100],

	),
	caption: [
        マスタースレーブ式JK-FFを用いた4ビットシフトレジスタの状態遷移図
	],
)


== 直列加算器

@adder のように4ビットの直列加算器を構成し、その動作を確認した.


#figure(
	image("adder.png", width: 50%),
	caption: [
	    直列加算器の構成
	],
) <adder>


#figure(
    table(
        columns: 3,
        align: center,
	    [$X Y$], [$Q_0 Q_1 Q_2 Q_3 Q_4 Q_5$], [$Q_0^+ Q_1^+ Q_2^+ Q_3^+ Q_4^+ Q_5^+$],
	    [10], [000000], [100000],
	    [11], [100000], [111000],
	    [01], [111000], [010100],
	    [00], [010100], [000010],
	    [00], [000010], [001001],
	),
	caption: [
	    直列加算器における $0011 + 0110$ の計算の状態遷移図
	],
)

#figure(
    table(
        columns: 3,
        align: center,
	    [$X Y$], [$Q_0 Q_1 Q_2 Q_3 Q_4 Q_5$], [$Q_0^+ Q_1^+ Q_2^+ Q_3^+ Q_4^+ Q_5^+$],
	    [10], [000000], [100000],
	    [10], [100000], [101000],
	    [11], [101000], [111100],
	    [00], [111100], [000110],
	    [00], [000110], [001011],
	),
	caption: [
	    直列加算器における $0111 + 0100$ の計算の状態遷移図
	],
)



#figure(
    table(
        columns: 3,
        align: center,
	    [$X Y$], [$Q_0 Q_1 Q_2 Q_3 Q_4 Q_5$], [$Q_0^+ Q_1^+ Q_2^+ Q_3^+ Q_4^+ Q_5^+$],
	    [01], [000000], [010000],
	    [10], [010000], [101000],
	    [11], [101000], [111100],
	    [00], [111110], [000110],
	    [00], [000110], [001011],
	),
	caption: [
	    直列加算器における $0110 + 0101$ の計算の状態遷移図
	],
)


= 検討課題

1. マスタースレーブ式のフリップフロップの動作について詳しく解説せよ.
マスタースレーブ式フリップフロップの動作について見ていく. 入力側のFFをマスターFF、出力側のFFをスレーブFFと呼ぶ.
CK = 1 となるとマスターFFが動作する. このとき、スレーブFFはクロックは0となっているので出力を保持している.
CK = 0 となるとスレーブFFが動作する. このスレーブFFの出力が、全体としての出力となる.
また、このとき、マスターFFのクロックは0となっているので、マスターFFは、出力を保持する.
このように CK = 0 となるようなタイミング、すなわちクロックの立ちさがりで出力が切り替わることで、
CK = 1 である時間内に複数回の状態遷移を防止することができる.


\


2. @unstable の回路で Input = 1 かつ CK = 1 であるとき、出力Qが不安定になる(振動する)理由を説明せよ. このフリップフロップをマスタースレーブ式SR-FFに変更すると、クロック1個につき出力が高々1回しか変化しなくなり不安定な動作が解消される.その理由を説明せよ.


この回路において CK = Input = Q = 0 から、Input = 1 とし、CK = 1 となる場合について見ていく. この場合に状態が不安定となる.
Input = 1 とすると、この時点では Q = 0 であるから排他的論理和をとると1となる.よって、入力Sに1、入力Rに0が入る. 
この状態で CK = 1 とすると、Q = 1 となる. ここで、Input = 1 であるから、排他的論理和は 0 となる.
よって、入力Sに0、入力Rに1が入る. この状態で CK = 1 であるから、Q = 0 となる.
これらの処理が繰り返されることで状態が不安定となる.


#figure(
	image("unstable_SR-FF.png", width: 50%),
	caption: [
	    状態が不安定になる順序回路
	],
) <unstable>


検討課題の1で検討したようにマスタースレーブ式フリップフロップでは、CK = 1 である時間内に複数回の状態遷移を防止することができる.
これによって、クロック1個につき、出力が高々1回しか変化せず、不安定な動作が改善される.


\


3. エッジトリガ式フリップフロップについて調べよ.
エッジトリガ式フリップフロップはクロックパルスに同期して動作するフリップフロップのことである.
クロックパルスの立上がりに同期して状態が変化するフリップフロップをポジティブエッジ型、
クロックパルスの立下がりに同期して状態が変化するフリップフロップをネガティブエッジ型と呼ぶ.
エッジトリガは、次の立上がり(立下がり)エッジまでは出力は切り替わらず保持される.
エッジトリガ式フリップフロップは、特定のクロック信号の立ち上がりや立ち下がりエッジでのみ動作するため、同期動作が可能である.
これにより、信号の安定性と整合性が向上し、信号のタイミングを制御しやすくなる.


= 考察
本実験を通して、フリップフロップやレジスタ、直列加算器などの順序回路の基本的な動作原理について調べた.これらの回路は、コンピュータのCPUやメモリなどの基本的な部品として不可欠な役割を果たしている.
特に、フリップフロップは1ビットのデータを一時的に保持する重要な機能を持っている.
マスタースレーブ方式のフリップフロップでは、クロックのタイミングを厳密に制御することで、安定した動作を実現している.
エッジトリガ式フリップフロップではクロックエッジでのみ動作するため、ノイズに強く信頼性の高い回路を構成できる.
また、レジスタは複数のフリップフロップを組み合わせてデータを保持する機能を持ち、CPUのレジスタファイルやメモリなどに広く用いられていて、シフトレジスタは、データを順次シフトさせる機能がある.
さらに、今回構成した直列加算器は、筆算で行うような2進数の加算をハードウェア的に実現したもので、加算結果をシフトレジスタへ格納した.直列加算器は通常の加算器に比べてわずかなハードウェア資源で実装できる.




= 参考文献
[1]情報科学実験Iテキスト2024年 \
[2]中部大学, 5. フリップフロップ, https://edu.isc.chubu.ac.jp/naga/dec/dec5.html \
