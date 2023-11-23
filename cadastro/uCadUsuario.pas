unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uEnum, cCadUsuario, cAcaoAcesso, Vcl.Imaging.pngimage, PngSpeedButton, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage;

type
  TfrmCadUsuario = class(TfrmTelaHeranca)
    QryListagemusuarioID: TIntegerField;
    QryListagemNome: TWideStringField;
    QryListagemSenha: TWideStringField;
    edtNome: TLabeledEdit;
    edtUsuarioId: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsListagemDataChange(Sender: TObject; Field: TField);
    procedure imgNovoClick(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    oUsuario:TUsuario;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses uDTMConexao;

{ TfrmCadUsuario }

{$REGION 'Overrides'}

function TfrmCadUsuario.Apagar: Boolean;
begin
  if oUsuario.Selecionar(QryListagem.FieldByName('usuarioID').AsInteger) then begin
     Result:=oUsuario.Apagar;
  end;
end;

function TfrmCadUsuario.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oUsuario.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oUsuario.Atualizar;

  TAcaoAcesso.PreencherUsuariosVsAcoes(dtmPrincipal.conexaoDB);
end;

procedure TfrmCadUsuario.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

{$ENDREGION}

{$REGION 'Botoes Novos'}

procedure TfrmCadUsuario.imgNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.imgAlterarClick(Sender: TObject);
begin
  inherited;
  if oUsuario.Selecionar(QryListagem.FieldByName('usuarioID').AsInteger) then begin
     edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
     edtNome.Text     :=oUsuario.nome;
     edtSenha.Text    :=oUsuario.senha;
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;
end;

{$ENDREGION}

{$REGION 'Botoões'}

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(QryListagem.FieldByName('usuarioID').AsInteger) then begin
     edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
     edtNome.Text     :=oUsuario.nome;
     edtSenha.Text    :=oUsuario.senha;
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin
  if oUsuario.UsuarioExiste(edtNome.Text) then begin
    MessageDlg('Usuário já cadastrado', mtInformation, [mbok],0);
    edtNome.SetFocus;
    abort;
  end;

  if edtUsuarioId.Text<>EmptyStr then
     oUsuario.codigo:=StrToInt(edtUsuarioId.Text)
  else
     oUsuario.codigo:=0;

  oUsuario.nome :=edtNome.Text;
  oUsuario.senha:=edtSenha.Text;

  inherited;
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.dtsListagemDataChange(Sender: TObject; Field: TField);
begin
  inherited;

end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuario.cfg');

  if Assigned(oUsuario) then
     FreeAndNil(oUsuario);

end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;

  oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';

end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuario.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuario.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuario.cfg');

end;

{$ENDREGION}

end.
