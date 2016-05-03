#!/usr/bin/python
# -*- coding: utf-8 -*-

# Este archivo solo genera la cookie logeandose
# Como precondicion br se encuentra en la pagina de login

import cookielib
import urllib2
import mechanize
import getpass

def login(br, USER, debug):
	PASSWD = getpass.getpass()
	br.select_form(nr=0)
	br.form['email'] = USER
	br.form['pass'] = PASSWD
	response = br.submit() #log in
	debug("step1.html")

	br.select_form(nr=0) #save this browser
	response = br.submit()
	debug("step2.html")
	br.select_form(nr=0) #not recognized location
	response = br.submit()
	debug("step3.html")
	br.select_form(nr=0) #save other browser
	response = br.submit()
	debug("step4.html")
	br.select_form(nr=0) #save other browser
	response = br.submit()
	debug("step5.html")
	if br.title() == "Welcome to Facebook" or br.title() == "Te damos la bienvenida a Facebook":
		return False
	return True