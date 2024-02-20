import requests
import json
from Utils.exceptions import ServicesErrorExceptions

class RestClient:
    def __init__(self):
        pass
    
    @staticmethod
    def call_get(url):
        try:
            response = requests.get(url)
            return response
        except Exception:
            raise ServicesErrorExceptions
            
        

