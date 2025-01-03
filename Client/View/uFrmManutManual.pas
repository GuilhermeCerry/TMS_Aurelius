unit uFrmManutManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uPessoa,
  Aurelius.Engine.ObjectManager, OracleConnectionModule, Aurelius.Events.Manager,
  Aurelius.Drivers.Interfaces, Vcl.ComCtrls, Aurelius.Mapping.Metadata;

type
  TFrmManutManual = class(TForm)
    pnPrinc: TPanel;
    lb_Nome: TLabeledEdit;
    lb_SobreNome: TLabeledEdit;
    cb_Brasileiro: TComboBox;
    lb_Brasileiro: TLabel;
    btSalvar: TButton;
    lb_ID: TLabeledEdit;
    dt_DataNascimento: TDateTimePicker;
    lbl_DtNascimento: TLabel;
    lb_Email: TLabeledEdit;
    btAtualizar: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    Pessoa: TPessoa;
    FConnection: IDBConnection;
    Manager: TObjectManager;
  public
    { Public declarations }
    procedure ConsultarPessoa(const AnId: Integer);
  end;

var
  FrmManutManual: TFrmManutManual;

implementation

uses
  Aurelius.Engine.DatabaseManager, Aurelius.Criteria.Base, System.DateUtils,
  Bcl.Validation.Interfaces, Aurelius.Mapping.Explorer;

{$R *.dfm}

procedure TFrmManutManual.btAtualizarClick(Sender: TObject);
var
  enBrasileiro: TNaoSim;
begin
  case cb_Brasileiro.ItemIndex of
    0: enBrasileiro := nsNao;
    1: enBrasileiro := nsSim;
  end;

  Pessoa := TPessoa.Create;
  Pessoa.ID := StrToInt(lb_ID.Text);
  Pessoa.Nome := lb_Nome.Text;
  Pessoa.SobreNome := lb_SobreNome.Text;
  Pessoa.DataNascimento := StrToDate(FormatDatetime('dd/mm/yyyy', dt_DataNascimento.Date));
  Pessoa.Email := lb_Email.Text;
  Pessoa.Brasileiro := enBrasileiro;
  Manager.Flush(Pessoa);
  Pessoa.Free;
end;

procedure TFrmManutManual.btSalvarClick(Sender: TObject);
var
  enBrasileiro: TNaoSim;
  ValidationResult: IManagerValidationResult;
  Error: IValidationError;
begin

  case cb_Brasileiro.ItemIndex of
    0: enBrasileiro := nsNao;
    1: enBrasileiro := nsSim;
  end;

  try
    Pessoa := TPessoa.Create;
    Pessoa.Nome := lb_Nome.Text;
    Pessoa.SobreNome := lb_SobreNome.Text;
    Pessoa.DataNascimento := StrToDate(FormatDatetime('dd/mm/yyyy', dt_DataNascimento.Date));
    Pessoa.Email := lb_Email.Text;
    Pessoa.Brasileiro := enBrasileiro;
    Pessoa.Idade := YearsBetween( Date, Pessoa.DataNascimento);
//    Manager.Validate(Pessoa); --Valida��o manual
//    Manager.ValidationsEnabled := False; Desativa valida��es
    Manager.Save(Pessoa);
    Manager.Flush;
    ConsultarPessoa(Pessoa.Id);
  except
    on E: EEntityValidationException do
    begin
      for ValidationResult in E.Results do
        for Error in ValidationResult.Errors do
          ShowMessage('  ' + Error.ErrorMessage);
    end;
  end;
end;

procedure TFrmManutManual.ConsultarPessoa(const AnId: Integer);
begin
  Pessoa := Manager.Find<TPessoa>(AnId);

  try
    //Evita criar cds para consultar dados, deixando mais facil o entendimento
    lb_ID.Text := Pessoa.ID.ToString;
    lb_Nome.Text := Pessoa.Nome;
    lb_SobreNome.Text := Pessoa.Sobrenome;
    dt_DataNascimento.Date := Pessoa.DataNascimento;
    lb_Email.Text := Pessoa.Email;
    cb_Brasileiro.ItemIndex := Ord(Pessoa.Brasileiro);
  finally
    Pessoa.Free;
  end;
end;

procedure TFrmManutManual.FormCreate(Sender: TObject);
begin
  FConnection := TFireDacOracleConnection.CreateConnection;
  TDataBaseManager.Update(FConnection);

  Manager := TObjectManager.Create(FConnection);
end;

end.
