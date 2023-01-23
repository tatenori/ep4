# ベース・イメージ を設定
FROM icr.io/codeengine/python:latest

# ファイルをローカルからコンテナ内の指定のパスにコピー
COPY app.py .

# コマンド実行
RUN /usr/local/bin/python3 -m pip3 install --upgrade pip3
RUN /usr/local/bin/python3 -m pip3 install flask

# コンテナが接続用にリッスンするポートを指定
EXPOSE 5000

# ENTRYPOINT とCMD の両方が書いてあると、CMDに書かれている内容がENTRYPOINTに書いてあるcommandのオプションとして実行
ENTRYPOINT [ "python3" ]

# イメージに含まれるソフトウェアの実行
CMD [ "app.py" ]