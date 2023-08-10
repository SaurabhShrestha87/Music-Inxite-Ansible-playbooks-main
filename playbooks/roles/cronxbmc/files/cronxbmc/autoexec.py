import xbmc
from time import sleep
from datetime import date, time, datetime, timedelta

SCHEDULES = [                                            
        {                                                              
            'time'      : datetime.combine(date.today(), time(5)),     
            'duration'  : timedelta(hours=12),
            'command'   : 'PlayMedia(/storage/music/1-test/, isdir)'
        },                                                
        {                                                            
            'time'      : datetime.combine(date.today(), time(17)),
            'duration'  : timedelta(hours=12),
            'command'   : 'PlayMedia(/storage/music/2-test, isdir)'
        },
        ]

with open('/storage/.kodi/temp/autoexec.log', 'a') as f:
    for schedule in SCHEDULES:
        timestamp = datetime.now()
        if  'command' in schedule \
            and schedule['command'] is not None \
            and 'weekday' not in schedule \
            or schedule['weekday'] is None \
            or len(schedule['weekday']) is 0 \
            or timestamp.weekday() in schedule['weekday'] \
            and timestamp >= schedule['time'] \
            and timestamp < schedule['time'] + schedule['duration']:
                    xbmc.executebuiltin(schedule['command'])
                    print >> f, timestamp.strftime('[%Y-%m-%d %I:%M %p]'), schedule['command']

xbmc.executebuiltin('SetVolume(100)')
xbmc.executebuiltin('PlayerControl(RandomOn)')
xbmc.executebuiltin('PlayerControl(RepeatAll)')
