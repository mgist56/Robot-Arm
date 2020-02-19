import time
import board
import busio
import pulseio
from adafruit_motor import servo

pwm1 = pulseio.PWMOut(board.A2, duty_cycle=10, frequency=50)
servo1 = servo.Servo(pwm1)

pwm2 = pulseio.PWMOut(board.A3, duty_cycle=10, frequency=50)
servo2 = servo.Servo(pwm2)

uart = busio.UART(board.TX, board.RX, baudrate=9600)

while True:
    data = uart.read(8)
    # Allows uart to read 8 bytes at a time
    if data is not None:
        data = data.decode("utf-8")
        # Decodes the data
        dataArray = data.split(",")
        # Splits the data into two lines
        servo1.angle = int(dataArray[0])
        print(servo1.angle)
        servo2.angle = int(dataArray[1])
        print(servo2.angle)
        # Values are already in 0 - 180 degrees
        time.sleep(0.02)
        # time.sleep should be fast