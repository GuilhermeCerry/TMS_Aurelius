object FireDacOracleConnection: TFireDacOracleConnection
  OldCreateOrder = True
  Height = 198
  Width = 282
  object Connection: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=127.0.0.1:1521/ORCL4'
      'Password=VIASOFT'
      'User_Name=VIASOFT'
      'CharacterSet=UTF8')
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    Left = 64
    Top = 8
  end
  object AureliusConnectionOracle: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = Connection
    SQLDialect = 'Oracle'
    Left = 64
    Top = 64
  end
end
