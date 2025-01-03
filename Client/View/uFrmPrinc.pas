unit uFrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmManutGrid, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmSelecaoTpManut = class(TForm)
    pnPrinc: TPanel;
    grpPrinc: TGroupBox;
    btPessoaGrid: TButton;
    btPessoaManual: TButton;
    ed_IdPessoa: TLabeledEdit;
    bt_Consultar: TButton;
    procedure btPessoaGridClick(Sender: TObject);
    procedure btPessoaManualClick(Sender: TObject);
    procedure bt_ConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecaoTpManut: TFrmSelecaoTpManut;

implementation

uses
  uFrmManutManual;

{$R *.dfm}

procedure TFrmSelecaoTpManut.btPessoaGridClick(Sender: TObject);
var
  oFrmManutGrid: TFrmManutGrid;
begin
  oFrmManutGrid := TFrmManutGrid.Create(Application);

  oFrmManutGrid.ShowModal;

  FreeAndNil(oFrmManutGrid);
end;

procedure TFrmSelecaoTpManut.btPessoaManualClick(Sender: TObject);
var
  oFrmManutManual: TFrmManutManual;
begin
  oFrmManutManual := TFrmManutManual.Create(Application);

  oFrmManutManual.ShowModal;

  FreeAndNil(oFrmManutManual);
end;

procedure TFrmSelecaoTpManut.bt_ConsultarClick(Sender: TObject);
var
  oFrmManutManual: TFrmManutManual;
begin
  oFrmManutManual := TFrmManutManual.Create(Application);

  oFrmManutManual.ConsultarPessoa(StrToInt(ed_IdPessoa.Text));
  oFrmManutManual.ShowModal;

  FreeAndNil(oFrmManutManual);
end;

end.
