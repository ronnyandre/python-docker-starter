import os
from datetime import date, datetime
import pytz

def main():
    # log timestamp
    utcnow = pytz.utc.localize(datetime.utcnow())
    localizednow = utcnow.astimezone(pytz.timezone(os.getenv('TIMEZONE', 'UTC')))
    timestamp = localizednow.strftime("%d-%b-%Y (%H:%M:%S)")
    
    print(f"Current timestamp: {timestamp}")
        
if __name__ == '__main__':
    main()