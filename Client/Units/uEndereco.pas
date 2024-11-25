unit uEndereco;

interface

uses
   Aurelius.Mapping.Attributes, Aurelius.Types.Proxy;

type
  [Entity, Automapping]
  [Sequence('GEN_ID_PESSOA_AURELIUS')]
  [Table('ENDERECO_AURELIUS')]
  TEndereco = class(TObject)
  private
    [Id('FId', TIdGenerator.IdentityOrSequence)]
    FID: Integer;

    [Column('DESCRICAO', [TColumnProp.Required], 60)]
    FDescricao: string;

//    [Association([TAssociationProp.Lazy], [])]
//    [ForeignJoinColumn('FK_ENDERECO_PESSOA', [TColumnProp.Required], 'ID')]
//    [JoinColumn('ID_PESSOA', [TColumnProp.Required])]
//    FIDPessoa: Proxy<TPessoa>;
    FIDPessoa: Integer;

    procedure SetDescricao(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetIDPessoa(const Value: Integer);
  public
    property ID: Integer read FID write SetID;
    property IDPessoa: Integer read FIDPessoa write SetIDPessoa;
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TEndereco }

procedure TEndereco.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TEndereco.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TEndereco.SetIDPessoa(const Value: Integer);
begin
  FIDPessoa := Value;
end;


end.
