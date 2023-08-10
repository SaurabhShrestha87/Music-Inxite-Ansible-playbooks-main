#autoexec for android
import xbmc
from time import sleep
from datetime import date, time, datetime, timedelta

SCHEDULES = [                                            
        {                                                              
            'time'      : datetime.combine(date.today(), time(5)),     
            'duration'  : timedelta(hours=11),            
            'command'   : '[{"jsonrpc":"2.0","method":"Playlist.Clear","params":[0],"id":11},{"jsonrpc":"2.0","method":"Playlist.Insert","params":[0,0,{"directory":"/storage/emulated/0/music/2-test/"}],"id":10},{"jsonrpc":"2.0","method":"Player.Open","params":{"item":{"position":0,"playlistid":0},"options":{}},"id":16011}]'
        },                                                
        {                                                            
            'time'      : datetime.combine(date.today(), time(16)),
            'duration'  : timedelta(hours=2, minutes=45),
            'command'   : '[{"jsonrpc":"2.0","method":"Playlist.Clear","params":[0],"id":11},{"jsonrpc":"2.0","method":"Playlist.Insert","params":[0,0,{"directory":"/storage/emulated/0/music/1-test/"}],"id":10},{"jsonrpc":"2.0","method":"Player.Open","params":{"item":{"position":0,"playlistid":0},"options":{}},"id":16011}]'  
        },                                                                                   
        ]  


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
                xbmc.executeJSONRPC(schedule['command'])
xbmc.executebuiltin('SetVolume(100)')
xbmc.executebuiltin('PlayerControl(RandomOn)')
xbmc.executebuiltin('PlayerControl(RepeatAll)')
