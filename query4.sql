SELECT Catalogs.Uid, Catalogs.UUID, Catalogs.DisplayName, Catalogs.Description, Catalogs.AllocationType, Catalogs.ProvisioningType, Catalogs.PersistUserChanges, ProvisioningScheme.ProvisioningSchemeUid, ProvisioningScheme.ProvisioningSchemeName, ProvisioningScheme.CpuCount, ProvisioningScheme.MemoryMB, ProvisioningScheme.DiskSize 
FROM chb_Config.Catalogs Catalogs
LEFT OUTER JOIN DesktopUpdateManagerSchema.ProvisioningScheme ProvisioningScheme
ON ProvisioningScheme.ProvisioningSchemeUid = Catalogs.ProvisioningSchemeId