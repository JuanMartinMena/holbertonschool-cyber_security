import requests

url = "http://web0x01.hbtn/a1/hijack_session"

for _ in range(100):
    response = requests.get(url)
    cookies = response.cookies.get_dict()
    for value in cookies.values():
        print(value)
