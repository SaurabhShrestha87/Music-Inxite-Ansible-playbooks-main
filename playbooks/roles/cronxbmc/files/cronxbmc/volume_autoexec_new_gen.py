import xbmc
from time import sleep
from datetime import date, time, datetime, timedelta

SCHEDULES = [                                            
        {                                                              
            'time'      : datetime.combine(date.today(), time(5)),     
            'duration'  : timedelta(hours=11),            
            'command'   : 'PlayMedia(/storage/music/1-Daytime, isdir)',
            'volume'    : '100'
        },                                                
        {                                                            
            'time'      : datetime.combine(date.today(), time(16)),
            'duration'  : timedelta(hours=2, minutes=45),
            'command'   : 'PlayMedia(/storage/music/3-Sunset, isdir)',
            'volume'    : '100'
        },                                                
        {                                                          
            'time'      : datetime.combine(date.today(), time(18, 45)),
            'duration'  : timedelta(hours=10, minutes=15),
            'command'   : 'PlayMedia(/storage/music/4-Main, isdir)',
            'volume'    : '100'
        }                                   
        ]  

for schedule in SCHEDULES:
    timestamp = datetime.now()

    if timestamp >= schedule['time'] \
        and timestamp < schedule['time'] + schedule['duration'] \
        and schedule['command'] is not None:
            xbmc.executebuiltin(schedule['command']) #not workin 20 kodi
            xbmc.executebuiltin('SetVolume(' + schedule['volume'] + ')') #not workin 20 kodi

xbmc.executebuiltin('PlayerControl(RandomOn)')
xbmc.executebuiltin('PlayerControl(RepeatAll)')