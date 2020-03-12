SELECT Tags.Uid, Tags.Tag, Tags.Description, DesktopTags.DesktopUId, Desktops.PublishedName, Workers.UUID, WorkerNames.SAMName, WorkerNames.DNSName 
FROM chb_Config.Tags Tags
LEFT OUTER JOIN chb_Config.DesktopTags DesktopTags
ON Tags.Uid = DesktopTags.TagUid
LEFT OUTER JOIN chb_Config.Desktops Desktops
ON Desktops.Uid = DesktopTags.DesktopUid
LEFT OUTER JOIN chb_Config.Workers Workers
ON Workers.Uid = Desktops.WorkerUid
LEFT OUTER JOIN chb_State.WorkerNames WorkerNames
ON WorkerNames.Uid = Workers.Uid
LEFT OUTER JOIN chb_State.WorkerDiags WorkerDiags
ON WorkerDiags.Uid = Workers.Uid