import serial
import crc16

port = 'COM3'
baudrate = 115200
ser = serial.Serial(port, baudrate)

# テストケースを読み込む

# テストケースからコマンドを生成する
# 読み込みか書き込みか
# 対象のアドレスは何番か
# データのサイズを計算する
# CRCを計算する

# コマンドを送信する

# 応答を受信する

# 受信した内容を確認する
