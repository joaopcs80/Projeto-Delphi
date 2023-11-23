unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cAcaoAcesso,
  uEnum, uDTMConexao, Vcl.Imaging.pngimage, PngSpeedButton, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    QryListagemacaoAcessoId: TIntegerField;
    QryListagemdescricao: TWideStringField;
    QryListagemchave: TWideStringField;
    edtAcaoAcessoId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations}
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{$REGION 'Overrides'}

function TfrmCadAcaoAcesso.Apagar: Boolean;
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     Result:=oAcaoAcesso.Apagar;
  end;
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oAcaoAcesso.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oAcaoAcesso.Atualizar;
end;

procedure TfrmCadAcaoAcesso.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

{$ENDREGION}

{$REGION 'Botoes Novos'}

procedure TfrmCadAcaoAcesso.imgNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;

end;

procedure TfrmCadAcaoAcesso.imgAlterarClick(Sender: TObject);
begin

  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     edtacaoAcessoId.Text:=IntToStr(oAcaoAcesso.codigo);
     edtDescricao.Text   :=oAcaoAcesso.descricao;
     edtChave.Text       :=oAcaoAcesso.chave;
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadAcaoAcesso.imgSalvarClick(Sender: TObject);
begin

  if edtacaoAcessoId.Text<>EmptyStr then
     oAcaoAcesso.codigo:=StrToInt(edtacaoAcessoId.Text)
  else
     oAcaoAcesso.codigo:=0;

  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then begin
    MessageDlg('Chave já cadastrado', mtInformation, [mbok],0);
    edtChave.SetFocus;
    abort;
  end;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave     :=edtChave.Text;

  inherited;

end;

procedure TfrmCadAcaoAcesso.imgVoltarClick(Sender: TObject);
begin
  inherited;

end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadAcaoAcesso.cfg');

  if Assigned(oAcaoAcesso) then
     FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;

  oAcaoAcesso:=TAcaoAcesso.Create(DtmPrincipal.ConexaoDB);
  IndiceAtual:='descricao';
end;

procedure TfrmCadAcaoAcesso.FormShow(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadAcaoAcesso.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadAcaoAcesso.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadAcaoAcesso.cfg');

end;

{$ENDREGION}

end.
