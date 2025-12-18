user_db = [
    "username" : "amit", "password" : "pass1",
    "username" : "amit", "password" : "pass1",
}]

username = "amit"
password = "pass1"

user_found = False 

for user in users_db:
    if user["username"] == username and user["password"] == password:
        user_found = True
if user_found:
    print("login successful")
else:
    print("Invalid Credentails")