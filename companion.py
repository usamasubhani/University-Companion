from tkinter import *
from pyswip import Prolog
import re # for regex magic

prolog = Prolog()
prolog.consult('kb.pl')
prolog.consult('responses.pl')

def getBuilding( s ):
    for i in ['xc', 'nc', 'oc', 'reception', 'gym', 'audi', 'xc_cafe']:
        if i in s:
            return i
    else:
        return None

def getRoom( s ):
    room = re.search(r'.c\d+', s)
    lab = re.search(r'.clab\d+', s)
    if room:
        return room.group()
    elif lab:
        return lab.group()
    else:
        return None

def getResponse( sentence ):
    if "hello" in sentence:
        return dict( list( prolog.query("random_response(hello, R).") )[0] )['R']
    elif "bye" in sentence:
        return dict( list( prolog.query("random_response(bye, R).") )[0] )['R']

    elif ('status' in sentence) or ('free' in sentence): # Room status
        room = getRoom( sentence)
        # TODO: use room to query kb
        for i in prolog.query("room(R,B,F,S)."): # (room, building, floor, status)
            if i['R'] == room:
                if i['S'] == 0:
                    return str(i['R']) + " is free. :)  "
                else:
                    return  str(i['R']) + " is not free. :(  "

    elif getRoom( sentence ): # Room location
        room = getRoom( sentence)
        # TODO: use room to query kb
        for i in prolog.query("room(R,B,F,S)."): # (room, building, floor, status)
            if i['R'] == room:
                return str(i['R']) + " is on floor " + str(i['F']) + " of " + str(i['B'])
    elif getBuilding( sentence ): # building location
        building = getBuilding( sentence )
        for i in prolog.query("build_loc(F, T, D)."): # (from, to, direction)
            if i['T'] == building:
                return str(i['T']) + " is at the " + str(i['D']) + " of " + str(i['F'])
    else:
        return "What? \n Random fact: " + dict( list( prolog.query("random_fact(R).") )[0] )['R']




# ------ VIEW ------ #

window = Tk()
messages = Text(window, bg="black", fg="white", font=("Courier", 16))
messages.pack()

input_user = StringVar()
input_field = Entry( window, text=input_user, font=("Courier", 16 ) )
input_field.pack(side=BOTTOM, fill=X)
input_field.focus_set()

def showResponse( response ):
    messages.insert(INSERT, 'Companion: %s\n' % response )

def Enter_pressed(event):
    response = ''
    input_get = input_field.get()
    messages.insert(INSERT, 'You: %s\n' % input_get)
    input_user.set('')
    response = getResponse(input_get)
    showResponse(response)
    return "break"

frame = Frame(window)  # , width=300, height=300)
input_field.bind("<Return>", Enter_pressed)
frame.pack()

window.mainloop()


# --------------------

