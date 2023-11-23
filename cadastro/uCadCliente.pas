unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  uEnum, cCadCliente, uDTMConexao, RxToolEdit, uDTMVenda, cFormatarTexto, cRESTHelpers, Vcl.Imaging.jpeg,
  Vcl.ImgList, System.ImageList, cValidaCpfCnpj, System.UITypes, Vcl.Imaging.pngimage, PngSpeedButton, JvExExtCtrls, JvImage,
  Vcl.Menus;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemendereco: TWideStringField;
    QryListagemcidade: TWideStringField;
    QryListagembairro: TWideStringField;
    QryListagemestado: TWideStringField;
    QryListagemcep: TWideStringField;
    QryListagemtelefone: TWideStringField;
    QryListagememail: TWideStringField;
    QryListagemdatanascimento: TDateTimeField;
    edtNome: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEmail: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblData: TLabel;
    edtDataNascimento: TDateEdit;
    edtEstado: TLabeledEdit;
    edtCpfCnpj: TEdit;
    lblcpfcnpj: TLabel;
    edtTelefone: TEdit;
    medtCep: TMaskEdit;
    QryListagemstatusclienteId: TIntegerField;
    QryListagemcpfcnpj: TWideStringField;
    imgListLegenda: TImageList;
    lblPessoa: TLabel;
    imgExiste: TImage;
    lblStatus: TLabel;
    pnlManutencao: TPanel;
    pmLegendas: TPopupMenu;
    mniAtivo1: TMenuItem;
    mniBloqueado: TMenuItem;
    mniAtencao: TMenuItem;
    mniInativo: TMenuItem;
    Prospecto1: TMenuItem;
    edtClienteId: TMaskEdit;
    lblCodigo: TLabel;
    lkpStatusCliente: TDBLookupComboBox;
    lkpPessoa: TDBLookupComboBox;
    mniExiste: TMenuItem;
    mniNaoExiste: TMenuItem;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure medtCepExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsListagemDataChange(Sender: TObject; Field: TField);
    procedure edtEstadoExit(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure QryListagemstatusclienteIdGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure edtCpfCnpjChange(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure edtCpfCnpjExit(Sender: TObject);
    procedure medtCepChange(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyPress(Sender: TObject; var Key: Char);
    procedure btnLegendasClick(Sender: TObject);
    procedure lkpStatusClienteClick(Sender: TObject);
    procedure lkpPessoaClick(Sender: TObject);
  private
    { Private declarations }
    FCEPAtual:Integer;
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    procedure AlterarLabels;
    procedure FormatarTelefone;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation


{$R *.dfm}

{ TfrmCadCliente }

{$region 'Override'}
function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     Result:=oCliente.Apagar;
  end;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else

    oCliente.codigo:=0;

    oCliente.cpfcnpj        :=edtCpfCnpj.Text;
    oCliente.status         :=lkpStatusCliente.KeyValue;
    oCliente.pessoa         :=lkpPessoa.Text;
    oCliente.nome           :=edtNome.Text;
    oCliente.cep            :=medtCEP.Text;
    oCliente.estado         :=edtEstado.Text;
    oCliente.endereco       :=edtEndereco.Text;
    oCliente.bairro         :=edtBairro.Text;
    oCliente.cidade         :=edtCidade.Text;
    oCliente.telefone       :=edtTelefone.Text;
    oCliente.email          :=edtEmail.Text;
    oCliente.dataNascimento :=edtDataNascimento.Date;

    if (EstadoDoCadastro=ecInserir) then
      Result:=oCliente.Inserir
    else if (EstadoDoCadastro=ecAlterar) then
      Result:=oCliente.Atualizar;
end;

{$endregion}

{$REGION 'Botoes Novos'}

procedure TfrmCadCliente.imgAlterarClick(Sender: TObject);
var
pessoa : integer;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin

    if oCliente.pessoa = 'Física'  then begin
       pessoa := 1
    end
    else
    if oCliente.pessoa = 'Jurídica' then begin
       pessoa := 2
    end;

    edtClienteId.Text:=IntToStr(oCliente.codigo);
    edtNome.Text              :=oCliente.nome;
    medtCEP.Text              :=oCliente.cep;
    edtEstado.Text            :=oCliente.estado;
    edtEndereco.Text          :=oCliente.endereco;
    edtBairro.Text            :=oCliente.bairro;
    edtCidade.Text            :=oCliente.cidade;
    edtTelefone.Text          :=oCliente.telefone;
    edtEmail.Text             :=oCliente.email;
    edtDataNascimento.Date    :=oCliente.dataNascimento;
    edtCpfCnpj.Text           :=oCliente.cpfcnpj;
    lkpStatusCliente.KeyValue :=oCliente.status;
    lkpPessoa.KeyValue        :=pessoa;

    AlterarLabels;

  end
  else begin
    btnAlterar.Click;
    Abort;
  end;
  inherited;

  lkpStatusCliente.SetFocus;

end;

procedure TfrmCadCliente.imgNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  lkpStatusCliente.SetFocus;
end;

procedure TfrmCadCliente.lkpPessoaClick(Sender: TObject);
begin
  inherited;
  AlterarLabels;

  edtCpfCnpj.Text := '';
end;

procedure TfrmCadCliente.lkpStatusClienteClick(Sender: TObject);
begin
  inherited;
end;


{$ENDREGION}

{$REGION 'Botoões'}
procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
var
pessoa : integer;

begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin

  if oCliente.pessoa = 'Física'  then begin
     pessoa :=1
  end
  else
  if oCliente.pessoa = 'Jurídica' then begin
     pessoa :=2
  end;

     edtClienteId.Text:=IntToStr(oCliente.codigo);
     edtNome.Text          :=oCliente.nome;
     medtCEP.Text          :=oCliente.cep;
     edtEstado.Text        :=oCliente.estado;
     edtEndereco.Text      :=oCliente.endereco;
     edtBairro.Text        :=oCliente.bairro;
     edtCidade.Text        :=oCliente.cidade;
     edtTelefone.Text      :=oCliente.telefone;
     edtEmail.Text         :=oCliente.email;
     edtDataNascimento.Date:=oCliente.dataNascimento;
     edtCpfCnpj.Text       :=oCliente.cpfcnpj;
     lkpStatusCliente.KeyValue :=oCliente.status;
     lkpPessoa.KeyValue   :=pessoa;

     AlterarLabels;

  end
  else begin
    btnAlterar.Click;
    Abort;
  end;

  inherited;

  lkpStatusCliente.SetFocus;

end;


procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  lkpStatusCliente.SetFocus;
end;

procedure TfrmCadCliente.dtsListagemDataChange(Sender: TObject; Field: TField);
begin
  inherited;

end;

{$ENDREGION}

{$REGION 'EDTs'}

procedure TfrmCadCliente.medtCepChange(Sender: TObject);
begin
  inherited;

  if Length(SomenteNumero(medtCep.Text)) = 0 then begin
    medtCep.Text := SomenteNumero(medtCep.Text);
    medtCep.SelStart := Length(medtCep.Text);
  end
  else if Length(SomenteNumero(medtCep.Text)) <= 2 then begin
    medtCep.Text :=Copy(SomenteNumero(medtCep.Text),1,2);
    medtCep.SelStart := Length(medtCep.Text);
  end
  else if Length(SomenteNumero(medtCep.Text)) <= 5 then begin
    medtCep.Text :=Copy(SomenteNumero(medtCep.Text),1,2)
    +'.'
    +Copy(SomenteNumero(medtCep.Text),3,3);
    medtCep.SelStart := Length(medtCep.Text);
  end
  else if Length(SomenteNumero(medtCep.Text)) <= 8 then begin
    medtCep.Text :=Copy(SomenteNumero(medtCep.Text),1,2)
    +'.'
    +Copy(SomenteNumero(medtCep.Text),3,3)
    +'-'
    +Copy(SomenteNumero(medtCep.Text),6,3);
    medtCep.SelStart := Length(medtCep.Text);
  end
  else if Length(SomenteNumero(medtCep.Text)) >= 9 then begin
    medtCep.Text :=Copy(SomenteNumero(medtCep.Text),1,2)
    +'.'
    +Copy(SomenteNumero(medtCep.Text),3,3)
    +'-'
    +Copy(SomenteNumero(medtCep.Text),6,3);
    medtCep.SelStart := Length(medtCep.Text);
  end;

end;

procedure TfrmCadCliente.medtCepExit(Sender: TObject);
var
  CEP: string;
  Endereco: TStringList;
  CEPValido, CEPFoiMudado: Boolean;
  NovoCEP: Integer;

begin
  inherited;
  if Length(SomenteNumero(medtCep.Text)) = 8 then begin
    CEPValido := True;
    CEPFoiMudado := False;
    CEP := SomenteNumero(medtCep.Text);
    CEP := StringReplace(CEP, '.', '', [rfReplaceAll]);
    CEP := StringReplace(CEP, '-', '', [rfReplaceAll]);
    try
      NovoCEP := StrToInt(CEP);
      if FCEPAtual <> NovoCEP then
      begin
        FCEPAtual := NovoCEP;
        CEPFoiMudado := True;
      end;
    except
      CEPValido := False;
    end;
    if (not CEPFoiMudado) and
      ((not CEPValido) or (edtBairro.Text <> '') or (edtEndereco.Text <> '')) then begin


      Endereco := BuscarCEPNoViaCEP(CEP);
      if Endereco[0] = '' then begin
        MessageDlg('CEP Nao existe, Digite Novamente.',mtInformation,[mbok],0);
        medtCep.SetFocus;
      end
      else
      begin
        if Endereco.Count = 5 then // Checar se realmente foram recebido 5 valores.
        begin

          if Endereco[0] = '' then begin
            MessageDlg('CEP Nao existe, Digite Novamente.',mtInformation,[mbok],0);
            medtCep.SetFocus;
          end
          else
          begin
            edtEndereco.Text := Endereco[0];
            edtBairro.Text := Endereco[1];
            edtEstado.Text := Endereco[2];
            edtCidade.Text   := Endereco[3];
            edtEmail.SetFocus;
          end;
        end;
      end;

    end
    else
    begin

      if CEPValido = False then begin
        MessageDlg('CEP Nao existe, Digite Novamente.',mtInformation,[mbok],0);
      end
      else
      begin
        Endereco := BuscarCEPNoViaCEP(CEP);
        if Endereco.Count = 5 then // Checar se realmente foram recebido 5 valores.
        begin

          if Endereco[0] = '' then begin
            MessageDlg('CEP Nao existe, Digite Novamente.',mtInformation,[mbok],0);
            medtCep.SetFocus;
          end
          else
          begin
            edtEndereco.Text := Endereco[0];
            edtBairro.Text := Endereco[1];
            edtEstado.Text := Endereco[2];
            edtCidade.Text   := Endereco[3];
            edtEmail.SetFocus;
          end;
        end;
      end;

    end;
  end
  else
  if (Length(SomenteNumero(medtCep.Text)) = 0) then begin
    MessageDlg('Campo CEP Vazio, os Campos Seguintes Serão Limpos Automaticamente.',mtInformation,[mbok],0);
    edtEndereco.Text := '';
    edtBairro.Text := '';
    edtEstado.Text := '';
    edtCidade.Text   := '';
    edtEndereco.SetFocus;
  end
  else
  begin
    MessageDlg('O CEP Deve Conter 8 Dígitos', mtInformation, [mbOK],0);
    medtCep.SetFocus;
  end;
end;


procedure TfrmCadCliente.QryListagemstatusclienteIdGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text:= '';
end;

procedure TfrmCadCliente.edtEstadoExit(Sender: TObject);
begin
  inherited;
  edtEstado.Text := AnsiUpperCase(edtEstado.Text);
end;


{$ENDREGION}

{$REGION 'Forms'}
Procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCliente.cfg');

  if Assigned(oCliente) then
     FreeAndNil(oCliente);

  if Assigned(dtmVendas) then
     FreeAndNil(dtmVendas);

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;

  dtmVendas := TdtmVendas.Create(self);

  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';

end;
procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  pLegendas := True;
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCliente.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCliente.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCliente.cfg');

end;

{$ENDREGION}

{$REGION 'Formatar Telefone'}

procedure TfrmCadCliente.edtTelefoneChange(Sender: TObject);
begin
  inherited;

  if Copy(SomenteNumero(edtTelefone.Text),1,1) = '0' then begin

    if Copy(SomenteNumero(edtTelefone.Text),3,2) = '00' then begin

      if Length(SomenteNumero(edtTelefone.Text)) <= 4 then begin
      edtTelefone.Text := Copy(SomenteNumero(edtTelefone.Text),1,4);
      edtTelefone.SelStart := Length(edtTelefone.Text);
      end
      else
      if Length(SomenteNumero(edtTelefone.Text)) <= 7 then begin
      edtTelefone.Text := Copy(SomenteNumero(edtTelefone.Text),1,4)
      +' '
      +Copy(SomenteNumero(edtTelefone.Text),5,3);
      edtTelefone.SelStart := Length(edtTelefone.Text);
      end
      else
      if Length(SomenteNumero(edtTelefone.Text)) <= 11 then begin
      edtTelefone.Text := Copy(SomenteNumero(edtTelefone.Text),1,4)
      +' '
      +Copy(SomenteNumero(edtTelefone.Text),5,3)
      +' '
      +Copy(SomenteNumero(edtTelefone.Text),8,4);
      edtTelefone.SelStart := Length(edtTelefone.Text);
      end
      else
      if Length(SomenteNumero(edtTelefone.Text)) >= 12 then begin
      edtTelefone.Text := Copy(SomenteNumero(edtTelefone.Text),1,4)
      +' '
      +Copy(SomenteNumero(edtTelefone.Text),5,3)
      +' '
      +Copy(SomenteNumero(edtTelefone.Text),8,4);
      edtTelefone.SelStart := Length(edtTelefone.Text);
      end;
    end
    else
    begin

      FormatarTelefone;

    end;
  end
  else
  begin
    FormatarTelefone;
  end;

end;

procedure TfrmCadCliente.FormatarTelefone;
begin


  if Length(SomenteNumero(edtTelefone.Text)) = 0 then
  begin
    edtTelefone.Text :=  SomenteNumero(edtTelefone.Text);
  end
  else
  if Length(SomenteNumero(edtTelefone.Text)) <= 2 then
  begin
    edtTelefone.Text := '(' + Copy(SomenteNumero(edtTelefone.Text), 1, 2);
    edtTelefone.SelStart := Length(edtTelefone.Text);
  end
  else if Length(SomenteNumero(edtTelefone.Text)) <= 6 then
  begin
    edtTelefone.Text := '(' + Copy(SomenteNumero(edtTelefone.Text), 1, 2) + ')'
    + Copy(SomenteNumero(edtTelefone.Text), 3, 4);
    edtTelefone.SelStart := Length(edtTelefone.Text);
  end
  else if Length(SomenteNumero(edtTelefone.Text)) <= 10 then
  begin
    edtTelefone.Text := '(' + Copy(SomenteNumero(edtTelefone.Text), 1, 2)
    + ')'
    + Copy(SomenteNumero(edtTelefone.Text), 3, 4)
    + '-'
    + Copy(SomenteNumero(edtTelefone.Text), 7, 4);
    edtTelefone.SelStart := Length(edtTelefone.Text);
  end
  else if Length(SomenteNumero(edtTelefone.Text)) <= 11 then
  begin
    edtTelefone.Text := '(' + Copy(SomenteNumero(edtTelefone.Text), 1, 2)
    + ')'
    + Copy(SomenteNumero(edtTelefone.Text), 3, 5)
    + '-'
    + Copy(SomenteNumero(edtTelefone.Text), 8, 4);
    edtTelefone.SelStart := Length(edtTelefone.Text);
  end
  else if Length(SomenteNumero(edtTelefone.Text)) >= 12 then
  begin
    edtTelefone.Text := '(' + Copy(SomenteNumero(edtTelefone.Text), 1, 2)
    + ')'
    + Copy(SomenteNumero(edtTelefone.Text), 3, 5)
    + '-'
    + Copy(SomenteNumero(edtTelefone.Text), 8, 4);
    edtTelefone.SelStart := Length(edtTelefone.Text);
  end;
end;

procedure TfrmCadCliente.edtTelefoneExit(Sender: TObject);
begin
  inherited;

  if Copy(SomenteNumero(edtTelefone.Text),1,1) = '0' then
  begin
    if Copy(SomenteNumero(edtTelefone.Text),3,2) = '00' then
    begin
      if  Length(SomenteNumero(edtTelefone.Text)) <> 11 then
      begin
        MessageDlg('Numero Incorreto, Digite novamente!',mtInformation,[mbok],0);
        edtTelefone.SetFocus;
      end;
    end;
  end;
//  else
//  if(not(Length(SomenteNumero(edtTelefone.Text)) = 0))
//  or(not(Length(SomenteNumero(edtTelefone.Text)) = 10))
//  or(not(Length(SomenteNumero(edtTelefone.Text)) = 11))then
//  begin
//    MessageDlg('Numero Incorreto, Digite novamente!',mtInformation,[mbok],0);
//    edtTelefone.SetFocus;
//  end;
end;

{$ENDREGION}

{$REGION 'Formatar CPF/CNPJ'}

procedure TfrmCadCliente.edtCpfCnpjChange(Sender: TObject);
begin
  inherited;

  if lkpPessoa.KeyValue = 1 then begin

    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 3  then begin
      edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,3);
      edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 6  then begin
      edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,3)
      +'.'
      +Copy(SomenteNumero(edtCpfCnpj.Text),4,3);
      edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);

    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 9  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),4,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),7,3);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 11  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),4,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),7,3)
       +'-'
       +Copy(SomenteNumero(edtCpfCnpj.Text),10,2);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) >= 12  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),4,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),7,3)
       +'-'
       +Copy(SomenteNumero(edtCpfCnpj.Text),10,2);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end;

  end
  else
  if lkpPessoa.KeyValue =2 then begin

      if Length(SomenteNumero(edtCpfCnpj.Text)) <= 2  then begin
      edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2);
      edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 5  then begin
      edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2)
      +'.'
      +Copy(SomenteNumero(edtCpfCnpj.Text),3,3);
      edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);

    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 8  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),3,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),6,3);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 12  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),3,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),6,3)
       +'/'
       +Copy(SomenteNumero(edtCpfCnpj.Text),9,4);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) <= 14  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),3,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),6,3)
       +'/'
       +Copy(SomenteNumero(edtCpfCnpj.Text),9,4)
       +'-'
       +Copy(SomenteNumero(edtCpfCnpj.Text),13,2);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end
    else
    if Length(SomenteNumero(edtCpfCnpj.Text)) >= 15  then begin
       edtCpfCnpj.Text := Copy(SomenteNumero(edtCpfCnpj.Text),1,2)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),3,3)
       +'.'
       +Copy(SomenteNumero(edtCpfCnpj.Text),6,3)
       +'/'
       +Copy(SomenteNumero(edtCpfCnpj.Text),9,4)
       +'-'
       +Copy(SomenteNumero(edtCpfCnpj.Text),13,2);
       edtCpfCnpj.SelStart := Length(edtCpfCnpj.Text);
    end;

  end;

end;


{$ENDREGION}

{$REGION 'Verifica CPF/CNPJ'}

procedure TfrmCadCliente.edtCpfCnpjExit(Sender: TObject);
begin
  inherited;

  if edtCpfCnpj.Text = '' then begin
     edtNome.SetFocus;
     imgExiste.Picture  := Nil;
  end
  else begin

    if(lkpPessoa.KeyValue = 1)then begin

      if(isCPF(SomenteNumero(edtCpfCnpj.Text))= True)then
        imgListLegenda.GetBitmap(5, imgExiste.Picture.Bitmap)
      else
      if(isCPF(SomenteNumero(edtCpfCnpj.Text))= False)then
      begin
        imgListLegenda.GetBitmap(6, imgExiste.Picture.Bitmap);
        MessageDlg('CPF Nao Existe, Digite Novamente.',mtInformation,[mbOK],0);
        edtCpfCnpj.SetFocus;
      end;

    end
    else
    if(lkpPessoa.KeyValue = 2)then begin

      if(isCNPJ(SomenteNumero(edtCpfCnpj.Text))= True)then
        imgListLegenda.GetBitmap(5, imgExiste.Picture.Bitmap)
      else
      if(isCNPJ(SomenteNumero(edtCpfCnpj.Text))= False)then
      begin
        imgListLegenda.GetBitmap(6, imgExiste.Picture.Bitmap);
        MessageDlg('CNPJ Nao Existe, Digite Novamente.',mtInformation,[mbOK],0);
        edtCpfCnpj.SetFocus;
      end;

    end;

  end;

end;

{$ENDREGION}

{$REGION 'Pessoa Fisica e Juridica'}


procedure TfrmCadCliente.AlterarLabels;
begin
  if lkpPessoa.KeyValue = 1 then
  begin
    lblcpfcnpj.Caption := 'CPF';
    lblData.Caption := 'Data de Nascimento';
  end
  else if lkpPessoa.KeyValue = 2 then
  begin
    lblcpfcnpj.Caption := 'CNPJ';
    lblData.Caption := 'Fundado Em';
  end;
end;

{$ENDREGION}

{$REGION 'Status'}

procedure TfrmCadCliente.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmCadCliente.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
Btm: TBitmap;
begin
  inherited;

  if Column.FieldName = 'statusclienteId' then
  begin

  grdListagem.Canvas.FillRect(Rect);
  Btm:=TBitmap.Create;

  if Column.Field.AsString = '1' then begin
     imgListLegenda.GetBitmap(0, Btm)
  end
  else if Column.Field.AsString = '2' then begin
     imgListLegenda.GetBitmap(1, Btm)
  end
  else if Column.Field.AsString = '3' then begin
     imgListLegenda.GetBitmap(2, Btm)
  end
  else if Column.Field.AsString = '4' then  begin
     imgListLegenda.GetBitmap(3, Btm)
  end
  else if Column.Field.AsString = '5' then  begin
     imgListLegenda.GetBitmap(4, Btm)
  end;

  grdListagem.Canvas.Draw(Rect.Left, Rect.Top, Btm);
  Btm.Free;

  end;

end;

procedure TfrmCadCliente.grdListagemKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
    grdListagemDblClick(self);
  end;
end;


{$ENDREGION}

procedure TfrmCadCliente.btnLegendasClick(Sender: TObject);
begin
  inherited;
  pmLegendas.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

end.

