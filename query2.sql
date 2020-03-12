SELECT Workers.Uid, Workers.UUID, Workers.HostedMachineId, WorkerNames.SAMName, WorkerNames.DNSName, WorkerDiags.HostedMachineName, AccountNames.CN, ConnectionLog.BrokeringTime, ConnectionLog.BrokeringUserUid, ConnectionLog.EstablishmentTime, ConnectionLog.EndTime, ConnectionLog.ConnectionFailureReason, ConnectionLog.Disconnected 
FROM chb_Config.Workers Workers
JOIN chb_State.WorkerNames WorkerNames
ON WorkerNames.Uid = Workers.Uid
JOIN chb_State.WorkerDiags WorkerDiags
ON WorkerDiags.Uid = Workers.Uid
LEFT OUTER 
JOIN chb_Config.Desktops Desktops
ON Desktops.WorkerUid = Workers.Uid
LEFT OUTER 
JOIN chb_Config.DesktopGroups DesktopGroups
ON DesktopGroups.Uid = Desktops.DesktopGroupUid
JOIN chb_State.ConnectionLog ConnectionLog
ON ConnectionLog.WorkerUid = Workers.Uid
LEFT OUTER 
JOIN chb_Config.WorkerAccountAssignments WorkerAccountAssignments
ON WorkerAccountAssignments.WorkerUid = Workers.Uid
LEFT OUTER 
JOIN chb_Config.Accounts Accounts
ON Accounts.Uid = Workers.Uid
LEFT OUTER 
JOIN chb_State.AccountNames AccountNames
ON AccountNames.Uid = ConnectionLog.BrokeringUserUid
LEFT OUTER 
JOIN chb_State.WorkerRegistrations WorkerRegistrations
ON WorkerRegistrations.Uid = Workers.Uid
WHERE 1=1