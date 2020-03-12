SELECT Workers.Uid, Workers.UUID, Workers.HostedMachineId, Workers.InMaintenanceMode, WorkerNames.SAMName, WorkerNames.DNSName, WorkerDiags.LastHostingUpdateTime, WorkerDiags.LastPowerStateUpdateTime, WorkerDiags.HostedMachineName, WorkerDiags.HostingServerName, WorkerDiags.LastDeregistrationReason, WorkerDiags.LastErrorTime, WorkerDiags.LastErrorReason, WorkerDiags.LastErrorMessage, WorkerDiags.LastConnectionLogUid, WorkerDiags.LastConnectionTime, WorkerDiags.LastConnectionUserUid, WorkerDiags.LastConnectionFailureReason, Desktops.Uid, Desktops.Usage, Desktops.PublishedName, Desktops.Description, DesktopGroups.Uid, DesktopGroups.Name, DesktopGroups.PublishedName, DesktopGroups.UUID, DesktopGroups.DesktopKind, DesktopGroups.InMaintenanceMode, WorkerRegistrations.RegistrationKey, WorkerRegistrations.ResolvedName, WorkerRegistrations.SPN, WorkerRegistrations.IPAddress, WorkerRegistrations.BaseOU, WorkerRegistrations.AgentVersion, WorkerRegistrations.FunctionalLevel, WorkerRegistrations.ConfigVersion, WorkerRegistrations.OSType, WorkerRegistrations.OSVersion, WorkerRegistrations.LastContactTime, WorkerRegistrations.RegistrationExpiryTime, WorkerRegistrations.RegistrationTime, AccountNames.Uid, AccountNames.SAMName, AccountNames.UPN, AccountNames.CN, AccountNames.NameUpdateDueTime, AccountNames.LastLogoutTime, Catalogs.Uid, Catalogs.DisplayName, ProvisioningScheme.ProvisioningSchemeUid, ProvisioningScheme.ProvisioningSchemeName, ProvisioningScheme.CpuCount, ProvisioningScheme.MemoryMB, ProvisioningScheme.DiskSize, Sessions.LogOnTime, Sessions.SessionStartTime, Sessions.Protocol 
FROM chb_Config.Workers Workers
JOIN chb_State.WorkerNames WorkerNames
ON WorkerNames.Uid = Workers.Uid
JOIN chb_State.WorkerDiags WorkerDiags
ON WorkerDiags.Uid = WorkerNames.Uid
LEFT OUTER 
JOIN chb_Config.Desktops Desktops
ON Desktops.WorkerUid = WorkerNames.Uid
LEFT OUTER 
JOIN chb_Config.DesktopGroups DesktopGroups
ON DesktopGroups.Uid = Desktops.DesktopGroupUid
LEFT OUTER 
JOIN chb_Config.WorkerAccountAssignments WorkerAccountAssignments
ON WorkerAccountAssignments.WorkerUid = WorkerNames.Uid
LEFT OUTER 
JOIN chb_Config.Accounts Accounts
ON Accounts.Uid = WorkerAccountAssignments.AccountUid
LEFT OUTER 
JOIN chb_State.AccountNames AccountNames
ON AccountNames.Uid = WorkerAccountAssignments.AccountUid
LEFT OUTER 
JOIN chb_State.WorkerRegistrations WorkerRegistrations
ON WorkerRegistrations.Uid = WorkerNames.Uid
LEFT OUTER JOIN chb_Config.Catalogs Catalogs
ON Catalogs.Uid = Workers.CatalogUid
LEFT OUTER JOIN DesktopUpdateManagerSchema.ProvisioningScheme ProvisioningScheme
ON ProvisioningScheme.ProvisioningSchemeUid = Catalogs.ProvisioningSchemeId
LEFT OUTER JOIN chb_State.Sessions Sessions
ON Sessions.WorkerUid = WorkerNames.Uid
AND Sessions.TrustedUserUid = Accounts.Uid
WHERE 1=1
--AND   DesktopGroups.PublishedName = 'CVW service OPS IE11'