import os
from flask import Flask, request
from pymongo import MongoClient
import datetime
from dotenv import load_dotenv
load_dotenv()

print(os.environ['DBNAME'])
URI = os.environ['DBNAME']
client = MongoClient(URI)
db = client.test1
col = db.test2
app = Flask(__name__)                             

@app.post('/')                                   
def hello_world(): 
    # textで指定されたパラメータをJsonに整形して返す
    #text = request.args.get('text', '') 
    print("request.form" )
    print(request.get_json() )
    col.insert_one({ 'text' : request.get_json() })
    return request.get_json()          

# 外部に公開できるようにポート開放
if __name__ == '__main__':                        
    app.run(host="0.0.0.0", port=5000, debug=False)