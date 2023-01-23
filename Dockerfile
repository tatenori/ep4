# ベース・イメージ を設定
FROM python:3.5.2-alpine

# ファイルをローカルからコンテナ内の指定のパスにコピー
COPY . /app
                     
# ワークディレクトリを設定
WORKDIR /app

# コマンド実行
RUN pip install flask

# コンテナが接続用にリッスンするポートを指定
EXPOSE 5000

# ENTRYPOINT とCMD の両方が書いてあると、CMDに書かれている内容がENTRYPOINTに書いてあるcommandのオプションとして実行
ENTRYPOINT [ "python3" ]

# イメージに含まれるソフトウェアの実行
CMD [ "app.py" ]