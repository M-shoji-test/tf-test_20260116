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

---

# terraform

## terraform 初期化
~~~bash
$ export AWS_PROFILE=nanomedia-ss
$ export AWS_REGION=<aws-region>
# 例： aws-region= eu-north-1 (ストックホルムリージョン）

$ terraform init
~~~

## テスト
~~~bash
$ terraform plan
~~~

## 実行
~~~bash
$ terraform apply
~~~

## 削除
~~~bash
$ terraform destroy
~~~

## コンソールで作成した環境をterraform 化させる
### 手順
~~~text
リソースを作成する
↓
terraform import
↓
plan で差分確認
↓
差分を参考にリソースを変更
↓
plan で差分確認（ないことを確認）
~~~
~~~bash
$ sudo vi ~~.tf

$ terraform import <resource-address> <real-world-id>

$ terraform plan
~~~

### resource-addressの構造
~~~text
<type>.<name>

---

例：
aws_vpc.main
aws_subnet.public_a
aws_instance.al2023
~~~

## +α direnv 導入
現在のユーザに direnv install
~~~bash
$ curl -sfL https://direnv.net/install.sh | bash
~~~
↓
ログイン時 direnv 初期化設定
~~~bash
$ echo '  eval "$(direnv hook bash)"' >> ~/.bashrc
~~~
↓
反映
~~~bash
$ . ~/.bashrc
~~~
↓
git repository で使用する aws credential を指定できるようにする。
~~~bash$ pwd
/home/<name>/sre/tf-test_20260116
$ sudo vi .envrc
export AWS_PROFILE=nanomedia-ss
~~~
保存すると以下の警告が出ます。
~~~text
direnv: error /home/nano-tk/github/tf-test_20260116/.envrc is blocked. Run `direnv allow` to approve its content
~~~
↓
対象ディレクトリの direnv 許可
~~~bash
$ direnv allow

direnv: loading ~/github/tf-test_20260116/.envrc
direnv: export +AWS_PROFILE
~~~
↓
環境変数の反映確認
~~~bash
$ echo $AWS_PROFILE
nanomedia-ss
~~~

（更新：20260212)
---

