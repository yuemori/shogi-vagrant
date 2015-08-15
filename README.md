# shogi-vagrant
[ShogiServer](https://github.com/yuemori/ShogiServer) deploy to vagrant

## download
### ZIP

[ここ](https://github.com/yuemori/shogi-vagrant/archive/master.zip)からダウンロード

### Git

```
git clone https://github.com/yuemori/shogi-vagrant
```

- gitがわからなければ[この辺のスライド](http://www.find-job.net/startup/7-git-slides)を見てみましょう
- 使い方は[ドットインストール](http://dotinstall.com/lessons/basic_git)へ

## dependencies

以下のものをインストールしてください

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)

## Usage
### Setup

```
vagrant up
```

- インストールに時間がかかるので気長に待ちましょう（2〜30分程度はかかります）
- `Install Complete!`と出力されたらインストール完了です
- インストールが完了したら、`192.168.33.11:3000`へアクセスし、Railsのスタート画面が表示されるのを確認してみましょう

#### deploy from own repogitory

- 自分のリポジトリからソースコードを取得してデプロイしたい場合はplaybook下にあるshogi.ymlの`app_repogitory_url`を変更してください

### Login for Virtual Machine
#### Mac/Linux

```
vagrant ssh
```

#### Windows

```
vagrant ssh-config
```

- 表示された設定をもとに、SSHクライアントでログインしましょう
- 代表的なWindowsのSSHクライアント
  - [PuTTy](http://yebisuya.dip.jp/Software/PuTTY/)
  - [Teraterm](http://osdn.jp/projects/ttssh2/)
- UNIXコマンドがわからなければ[ドットインストール](http://dotinstall.com/lessons/basic_unix)へ

## description
### vagrant

- 仮想マシンを手軽に扱うためのコマンドラインツール
- 詳しくは[ドットインストール](http://dotinstall.com/lessons/basic_vagrant)へ

### provisioning

- サーバのセットアップを自動化すること
- インストールするものや設定などを自動化することで、同じ環境をいつでも立てれる
- 何が便利か
  - （今回みたいに）動作環境や開発環境を簡単に共有できる
  - サーバの数がいくつあっても同じ環境にセットアップできる（もしサーバが100台とかあったら...）
- 今回は[ansible](http://docs.ansible.com/ansible/index.html)という自動化ツールを使っている
  - 詳しくは[ドットインストール](http://dotinstall.com/lessons/basic_ansible)へ
- 自分でサーバを立てたくなったら、playbookディレクトリの中のファイルを読んだら何をしているかはわかるはず

## Last but the least...

**これからも良きエンジニアライフを！**
