import sys    
from tkinter import *
import time
import tkinter.messagebox
import os

descanso = 1#tempo em minutos

def tick():
    global time1
    
    time2 = time.strftime('%H:%M:%S')
   
    if time2 != time1:
        time1 = time2
           
        clock.config(text=time2)
       
    clock.after(200, tick)



root = Tk()
time1 = ''

clock = Label(root, font=('times', 20, 'bold'), bg="#fff")
clock.grid(row=0, column=1) 

tick()

root.mainloop()