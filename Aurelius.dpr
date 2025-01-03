program Aurelius;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  uFrmManutGrid in 'Client\View\uFrmManutGrid.pas' {FrmManutGrid},
  OracleConnectionModule in 'Sever\Units\OracleConnectionModule.pas' {FireDacOracleConnection: TDataModule},
  uPessoa in 'Client\Units\uPessoa.pas',
  uFrmLog in 'Client\View\uFrmLog.pas' {FrmLog},
  uFrmPrinc in 'Client\View\uFrmPrinc.pas' {FrmSelecaoTpManut},
  uFrmManutManual in 'Client\View\uFrmManutManual.pas' {FrmManutManual},
  uEndereco in 'Client\Units\uEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFireDacOracleConnection, FireDacOracleConnection);
  Application.CreateForm(TFrmSelecaoTpManut, FrmSelecaoTpManut);
  Application.Run;
end.
