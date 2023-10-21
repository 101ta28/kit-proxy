# KIT-PROXY

## 説明

金沢工業大学の学内ネットワークでLinuxを使うためのプロキシ設定スクリプトです。

ネットワークプロキシ・Git・npm・yarn・pipのプロキシの設定が可能です。

## インストール

```bash
# 学外からはこちら
$ sudo bash -c "$(curl -L 'https://raw.githubusercontent.com/101ta28/kit-proxy/main/install.sh')"

# 学内(プロキシ環境内)ではこちら
$ http_proxy="http://wwwproxy.kanazawa-it.ac.jp:8080/" https_proxy="http://wwwproxy.kanazawa-it.ac.jp:8080/" sudo -E bash -c "$(curl -L 'https://raw.githubusercontent.com/101ta28/kit-proxy/main/install.sh')" && unset http_proxy https_proxy
```

## 使い方

```bash
# プロキシを有効にする
$ kit-proxy on

# プロキシを無効にする
$ kit-proxy off

# プロキシの設定を確認する
$ kit-proxy status

# スクリプトのヘルプを見る
$ kit-proxy help
```

## アンインストール

このスクリプトは`/usr/local/bin/kit-proxy`に保存されています。
下記のコマンドでアンインストール(削除)できます。

```bash
$ sudo rm /usr/local/bin/kit-proxy
```
