## git push の流れ

初回のみ
~~~bash
$ git init
~~~

~~~bash
## すべてのファイル
$ git add .

## 特定のファイル
$ git add <ファイル名>

$ git commit -m " コメント"

## 初回
$ git push -u origin <branches>

## 2回目以降
$ git push origin <branches>
~~~

### 解説
"-u"(--set-uptream) は、このローカルのbranches (main / dev) は、origin/branches を追従する。
そのため、"-u" オプションは初回のみ。

## branch 追加
~~~bash
$ git checkout -b <new-branches>
### 追加した上で、新しいブランチに変更する
~~~

## branch 一覧参照
~~~bash
$ git branch
~~~

## branch 変更
~~~bash
$ git switch <branch>
~~~


