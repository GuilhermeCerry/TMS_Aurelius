unit uFrmManutGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, OracleConnectionModule, Vcl.StdCtrls,
  Aurelius.Drivers.Interfaces, Aurelius.Engine.DatabaseManager, Aurelius.Engine.ObjectManager,
  uFrmLog, Aurelius.Events.Manager, cxDropDownEdit, Aurelius.Criteria.Base,
  Vcl.Buttons, Aurelius.Criteria.Linq, System.SysUtils;

type
  TFrmManutGrid = class(TForm)
    pnPessoa: TPanel;
    adsPessoa: TAureliusDataset;
    dsPessoa: TDataSource;
    pnBotoes: TPanel;
    btConsultar: TButton;
    grpEndereço: TGroupBox;
    cxgrdEndereco: TcxGrid;
    cxgrdEnderecooView: TcxGridDBTableView;
    cxgrdEnderevoLvl1: TcxGridLevel;
    adsEndereco: TAureliusDataset;
    dsEndereco: TDataSource;
    cxGrdID: TcxGridDBColumn;
    cxGrdIDPessoa: TcxGridDBColumn;
    cxGrdDescricao: TcxGridDBColumn;
    adsPessoaNOME: TStringField;
    adsPessoaSOBRENOME: TStringField;
    adsPessoaDATA_NASCIMENTO: TDateField;
    adsPessoaBRASILEIRO: TIntegerField;
    adsPessoaEMAIL: TStringField;
    adsEnderecoDESCRICAO: TStringField;
    adsEnderecoID: TIntegerField;
    adsEnderecoIDPESSOA: TIntegerField;
    adsPessoaID: TIntegerField;
    adsPessoaENDERECO: TDataSetField;
    cxStyle2: TcxStyleRepository;
    ZebradoCab: TcxStyle;
    ZebradoAzul: TcxStyle;
    grpPessoa: TGroupBox;
    pnBotao: TPanel;
    cxGrid: TcxGrid;
    cxGridPessoaView1: TcxGridDBTableView;
    cxGrdPessoa_ID: TcxGridDBColumn;
    cxGrdPessoa_NOME: TcxGridDBColumn;
    cxGrdPessoa_SOBRENOME: TcxGridDBColumn;
    cxGrdPessoa_DATANASCIMENTO: TcxGridDBColumn;
    cxGrdPessoa_BRASILEIRO: TcxGridDBColumn;
    cxGrdPessoa_EMAIL: TcxGridDBColumn;
    cxGridPessoaLvl1: TcxGridLevel;
    btInsEndereco: TSpeedButton;
    btDelEndereco: TSpeedButton;
    btnDelPessoa: TSpeedButton;
    btnInsPessoa: TSpeedButton;
    lb_NomeFiltro: TLabeledEdit;
    btConsultaComFiltro: TButton;
    bt_ConsultarComFiltroEndereco: TButton;
    lb_FiltroEndereco: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btInsEnderecoClick(Sender: TObject);
    procedure btDelEnderecoClick(Sender: TObject);
    procedure btnInsPessoaClick(Sender: TObject);
    procedure btnDelPessoaClick(Sender: TObject);
    procedure adsEnderecoBeforePost(DataSet: TDataSet);
    procedure btConsultaComFiltroClick(Sender: TObject);
    procedure bt_ConsultarComFiltroEnderecoClick(Sender: TObject);
  private
    { Private declarations }
    FConnection: IDBConnection;
    Manager: TObjectManager;
    FoFrmLog: TFrmLog;
    procedure OnSqlExecuting(Args: TSqlExecutingArgs);
    procedure OnInserting(Args: TInsertingArgs);
  public
    { Public declarations }
  end;

var
  FrmManutGrid: TFrmManutGrid;

implementation

uses
  uPessoa, uEndereco, Aurelius.Mapping.Explorer;

{$R *.dfm}

procedure TFrmManutGrid.adsEnderecoBeforePost(DataSet: TDataSet);
begin
  if (adsEndereco.State in [dsInsert]) then
    adsEndereco.FieldByName('IDPESSOA').AsInteger := adsPessoa.FieldByName('ID').AsInteger;
end;

procedure TFrmManutGrid.btConsultaComFiltroClick(Sender: TObject);
var
  cFiltro: String;
begin
  cFiltro := ('%'+ UpperCase(lb_NomeFiltro.Text)+'%');
  adsPessoa.Close;
  adsPessoa.Manager := Manager;
  adsPessoa.SetSourceCriteria(
    Manager.Find<TPessoa>
      .CreateAlias('ENDERECO', 'e', TFetchMode.Eager)
      .Where(Linq['Nome'].Upper.Like(cFiltro))
      .RemovingDuplicatedEntities
  );
  adsPessoa.Open;
end;

procedure TFrmManutGrid.btConsultarClick(Sender: TObject);
begin
  adsPessoa.Close;
  adsPessoa.Manager := Manager;
  adsPessoa.SetSourceCriteria(
    Manager.Find<TPessoa>
      .CreateAlias('ENDERECO', 'e', TFetchMode.Eager)
      .RemovingDuplicatedEntities
  );
  adsPessoa.Open;
end;

procedure TFrmManutGrid.bt_ConsultarComFiltroEnderecoClick(Sender: TObject);
var
  cFiltro: String;
begin
  cFiltro := ('%'+ UpperCase(lb_FiltroEndereco.Text)+'%');
  adsPessoa.Close;
  adsPessoa.Manager := Manager;
  adsPessoa.SetSourceCriteria(
    Manager.Find<TPessoa>
      .CreateAlias('ENDERECO', 'e', TFetchMode.Eager)
      .Where(Linq['e.Descricao'].Upper.Like(cFiltro))
      .RemovingDuplicatedEntities
  );
  adsPessoa.Open;
end;

procedure TFrmManutGrid.btDelEnderecoClick(Sender: TObject);
begin
  adsEndereco.Delete;
end;

procedure TFrmManutGrid.btInsEnderecoClick(Sender: TObject);
begin
  adsEndereco.Append;
end;

procedure TFrmManutGrid.btnDelPessoaClick(Sender: TObject);
begin
  adsPessoa.Delete;
end;

procedure TFrmManutGrid.btnInsPessoaClick(Sender: TObject);
begin
  adsPessoa.Append;
end;

procedure TFrmManutGrid.FormCreate(Sender: TObject);
begin
  FConnection := TFireDacOracleConnection.CreateConnection;
  TDataBaseManager.Update(FConnection);

  Manager := TObjectManager.Create(FConnection);

  FoFrmLog := TFrmLog.Create(nil);
  FoFrmLog.Show;

  TMappingExplorer.Default.Events.OnSQLExecuting.Subscribe(OnSqlExecuting);
  TMappingExplorer.Default.Events.OnInserting.Subscribe(OnInserting);
end;

procedure TFrmManutGrid.OnSqlExecuting(Args: TSqlExecutingArgs);
var
  Param: TDBParam;
begin
  FoFrmLog.mmLog.Lines.Add(Args.Sql);

  if Args.Params <> nil then
    for Param in Args.Params do
      begin
      FoFrmLog.mmLog.Lines.Add(Param.ToString);
    end;

  FoFrmLog.mmLog.Lines.Add(
    '------------------------------------------------------------'
  );
end;

procedure TFrmManutGrid.OnInserting(Args: TInsertingArgs);
begin
  if (Args.Entity.ToString = 'TEndereco') then
    begin
    ShowMessage('Inserindo: ' + Args.Entity.ToString);
  end;
end;


procedure TFrmManutGrid.FormDestroy(Sender: TObject);
begin
  Manager.Free;

  if Assigned(FoFrmLog) then
    FoFrmLog.Free;
end;

end.
