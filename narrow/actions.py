import os
import sys

# Flask
from flask import Flask, redirect, url_for, request, render_template, Response, jsonify, redirect,flash,session
from torch import minimum
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from gevent.pywsgi import WSGIServer
import re
# Some utilites
import numpy as np

# Declare a flask app
app =Flask(__name__)
app.secret_key = 'many random bytes'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'fijrdb' 

# Intialize MySQL
mysql = MySQL(app)

#------NAVIGATION-----------


@app.route("/") #HOME
def home():
    return render_template("index.html")

@app.route("/index.html") 
def index():
    return render_template("index.html")



@app.route('/about.html', methods=['GET'])
def about():
    return render_template('about.html')

@app.route('/contact.html', methods=['GET'])
def contact():
    return render_template('contact.html')

@app.route('/admintahfiz.html', methods=['GET'])
def admintahfiz():
     # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tahfiz')
        # Fetch one record and return result
        fetchdata = cursor.fetchall()

        cursor.close( )
        return render_template('admintahfiz.html',data=fetchdata)    

@app.route('/insertdatatahfiz', methods = ['POST'])
def insertdatatahfiz():
    
    if request.method == "POST":

            name = request.form['name']
            address = request.form['address']
            email = request.form['email']
            phone = request.form['phone']
            rname= request.form['name']
            bank= request.form['bank']
            noacc = request.form['noacc']
            donate = request.form['donate']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO tahfiz (Tahfiz_Name,Tahfiz_Address,Tahfiz_Email,Tahfiz_Phone,Recipient_Name,Bank_Name,AccNo,TotalPayment) VALUES (%s, %s, %s,%s,%s,%s, %s,%s)", (name, address,email,phone,rname,bank,noacc,donate))
            mysql.connection.commit()    
            
            flash("Data Tahfiz Berjaya Dimasukkan")

            return redirect(url_for('admintahfiz'))

@app.route('/deletedatatahfiz/<string:id_data>', methods = ['POST','GET'])
def deletedatatahfiz(id_data):
    flash("Tahfiz Sudah Berjaya Dipadam")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM tahfiz WHERE Tahfiz_ID=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('admintahfiz'))

@app.route('/uptahfiz', methods = ['POST'])
def uptahfiz():
    
    if request.method == 'POST':
        iddata=request.form['iddata']
        name = request.form['name']
        address = request.form['address']
        email = request.form['email']
        phone = request.form['phone']
        rname= request.form['name']
        bank= request.form['bank']
        noacc = request.form['noacc']
        donate = request.form['donate']
        cur = mysql.connection.cursor()
        cur.execute(" UPDATE tahfiz set Tahfiz_Name=%s,Tahfiz_Address=%s,Tahfiz_Email=%s,Tahfiz_Phone=%s,Recipient_Name=%s,Bank_Name=%s,AccNo=%s,TotalPayment=%s WHERE Tahfiz_ID=%s ", (name, address,email,phone,rname,bank,noacc,donate,iddata))
            
        flash("Data Tahfiz Berjaya Diubah Suai")
        mysql.connection.commit()

        return redirect(url_for('admintahfiz'))


@app.route('/adminngo.html', methods=['GET'])
def adminngo():
    # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM ngo')
        # Fetch one record and return result
        fetchdata = cursor.fetchall()

        cursor.close( )
        return render_template('adminngo.html',data=fetchdata)

@app.route('/insertdatango', methods = ['POST'])
def insertdatango():
    
    if request.method == "POST":

            name = request.form['name']
            address = request.form['address']
            email = request.form['email']
            phone = request.form['phone']
            rname= request.form['name']
            bank= request.form['bank']
            noacc = request.form['noacc']
            donate = request.form['donate']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO ngo (Ngo_Name,Ngo_Address,Ngo_Email,Ngo_Phone,Recipient_Name,Bank_Name,AccNo,TotalPayment) VALUES (%s, %s, %s,%s,%s,%s, %s,%s)", (name, address,email,phone,rname,bank,noacc,donate))
            mysql.connection.commit()    
            
            flash("Data Organisasi Berjaya Dimasukkan")

            return redirect(url_for('adminngo'))

@app.route('/deletedatango/<string:id_data>', methods = ['POST','GET'])
def deletedatango(id_data):
    flash("Organisasi Sudah Berjaya Dipadam")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM ngo WHERE Ngo_ID=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('adminngo'))

@app.route('/upngo', methods = ['POST'])
def upngo():
    
    if request.method == 'POST':
        iddata=request.form['iddata']
        name = request.form['name']
        address = request.form['address']
        email = request.form['email']
        phone = request.form['phone']
        rname= request.form['name']
        bank= request.form['bank']
        noacc = request.form['noacc']
        donate = request.form['donate']
        cur = mysql.connection.cursor()
        cur.execute(" UPDATE ngo set Ngo_Name=%s,Ngo_Address=%s,Ngo_Email=%s,Ngo_Phone=%s,Recipient_Name=%s,Bank_Name=%s,AccNo=%s,TotalPayment=%s WHERE Ngo_ID=%s ", (name, address,email,phone,rname,bank,noacc,donate,iddata))
            
        flash("Data Organisasi Berjaya Diubah Suai")
        mysql.connection.commit()

        return redirect(url_for('adminngo'))

@app.route('/adminshelter.html', methods=['GET'])
def adminshelter():

   # Check if account exists using MySQL
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM shelter')
        # Fetch one record and return result
    fetchdata = cursor.fetchall()

    cursor.close( )   
    return render_template('adminshelter.html',data=fetchdata)


@app.route('/insertdatashelter', methods = ['POST'])
def insertdatashelter():
    
    if request.method == "POST":

            name = request.form['name']
            address = request.form['address']
            email = request.form['email']
            phone = request.form['phone']
            rname= request.form['name']
            bank= request.form['bank']
            noacc = request.form['noacc']
            donate = request.form['donate']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO shelter (Shelter_Name,Shelter_Address,Shelter_Email,Shelter_Phone,Recipient_Name,Bank_Name,AccNo,TotalPayment) VALUES (%s, %s, %s,%s,%s,%s, %s,%s)", (name, address,email,phone,rname,bank,noacc,donate))
            mysql.connection.commit()    
            
            flash("Data Rumah Perlidungan Berjaya Dimasukkan")

            return redirect(url_for('adminshelter'))

@app.route('/deletedatashelter/<string:id_data>', methods = ['POST','GET'])
def deletedatashelter(id_data):
    flash("Rumah Perlindungan Sudah Berjaya Dipadam")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM shelter WHERE Shelter_ID=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('adminshelter'))

@app.route('/upshelter', methods = ['POST'])
def upshelter():
    
    if request.method == 'POST':
        iddata=request.form['iddata']
        name = request.form['name']
        address = request.form['address']
        email = request.form['email']
        phone = request.form['phone']
        rname= request.form['name']
        bank= request.form['bank']
        noacc = request.form['noacc']
        donate = request.form['donate']
        cur = mysql.connection.cursor()
        cur.execute(" UPDATE shelter set Shelter_Name=%s,Shelter_Address=%s,Shelter_Email=%s,Shelter_Phone=%s,Recipient_Name=%s,Bank_Name=%s,AccNo=%s,TotalPayment=%s WHERE Shelter_ID=%s ", (name, address,email,phone,rname,bank,noacc,donate,iddata))
            
        flash("Data Rumah Perlindungan Berjaya Diubah Suai")
        mysql.connection.commit()

        return redirect(url_for('adminshelter'))


@app.route("/graphtahfiz.html") 
def graphtahfiz():

    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM tahfiz')
    # Fetch one record and return result
    fetchdata = cursor.fetchall()

    labels  = [row[1] for row in fetchdata]
    values = [row[8] for row in fetchdata]

    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM tahfiz ORDER BY TotalPayment LIMIT 3')
    
    account= cursor.fetchall()


    return render_template("graphtahfiz.html",labels=labels,values=values,data=account)

@app.route("/graphngo.html") 
def graphngo():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM ngo')
    # Fetch one record and return result
    fetchdata = cursor.fetchall()

    labels  = [row[1] for row in fetchdata]
    values = [row[8] for row in fetchdata]

    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM ngo ORDER BY TotalPayment LIMIT 3')
    
    account= cursor.fetchall()
    return render_template("graphngo.html",labels=labels,values=values,data=account)

@app.route("/graphshelter.html") 
def graphshelter():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM shelter')
    # Fetch one record and return result
    fetchdata = cursor.fetchall()

    labels  = [row[1] for row in fetchdata]
    values = [row[8] for row in fetchdata]

    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM shelter ORDER BY TotalPayment LIMIT 3')
    
    account= cursor.fetchall()

    return render_template("graphshelter.html",labels=labels,values=values,data=account)


@app.route('/tahfiz.html', methods=['GET'])
def tahfiz():


       # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tahfiz')
        # Fetch one record and return result
        fetchdata = cursor.fetchall()

        cursor.close( )
        return render_template('tahfiz.html',data=fetchdata)

@app.route('/shelter.html', methods=['GET'])
def shelter():
       # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM shelter')
        # Fetch one record and return result
        fetchdata = cursor.fetchall()

        cursor.close( )
        return render_template('shelter.html',data=fetchdata)

@app.route('/organization.html', methods=['GET'])
def organization():
       # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM ngo')
        # Fetch one record and return result
        fetchdata = cursor.fetchall()

        cursor.close( )
        return render_template('organization.html',data=fetchdata)


@app.route('/insert', methods = ['POST'])
def insert():
    
    if request.method == "POST":

            name = request.form['name']
            email = request.form['email']
            phone = request.form['phone']
            tid= request.form['IDtahfiz']
            payment = request.form['payment']
            payment=int(payment)
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO funder (Funder_Name, Funder_Email,Funder_Phone,Total,Tahfiz_ID) VALUES (%s, %s, %s,%s,%s)", (name, email, phone, payment,tid))
            mysql.connection.commit()

            query_string = "SELECT * FROM tahfiz WHERE Tahfiz_ID = %s"
            cur.execute(query_string, (tid,))
            account = cur.fetchall()        
            
            oldpayment=0

            for row in account:
                oldpayment=row[8]
        

            newpayment=oldpayment+payment
            newpayment=str(newpayment)
            
            cur.execute("UPDATE Tahfiz set TotalPayment = %s WHERE Tahfiz_ID = %s", (newpayment,tid,))
            mysql.connection.commit()
            
            
            
            flash("Derma Selesai")

            return redirect(url_for('tahfiz'))
 

@app.route('/insertshelter', methods = ['POST'])
def insertshelter():
    
    if request.method == "POST":

            name = request.form['name']
            email = request.form['email']
            phone = request.form['phone']
            sid= request.form['IDshelter']
            payment = request.form['payment']
            payment=int(payment)
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO funder (Funder_Name, Funder_Email,Funder_Phone,Total,Shelter_ID) VALUES (%s, %s, %s,%s,%s)", (name, email, phone, payment,sid))
            mysql.connection.commit()

            query_string = "SELECT * FROM shelter WHERE Shelter_ID = %s"
            cur.execute(query_string, (sid,))
            account = cur.fetchall()        
            
            oldpayment=0

            for row in account:
                oldpayment=row[8]
        

            newpayment=oldpayment+payment
            newpayment=str(newpayment)
            cur.execute("UPDATE shelter set TotalPayment = %s WHERE Shelter_ID = %s", (newpayment,sid,))
            mysql.connection.commit()
            
            
            
            flash("Derma Selesai")

            return redirect(url_for('shelter'))

@app.route('/insertorganization', methods = ['POST'])
def insertorganization():
    
    if request.method == "POST":

            name = request.form['name']
            email = request.form['email']
            phone = request.form['phone']
            oid= request.form['IDngo']
            payment = request.form['payment']
            payment=int(payment)
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO funder (Funder_Name, Funder_Email,Funder_Phone,Total,Ngo_ID) VALUES (%s, %s, %s,%s,%s)", (name, email, phone, payment,oid))
            mysql.connection.commit()

            query_string = "SELECT * FROM ngo WHERE Ngo_ID = %s"
            cur.execute(query_string, (oid,))
            account = cur.fetchall()        
            
            oldpayment=0

            for row in account:
                oldpayment=row[8]
        

            newpayment=oldpayment+payment
            newpayment=str(newpayment)
            cur.execute("UPDATE ngo set TotalPayment = %s WHERE Ngo_ID = %s", (newpayment,oid,))
            mysql.connection.commit()
            
            
            
            flash("Derma Selesai")

            return redirect(url_for('organization'))



#-----------ADMIN----------------------------


@app.route('/pythonlogin/', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()
        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
       
            # Redirect to home page
            return redirect(url_for('homeadmin'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return render_template('adminlogin.html', msg=msg)

# http://localhost:5000/python/logout - this will be the logout page
@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('username', None)
   # Redirect to login page
   return redirect(url_for('login'))

# http://localhost:5000/pythinlogin/register - this will be the registration page, we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST'])
def register():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
                # Check if account exists using MySQL
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
        account = cursor.fetchone()
        # If account exists show error and validation checks
        if account:
            msg = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        else:
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s)', (username, password, email,))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
    elif request.method == 'POST':
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'
    # Show registration form with message (if any)
    return render_template('adminregister.html', msg=msg)

# http://localhost:5000/pythinlogin/home - this will be the home page, only accessible for loggedin users
@app.route('/homeadmin')
def homeadmin():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        return render_template('adminmenu.html')
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

   
   
#----------END NAVIGATION--------------------

if __name__ == '__main__':
    # app.run(port=5002, threaded=False) 
    app.run(debug=True)
    # Serve the app with gevent
    #http_server = WSGIServer(('0.0.0.0', 5000), app)
    #http_server.serve_forever()