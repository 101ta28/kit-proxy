# KIT-PROXY

## 説明

金沢工業大学の学内ネットワークでLinuxを使うためのプロキシ設定スクリプトです。

## インストール

```bash
$ curl -L "https://raw.githubusercontent.com/101ta28/kit-proxy/main/install.sh" | bash
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
