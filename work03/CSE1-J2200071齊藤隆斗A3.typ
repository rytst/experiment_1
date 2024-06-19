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
	3.カウンタの設計*
])

#align(center + horizon, text[
	実験グループ: A班 \
	報告者: J2200071 齊藤 隆斗 \
	共同実験者: J2200038 小淵 萌, #h(0.3cm) J2200104 知久拓生, #h(0.3cm) J2200158 矢島 琴恵 \

	実験実施日: 2024年6月20日 \
	レポート提出日: 2024年6月 日 \
	提出期限: 2024年6月27日
])

#pagebreak()

#show figure.where(
    kind: table
): set figure.caption(position: top)

#set heading(numbering: "1.")

= 実験の目的
基本的な同期式順序回路であるカウンタを実際に構成し,その原理を理解する.


= 原理


== カウンタ



= 実験方法
ロジックトレーナを用いてそれぞれのフリップフロップの回路を設計し、
回路の挙動をタイミングチャートによって確認した.




= 実験結果



= 検討課題

= 考察


= 参考文献
[1]情報科学実験Iテキスト2024年 \
