# Simple To-Do List App
# by TokyoEdtech
# Python 3.8 using Geany Editor
# Ubuntu Linux (Mac and Windows Compatible)
# Topics: tkinter, grid geometry manager
# Topics: Listbox Widget, Scrollbar widget, tkinter.messagebox, Try/Except Block, pickle

import tkinter
import tkinter.messagebox
import pickle


root = tkinter.Tk()
root.title("Sensei ;)")


def add_task():
    task = entry_task.get()
    if task != "":
        listbox_tasks.insert(tkinter.END, task)
        entry_task.delete(0, tkinter.END)
        tkinter.messagebox.showinfo('Aviso','Tarefa carregada com sucesso')
  

    else:
        tkinter.messagebox.showwarning(
            title="Aviso!", message="Adicionar uma tarefa")

def delete_task():
    try:
        task_index = listbox_tasks.curselection()[0]
        listbox_tasks.delete(task_index)
    except:
        tkinter.messagebox.showwarning(
            title="Aviso!", message="Selecionar uma tarefa")

def load_tasks():
    try:
        tasks = pickle.load(open("tasks.dat", "rb"))
        listbox_tasks.delete(0, tkinter.END)
        for task in tasks:
            listbox_tasks.insert(tkinter.END, task)
    except:
        tkinter.messagebox.showwarning(
            title="Warning!", message="Tarefa não encontrada")

def save_tasks():
    tasks = listbox_tasks.get(0, listbox_tasks.size())
    pickle.dump(tasks, open("tasks.txt", "wb"))



# Create GUI
frame_tasks = tkinter.Frame(root)
frame_tasks.pack()

listbox_tasks = tkinter.Listbox(frame_tasks, height=10, width=50)
listbox_tasks.pack(side=tkinter.LEFT)

scrollbar_tasks = tkinter.Scrollbar(frame_tasks)
scrollbar_tasks.pack(side=tkinter.RIGHT, fill=tkinter.Y)

listbox_tasks.config(yscrollcommand=scrollbar_tasks.set)
scrollbar_tasks.config(command=listbox_tasks.yview)

entry_task = tkinter.Entry(root, width=50, justify = 'center')
entry_task.focus_force()
entry_task.pack()

button_add_task = tkinter.Button(root, text="Adicionar Tarefa", bg = "green",fg = "#fff", width=48, command=add_task)
button_add_task.pack()


button_delete_task = tkinter.Button(
    root, text="Apagar Tarefa",  bg = "red",fg = "#fff",width=48, command=delete_task)
button_delete_task.pack()

button_load_tasks = tkinter.Button(
    root, text="Carregar Tarefa", width=48, command=load_tasks)
button_load_tasks.pack()

button_save_tasks = tkinter.Button(
    root, text="Guardar tarefa", width=48, command=save_tasks)
button_save_tasks.pack()

root.mainloop()
