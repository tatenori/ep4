from flask import Flask, request
from pymongo import MongoClient
import datetime

client = MongoClient("mongodb+srv://ep_hnsr:HCH1qT28znHLWt7X@cluster0.adkku1e.mongodb.net/?retryWrites=true&w=majority")
db = client.test1
col = db.test2
app = Flask(__name__)                             

@app.post('/')                                   
def hello_world(): 
    # textで指定されたパラメータをJsonに整形して返す
    #text = request.args.get('text', '') 
    print("request.form" )
    print(request.get_json() )
    col.insert_one({ 'text' : request.args })
    return request.args          

# 外部に公開できるようにポート開放
if __name__ == '__main__':                        
    app.run(host="0.0.0.0", port=5000, debug=False)