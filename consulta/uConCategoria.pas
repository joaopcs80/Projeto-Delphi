unit uConCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmConCategoria = class(TfrmTelaHerancaConsulta)
    QryListagemcategoriaId: TIntegerField;
    QryListagemdescricao: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConCategoria: TfrmConCategoria;

implementation

uses
  uDTMConexao;

{$R *.dfm}

procedure TfrmConCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdPesquisa.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\conCategoria.cfg');

end;

procedure TfrmConCategoria.FormCreate(Sender: TObject);
begin

  aCampoId    :='categoriaId';
  IndiceAtual :='descricao';

  inherited;
end;

procedure TfrmConCategoria.FormShow(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\conCategoria.cfg') then begin
    grdPesquisa.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\conCategoria.cfg');
  end;

  grdPesquisa.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\conCategoria.cfg');

end;

end.
