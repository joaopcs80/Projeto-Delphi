unit cCadCliente;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     cFormatarTexto;

type
  TCliente = class
  private
    ConexaoDB:TZConnection;
    F_clienteId:Integer;  //Int
    F_status:Integer;
    F_pessoa:string;
    F_nome:String; //VarChar
    F_endereco: string;
    F_cidade:String;
    F_bairro: String;
    F_estado: string;
    F_cep: String;
    F_telefone: string;
    F_email: string;
    F_cpfcnpj: string;
    F_dataNascimento: TDateTime;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
  published
    property codigo        :Integer    read F_clienteId      write F_clienteId;
    property status        :Integer    read F_status         write F_status;
    property pessoa        :string     read F_pessoa         write F_pessoa;
    property nome          :string     read F_nome           write F_nome;
    property endereco      :string     read F_endereco       write F_endereco;
    property cidade        :string     read F_cidade         write F_cidade;
    property bairro        :string     read F_bairro         write F_bairro;
    property estado        :string     read F_estado         write F_Estado;
    property cpfcnpj       :string     read F_cpfcnpj        write F_cpfcnpj;
    property cep           :string     read F_cep            write F_Cep;
    property telefone      :string     read F_telefone       write F_telefone;
    property email         :string     read F_email          write F_email;
    property dataNascimento:TDateTime  read F_dataNascimento write F_dataNascimento;

  end;

implementation


{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao:TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TCliente.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+IntToStr(F_clienteId)+#13+
                'Descri��o: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM clientes '+
                ' WHERE clienteId=:clienteId ');
    Qry.ParamByName('clienteId').AsInteger :=F_clienteId;
    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCliente.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE clientes '+
                '   SET nome            =:nome '+
                '       ,statusclienteId=:statusclienteId '+
                '       ,pessoa         =:pessoa '+
                '       ,endereco       =:endereco '+
                '       ,cidade         =:cidade '+
                '       ,bairro         =:bairro '+
                '       ,estado         =:estado '+
                '       ,cep            =:cep '+
                '       ,cpfcnpj        =:cpfcnpj '+
                '       ,telefone       =:telefone '+
                '       ,email          =:email '+
                '       ,dataNascimento =:dataNascimento '+
                ' WHERE clienteId=:clienteId ');
    Qry.ParamByName('clienteId').AsInteger       :=Self.F_clienteId;
    Qry.ParamByName('statusclienteId').AsInteger :=Self.F_status;
    Qry.ParamByName('Pessoa').AsString           :=Self.F_pessoa;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=Self.F_bairro;
    Qry.ParamByName('estado').AsString           :=Self.F_estado;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('cpfcnpj').AsString          :=Self.F_cpfcnpj;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('email').AsString            :=Self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime :=Self.F_dataNascimento;


    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCliente.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO clientes (nome, '+
                '                      statusclienteId, '+
                '                      pessoa, '+
                '                      endereco, '+
                '                      cidade,  '+
                '                      bairro,  '+
                '                      estado, '+
                '                      cep, '+
                '                      cpfcnpj, '+
                '                      telefone, '+
                '                      email, '+
                '                      datanascimento) '+
                ' VALUES              (:nome, '+
                '                      :statusclienteId, '+
                '                      :pessoa, '+
                '                      :endereco, '+
                '                      :cidade,  '+
                '                      :bairro,  '+
                '                      :estado, '+
                '                      :cep, '+
                '                      :cpfcnpj, '+
                '                      :telefone, '+
                '                      :email, '+
                '                      :datanascimento)' );

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('statusclienteId').AsInteger :=Self.F_status;
    Qry.ParamByName('pessoa').AsString           :=Self.F_pessoa;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=Self.F_bairro;
    Qry.ParamByName('estado').AsString           :=Self.F_estado;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('cpfcnpj').AsString          :=Self.F_cpfcnpj;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('email').AsString            :=Self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime :=Self.F_dataNascimento;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT clienteId,'+
                '       statusclienteId, '+
                '       pessoa, '+
                '       nome, '+
                '       endereco, '+
                '       cidade, '+
                '       bairro, '+
                '       estado, '+
                '       cep, '+
                '       cpfcnpj, '+
                '       telefone, '+
                '       email, '+
                '       datanascimento '+
                '  FROM clientes '+
                ' WHERE clienteId=:clienteId');
    Qry.ParamByName('clienteId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_clienteId     := Qry.FieldByName('clienteId').AsInteger;
      Self.F_status        := Qry.FieldByName('statusclienteId').AsInteger;
      Self.F_pessoa        := Qry.FieldByName('pessoa').AsString;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_endereco      := Qry.FieldByName('endereco').AsString;
      Self.F_cidade        := Qry.FieldByName('cidade').AsString;
      Self.F_bairro        := Qry.FieldByName('bairro').AsString;
      Self.F_estado        := Qry.FieldByName('estado').AsString;
      Self.F_cep           := Qry.FieldByName('cep').AsString;
      Self.F_cpfcnpj       := Qry.FieldByName('cpfcnpj').AsString;
      Self.F_telefone      := Qry.FieldByName('telefone').AsString;
      Self.F_email         := Qry.FieldByName('email').AsString;
      Self.F_dataNascimento:= Qry.FieldByName('datanascimento').AsDateTime;

    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;
{$endregion}

end.
