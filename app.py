from flask import Flask, request
app = Flask(__name__)                             

@app.route('/')                                   
def hello_world(): 
    # textで指定されたパラメータをJsonに整形して返す
    text = request.args.get('text', '')                  
    return { 'text' : text }           

# 外部に公開できるようにポート開放
if __name__ == '__main__':                        
    app.run(host="0.0.0.0", port=5000, debug=False)