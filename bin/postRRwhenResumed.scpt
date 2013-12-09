set |center| to my NSWorkspace's sharedWorkspace()'s notificationCenter()
|center|'s addObserver_selector_name_object_(me, "NSWorkspaceWillSleep:", "NSWorkspaceWillSleepNotification", missing value)
|center|'s addObserver_selector_name_object_(me, "NSWorkspaceDidWake:", "NSWorkspaceDidWakeNotification", missing value)

on message(title, subtitle, msg)
set notification to my NSUserNotification's alloc()'s init()
set notification's title to title
set notification's subtitle to subtitle
set notification's |informativeText| to msg
my NSUserNotificationCenter's defaultUserNotificationCenter()'s deliverNotification_(notification)
end message

on notify_(notification)
message("", "", notification's |name|)
end notify_


on NSWorkspaceWillSleep_(notification)
message("sleep", "", "")
end NSWorkspaceWillSleep_

on NSWorkspaceDidWake_(notification)
message("resume", "", "")
do shell script "url -d 'token=Z2B9HD1PYU7G2H_adcd77fd-e576-4672-9151-a0a5a7ce61ed' -d 'group_id=1E7OE60R9QALD' -d 'text=fromCUI' -d 'ext=json' http://ringreef.com/api/2/message/new"
end NSWorkspaceDidWake_