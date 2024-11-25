unit uPessoa;

interface

uses
  Aurelius.Mapping.Attributes, Bcl.Types.Nullable,
  System.Generics.Collections, uEndereco ;

type
  {$RTTI EXPLICIT METHODS([vcPrivate..vcPublished])}
  [Enumeration(TEnumMappingType.emInteger)]
  TNaoSim = (nsNao, nsSim);

  [Entity, Automapping]
  [Sequence('SEQ_PESSOA_AURELIUS_ID')]
  [DBIndex('IDX_PESSOA_1', 'NOME,SOBRENOME')]
  [Table('PESSOA_AURELIUS')] //Pode definir o schemas também
  TPessoa = class(TObject)
  private
    [Description('ID da Tabela')]
    [Id('FId', TIdGenerator.IdentityOrSequence)]
    FID: Integer;

    [Description('Nome da Pessoa')]
    [Column('NOME', [TColumnProp.Required], 35)]
    FNome: string;

    [MinLength(5), DisplayName('Sobrenome')]
    [Description('Sobrenome da Pessoa')]
    FSobrenome: Nullable<string>;

    [Description('Data de Nascimento da Pessoa')]
    [Column('DATA_NASCIMENTO', [TColumnProp.Required])]
    FDataNascimento: TDateTime;

    [Description('Brasileiro(a): 0-Nao, 1-Sim')]
    FBrasileiro: TNaoSim;

    [DisplayName('email')] //Nome do atributo para mensagens de validação
    [EmailAddress('Você deve informar um endereço válido no campo "%0:s"')]//0:s = DisplayName
    FEmail: string;

    [ManyValuedAssociation([], CascadeTypeAllRemoveOrphan)]
    [ForeignJoinColumn('IDPESSOA', [])]
    FEndereco: TList<TEndereco>;

    [Transient]
    FIdade: Integer;

    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetSobrenome(const Value: Nullable<string>);
    procedure SetBrasileiro(const Value: TNaoSim);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: TList<TEndereco>);
    procedure SetIdade(const Value: Integer);
  public
    property ID: Integer read FID write SetID;
    property Nome: string read FNome write SetNome;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Sobrenome: Nullable<string> read FSobrenome write SetSobrenome;
    property Email: string read FEmail write SetEmail;
    property Brasileiro: TNaoSim read FBrasileiro write SetBrasileiro;
    property Endereco: TList<TEndereco> read FEndereco write SetEndereco;
    property Idade: Integer read FIdade write SetIdade;
  end;

implementation

uses
  System.Classes;

{ TPessoa }

procedure TPessoa.SetBrasileiro(const Value: TNaoSim);
begin
  FBrasileiro := Value;
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPessoa.SetEndereco(const Value: TList<TEndereco>);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPessoa.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPessoa.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TPessoa.SetSobreNome(const Value: Nullable<string>);
begin
  FSobrenome := Value;
end;

end.
