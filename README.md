# ChatDevを実行するDocker

## OPENAI_API_KEY設定

```env:.env
OPENAI_API_KEY=your_openai_api_key
```

`your_openai_api_key` の箇所をOpenAI API Keyに変更する。

以下から発行できます。

https://platform.openai.com/account/api-keys

## docker-compose起動

```sh:コマンド
docker-compose up -d
```

## bash起動

```sh:コマンド
docker-compose exec chatdev-app bash
```

## ゲーム作成

```sh:コマンド
cd ChatDev
python3 run.py --task "作ってほしい作品" --name "タイトル"
```

## 
完成後、以下コマンド実行。

```sh:コマンド
cp -r ./WareHouse ../app/app-data
```


