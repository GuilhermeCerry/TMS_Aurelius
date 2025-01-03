unit OracleConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.FireDac,
  FireDAC.Dapt,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Aurelius.Sql.Oracle, Aurelius.Schema.Oracle, Aurelius.Comp.Connection,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.TDBX, FireDAC.Phys.TDBXDef,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef;

type
  TFireDacOracleConnection = class(TDataModule)
    Connection: TFDConnection;
    AureliusConnectionOracle: TAureliusConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;

  end;

var
  FireDacOracleConnection: TFireDacOracleConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses 
  Aurelius.Drivers.Base;

{$R *.dfm}

class function TFireDacOracleConnection.CreateConnection: IDBConnection;
var
  oParametrosBD: TStringList;
  i: Integer;
begin
  oParametrosBD := TStringList.Create;
  try
    try
//      oParametrosBD.Add('Database=127.0.0.1:1521/ORCL4');
//      oParametrosBD.Add('User_name=VIASOFT');
//      oParametrosBD.Add('Password=VIASOFT');
//      oParametrosBD.Add('CharacterSet=WE8ISO8859P1');
//
//      for i := 1 to oParametrosBD.Count - 1 do
//        FireDacOracleConnection.Connection.Params.Strings[i] := oParametrosBD[i];
//      FDManager.AddConnectionDef('ORACLE_SID', 'Ora', oParametrosBD);
    Except
      On e: Exception do
        raise Exception.Create('Erro conex�o: '+e.Message);
    end;
  finally
    FreeAndNil(oParametrosBD);
  end;
  Result := FireDacOracleConnection.AureliusConnectionOracle.CreateConnection;
end;

class function TFireDacOracleConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;



end.
