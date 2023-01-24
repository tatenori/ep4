# ベース・イメージ を設定
FROM icr.io/codeengine/python:latest

# ファイルをローカルからコンテナ内の指定のパスにコピー
COPY app.py .

# コマンド実行
RUN /usr/local/bin/python -m pip install dotenv
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN /usr/local/bin/python -m pip install flask
RUN /usr/local/bin/python -m pip install pymongo
# コンテナが接続用にリッスンするポートを指定
#EXPOSE 5000

# ENTRYPOINT とCMD の両方が書いてあると、CMDに書かれている内容がENTRYPOINTに書いてあるcommandのオプションとして実行
ENTRYPOINT [ "python3" ]

# イメージに含まれるソフトウェアの実行
CMD [ "app.py" ]