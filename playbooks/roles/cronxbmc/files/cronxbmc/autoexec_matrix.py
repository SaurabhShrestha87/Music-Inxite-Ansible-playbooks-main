import xbmc
from time import sleep
from datetime import date, time, datetime, timedelta

SCHEDULES = [
        {
            'time'      : datetime.combine(date.today(), time(5)),
            'duration'  : timedelta(hours=12),
            'command'   : 'PlayMedia(/storage/music/1-Daytime/, isdir)'
        },
        {
            'time'      : datetime.combine(date.today(), time(17)),
            'duration'  : timedelta(hours=12),
            'command'   : 'PlayMedia(/storage/music/2-Night, isdir)'
        }
        ]

with open('/storage/.kodi/temp/autoexec.log', 'a') as f:
    for schedule in SCHEDULES:
        timestamp = datetime.now()
        if  'command' in schedule \
            and schedule['command'] != None \      
            and 'weekday' not in schedule \
            or schedule['weekday'] == None \  
            or len(schedule['weekday']) == 0 \
            or timestamp.weekday() in schedule['weekday'] \
            and timestamp >= schedule['time'] \
            and timestamp < schedule['time'] + schedule['duration']:
                    xbmc.executebuiltin(schedule['command'])
                                                                                              
xbmc.executebuiltin('SetVolume(100)')
xbmc.executebuiltin('PlayerControl(RandomOn)')
xbmc.executebuiltin('PlayerControl(RepeatAll)')
                                               
