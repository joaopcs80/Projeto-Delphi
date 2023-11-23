unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria, uDTMConexao,
  uEnum, Vcl.Imaging.pngimage, PngSpeedButton, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    QryListagemcategoriaId: TIntegerField;
    QryListagemdescricao: TWideStringField;
    edtCategoriaId: TEdit;
    lblCategoriaId: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;
    function  Apagar:Boolean; override;
    function  Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$REGION 'OVERRIDE'}
function TfrmCadCategoria.Apagar: Boolean;
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then begin
     Result:=oCategoria.Apagar;
  end;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then
     oCategoria.codigo:=StrToInt(edtCategoriaId.Text)
  else
     oCategoria.codigo:=0;

  oCategoria.descricao:=edtDescricao.Text;

  if (EstadoDoCadastro=ecInserir) then
     Result:=oCategoria.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCategoria.Atualizar;
end;

procedure TfrmCadCategoria.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

{$ENDREGION}

{$REGION 'Botoes Novos'}

procedure TfrmCadCategoria.imgAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then begin
     edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
     edtDescricao.Text  :=oCategoria.descricao;
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;
  inherited;

end;


{$ENDREGION}

{$REGION 'Botões'}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then begin
     edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
     edtDescricao.Text  :=oCategoria.descricao;
  end
  else begin
    btnAlterar.Click;
    Abort;
  end;

  inherited;

end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCategorias.cfg');

  if Assigned(oCategoria) then
     FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;

  oCategoria:=Tcategoria.Create (dtmPrincipal.conexaoDB);
  IndiceAtual:='descricao';

end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCategorias.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCategorias.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadCategorias.cfg');

end;

{$ENDREGION}

end.
