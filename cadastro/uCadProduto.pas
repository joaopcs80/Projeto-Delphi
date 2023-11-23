unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, RxCurrEdit,
  cCadProduto, uEnum, uDTMConexao, uConCategoria, Vcl.Menus, Vcl.Imaging.pngimage, PngSpeedButton, Vcl.Imaging.jpeg,
  JvExExtCtrls, JvImage;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    QryListagemprodutoId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdescricao: TWideStringField;
    QryListagemvalor: TFloatField;
    QryListagemquantidade: TFloatField;
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricaoCategoria: TWideStringField;
    edtDescricao: TMemo;
    Label1: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    QryCategoriacategoriaId: TIntegerField;
    QryCategoriadescricao: TWideStringField;
    Label4: TLabel;
    btnIncluirCategoria: TSpeedButton;
    btnPesquisaCategoria: TSpeedButton;
    pnlImagem: TPanel;
    imgImagem: TImage;
    ppmImagem: TPopupMenu;
    CarregarImagem1: TMenuItem;
    LimparImagem1: TMenuItem;
    Panel1: TPanel;
    imgConsulta: TImage;
    QryListagemfoto: TBlobField;
    lblCódigo: TLabel;
    edtProdutoId: TEdit;
    edtNome: TEdit;
    lblNome: TLabel;
    imgFundoItem: TImage;
    lblProduto: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCategoriaClick(Sender: TObject);
    procedure btnPesquisaCategoriaClick(Sender: TObject);
    procedure LimparImagem1Click(Sender: TObject);
    procedure CarregarImagem1Click(Sender: TObject);
    procedure grdListagemCellClick(Column: TColumn);
    procedure imgNovoClick(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    oProduto:TProduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
    frmCadProduto: TfrmCadProduto;

implementation

uses
  cFuncao, uPrincipal, uCadCategorias;

{$R *.dfm}

{ TfrmCadProduto }

{$region 'Override'}
function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     Result:=oProduto.Apagar;
  end;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoId.Text<>EmptyStr then
     oProduto.codigo:=StrToInt(edtProdutoId.Text)
  else
     oProduto.codigo:=0;

  oProduto.nome               :=edtNome.Text;
  oProduto.descricao          :=edtDescricao.Text;
  oProduto.categoriaId        :=lkpCategoria.KeyValue;
  oProduto.valor              :=edtValor.Value;
  oProduto.quantidade         :=edtQuantidade.Value;

  if imgImagem.Picture.Bitmap.Empty then
    oProduto.Foto.Assign(nil)
  else
    oProduto.Foto.Assign(imgImagem.Picture);

  if (EstadoDoCadastro=ecInserir) then
     Result:=oProduto.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oProduto.Atualizar;
end;

procedure TfrmCadProduto.LimparImagem1Click(Sender: TObject);
begin
  inherited;
  TFuncao.LimparImagem(imgImagem);
end;

procedure TfrmCadProduto.CarregarImagem1Click(Sender: TObject);
begin
  inherited;
  TFuncao.CarregarImagem(imgImagem);
end;

procedure TfrmCadProduto.btnIncluirCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmPrincipal.conexaoDB);
  QryCategoria.Refresh;
end;

procedure TfrmCadProduto.btnPesquisaCategoriaClick(Sender: TObject);
begin
  inherited;
  try
    frmConCategoria:=TfrmConCategoria.Create(self);

    if lkpCategoria.KeyValue<>null then
       frmConCategoria.aIniciarPesquisaId:=lkpCategoria.KeyValue;

    frmConCategoria.ShowModal;

    if frmConCategoria.aRetornarIdSelecionado<>Unassigned then //não Atribuido
       lkpCategoria.KeyValue:=frmConCategoria.aRetornarIdSelecionado;
  finally
    frmConCategoria.Release;
  end;
end;

{$ENDREGION}

{$REGION 'Botoes Novos'}

procedure TfrmCadProduto.imgNovoClick(Sender: TObject);
begin
  inherited;

  edtNome.SetFocus;

  imgImagem.Picture := Nil;

end;

procedure TfrmCadProduto.imgAlterarClick(Sender: TObject);
begin
  inherited;
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     edtProdutoId.Text       :=IntToStr(oProduto.codigo);
     edtNome.Text            :=oProduto.nome;
     edtDescricao.Text       :=oProduto.descricao;
     lkpCategoria.KeyValue   :=oProduto.categoriaId;
     edtValor.Value          :=oProduto.valor;
     edtQuantidade.Value     :=oProduto.quantidade;
     imgImagem.Picture.Assign(oProduto.foto);
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;
end;

procedure TfrmCadProduto.imgFecharClick(Sender: TObject);
begin
  inherited;

end;

{$ENDREGION}

{$REGION 'Botões'}

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     edtProdutoId.Text       :=IntToStr(oProduto.codigo);
     edtNome.Text            :=oProduto.nome;
     edtDescricao.Text       :=oProduto.descricao;
     lkpCategoria.KeyValue   :=oProduto.categoriaId;
     edtValor.Value          :=oProduto.valor;
     edtQuantidade.Value     :=oProduto.quantidade;
     imgImagem.Picture.Assign(oProduto.foto);
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;

  edtNome.SetFocus;

  imgImagem.Picture := Nil;

end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadProduto.cfg');

  QryCategoria.Close;
  if Assigned(oProduto) then
     FreeAndNil(oProduto);

end;


procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;

  oProduto:=TProduto.Create(dtmPrincipal.conexaoDB);

  IndiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;

  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     imgConsulta.Picture.Assign(oProduto.foto);lblProduto.Caption := oProduto.Nome;
  end
  else begin
    Abort;
  end;

  QryCategoria.Open;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadProduto.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadProduto.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadProduto.cfg');

end;

{$ENDREGION}

{$REGION 'Ver Imagem Ao Selecionar Produto'}

procedure TfrmCadProduto.grdListagemCellClick(Column: TColumn);
begin
  inherited;
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     imgConsulta.Picture.Assign(oProduto.foto);
     lblProduto.Caption := oProduto.Nome;
  end
  else begin
    Abort;
  end;
end;

procedure TfrmCadProduto.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

{$ENDREGION}

end.
